/*
 Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */
 

#import "E2GEatgetherClient.h"
#import <AWSCore/AWSCore.h>
#import <AWSCore/AWSSignature.h>
#import <AWSCore/AWSSynchronizedMutableDictionary.h>

#import "E2GAddFriendAcceptResponseModel.h"
#import "E2GAddFriendAcceptRequestModel.h"
#import "E2GAddFriendAddRequestModel.h"
#import "E2GAddFriendAddResponseModel.h"
#import "E2GAddFriendDeclineResponseModel.h"
#import "E2GAddFriendDeclineRequestModel.h"
#import "E2GAddFriendSearchResponseModel.h"
#import "E2GAddFriendSearchRequestModel.h"
#import "E2GCancelEventRequestModel.h"
#import "E2GCancelEventResponseModel.h"
#import "E2GCheckRegisterResponseModel.h"
#import "E2GCheckRegisterRequestModel.h"
#import "E2GCreateEventResponseModel.h"
#import "E2GCreateEventRequestModel.h"
#import "E2GEditMyProfileRequestModel.h"
#import "E2GEditMyProfileResponseModel.h"
#import "E2GGetBlockFriendResponseModel.h"
#import "E2GGetBlockFriendRequestModel.h"
#import "E2GGetEventRequestModel.h"
#import "E2GGetEventResponseModel.h"
#import "E2GJoinEventRequestModel.h"
#import "E2GJoinEventResponseModel.h"
#import "E2GReadPasswordRequestModel.h"
#import "E2GReadPasswordResponseModel.h"
#import "E2GReadUserSelfInfoResponseModel.h"
#import "E2GReadUserSelfInfoRequestModel.h"
#import "E2GSetBlockFriendResponseModel.h"
#import "E2GSetBlockFriendRequestModel.h"
#import "E2GSnsRegisterResponseModel.h"
#import "E2GSnsRegisterRequestModel.h"
#import "E2GUserContactRequestModel.h"
#import "E2GUserContactResponseModel.h"
#import "E2GUserContactFriendRequestRequestModel.h"
#import "E2GUserContactFriendRequestResponseModel.h"

@interface AWSAPIGatewayClient()

// Networking
@property (nonatomic, strong) NSURLSession *session;

// For requests
@property (nonatomic, strong) NSURL *baseURL;

// For responses
@property (nonatomic, strong) NSDictionary *HTTPHeaderFields;
@property (nonatomic, assign) NSInteger HTTPStatusCode;

- (AWSTask *)invokeHTTPRequest:(NSString *)HTTPMethod
                     URLString:(NSString *)URLString
                pathParameters:(NSDictionary *)pathParameters
               queryParameters:(NSDictionary *)queryParameters
              headerParameters:(NSDictionary *)headerParameters
                          body:(id)body
                 responseClass:(Class)responseClass;

@end

@interface E2GEatgetherClient()

@property (nonatomic, strong) AWSServiceConfiguration *configuration;

@end

@interface AWSServiceConfiguration()

@property (nonatomic, strong) AWSEndpoint *endpoint;

@end

@implementation E2GEatgetherClient

@synthesize configuration = _configuration;

static AWSSynchronizedMutableDictionary *_serviceClients = nil;

+ (instancetype)defaultClient {
    AWSServiceConfiguration *serviceConfiguration = nil;
    if ([AWSServiceManager defaultServiceManager].defaultServiceConfiguration) {
        serviceConfiguration = AWSServiceManager.defaultServiceManager.defaultServiceConfiguration;
    } else {
        serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUnknown
                                                           credentialsProvider:nil];
    }

    static E2GEatgetherClient *_defaultClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultClient = [[E2GEatgetherClient alloc] initWithConfiguration:serviceConfiguration];
    });

    return _defaultClient;
}

+ (void)registerClientWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _serviceClients = [AWSSynchronizedMutableDictionary new];
    });
    [_serviceClients setObject:[[E2GEatgetherClient alloc] initWithConfiguration:configuration]
                        forKey:key];
}

+ (instancetype)clientForKey:(NSString *)key {
    return [_serviceClients objectForKey:key];
}

+ (void)removeClientForKey:(NSString *)key {
    [_serviceClients removeObjectForKey:key];
}

- (instancetype)init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"`- init` is not a valid initializer. Use `+ defaultClient` or `+ clientForKey:` instead."
                                 userInfo:nil];
    return nil;
}

- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration {
    if (self = [super init]) {
        _configuration = [configuration copy];

        NSString *URLString = @"https://lmpoezlwl6.execute-api.us-east-1.amazonaws.com/5";
        if ([URLString hasSuffix:@"/"]) {
            URLString = [URLString substringToIndex:[URLString length] - 1];
        }
        _configuration.endpoint = [[AWSEndpoint alloc] initWithRegion:_configuration.regionType
                                                              service:AWSServiceAPIGateway
                                                                  URL:[NSURL URLWithString:URLString]];

        AWSSignatureV4Signer *signer = [AWSSignatureV4Signer signerWithCredentialsProvider:_configuration.credentialsProvider
                                                                                  endpoint:_configuration.endpoint];

        _configuration.baseURL = _configuration.endpoint.URL;
        _configuration.requestInterceptors = @[[AWSNetworkingRequestInterceptor new], signer];
    }
    
    return self;
}

- (AWSTask *)e2gaddfriendacceptPost:(E2GAddFriendAcceptRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2gaddfriendaccept"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GAddFriendAcceptResponseModel class]];
}

- (AWSTask *)e2gaddfriendaddPost:(E2GAddFriendAddRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2gaddfriendadd"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GAddFriendAddResponseModel class]];
}

- (AWSTask *)e2gaddfrienddeclinePost:(E2GAddFriendDeclineRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2gaddfrienddecline"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GAddFriendDeclineResponseModel class]];
}

- (AWSTask *)e2gaddfriendsearchPost:(E2GAddFriendSearchRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2gaddfriendsearch"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GAddFriendSearchResponseModel class]];
}

- (AWSTask *)e2gcanceleventPost:(E2GCancelEventRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2gcancelevent"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GCancelEventResponseModel class]];
}

- (AWSTask *)e2gcheckregisterPost:(E2GCheckRegisterRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2gcheckregister"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GCheckRegisterResponseModel class]];
}

- (AWSTask *)e2gcreateeventPost:(E2GCreateEventRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2gcreateevent"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GCreateEventResponseModel class]];
}

- (AWSTask *)e2geditmyprofilefunctionPost:(E2GEditMyProfileRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2geditmyprofilefunction"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GEditMyProfileResponseModel class]];
}

- (AWSTask *)e2ggetblockfriendPost:(E2GGetBlockFriendRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2ggetblockfriend"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GGetBlockFriendResponseModel class]];
}

- (AWSTask *)e2ggeteventPost:(E2GGetEventRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2ggetevent"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GGetEventResponseModel class]];
}

- (AWSTask *)e2gjoineventPost:(E2GJoinEventRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2gjoinevent"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GJoinEventResponseModel class]];
}

- (AWSTask *)e2greadpasswordPost:(E2GReadPasswordRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2greadpassword"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GReadPasswordResponseModel class]];
}

- (AWSTask *)e2greaduserselfinfoPost:(E2GReadUserSelfInfoRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2greaduserselfinfo"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GReadUserSelfInfoResponseModel class]];
}

- (AWSTask *)e2gsetblockfriendPost:(E2GSetBlockFriendRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2gsetblockfriend"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GSetBlockFriendResponseModel class]];
}

- (AWSTask *)e2gsnsregisterPost:(E2GSnsRegisterRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2gsnsregister"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GSnsRegisterResponseModel class]];
}

- (AWSTask *)e2gusercontactPost:(E2GUserContactRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2gusercontact"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GUserContactResponseModel class]];
}

- (AWSTask *)e2gusercontactfriendrequestPost:(E2GUserContactFriendRequestRequestModel *)body {
    NSDictionary *headerParameters = @{
                                       @"Content-Type": @"application/json",
                                       @"Accept": @"application/json",
                                       
                                       };
    NSDictionary *queryParameters = @{
                                      
                                      };
    NSDictionary *pathParameters = @{
                                     
                                     };
    
    return [self invokeHTTPRequest:@"POST"
                         URLString:@"/e2gusercontactfriendrequest"
                    pathParameters:pathParameters
                   queryParameters:queryParameters
                  headerParameters:headerParameters
                              body:body
                     responseClass:[E2GUserContactFriendRequestResponseModel class]];
}



@end
