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
 

#import <Foundation/Foundation.h>
#import <AWSAPIGateway/AWSAPIGateway.h>

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

/**
 The service client object.
 */
@interface E2GEatgetherClient: AWSAPIGatewayClient

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 If you want to enable AWS Signature, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let serviceClient = E2GEatgetherClient.defaultClient()

 *Objective-C*

     E2GEatgetherClient *serviceClient = [E2GEatgetherClient defaultClient];

 @return The default service client.
 */
+ (instancetype)defaultClient;

/**
 Creates a service client with the given service configuration and registers it for the key.

 If you want to enable AWS Signature, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         E2GEatgetherClient.registerClientWithConfiguration(configuration, forKey: "USWest2E2GEatgetherClient")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [E2GEatgetherClient registerClientWithConfiguration:configuration forKey:@"USWest2E2GEatgetherClient"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let serviceClient = E2GEatgetherClient(forKey: "USWest2E2GEatgetherClient")

 *Objective-C*

     E2GEatgetherClient *serviceClient = [E2GEatgetherClient clientForKey:@"USWest2E2GEatgetherClient"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerClientWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerClientWithConfiguration:forKey:` before invoking this method. If `+ registerClientWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         E2GEatgetherClient.registerClientWithConfiguration(configuration, forKey: "USWest2E2GEatgetherClient")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [E2GEatgetherClient registerClientWithConfiguration:configuration forKey:@"USWest2E2GEatgetherClient"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let serviceClient = E2GEatgetherClient(forKey: "USWest2E2GEatgetherClient")

 *Objective-C*

     E2GEatgetherClient *serviceClient = [E2GEatgetherClient clientForKey:@"USWest2E2GEatgetherClient"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)clientForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeClientForKey:(NSString *)key;

/**
 
 
 @param body 
 
 return type: E2GAddFriendAcceptResponseModel *
 */
- (AWSTask *)e2gaddfriendacceptPost:(E2GAddFriendAcceptRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GAddFriendAddResponseModel *
 */
- (AWSTask *)e2gaddfriendaddPost:(E2GAddFriendAddRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GAddFriendDeclineResponseModel *
 */
- (AWSTask *)e2gaddfrienddeclinePost:(E2GAddFriendDeclineRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GAddFriendSearchResponseModel *
 */
- (AWSTask *)e2gaddfriendsearchPost:(E2GAddFriendSearchRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GCancelEventResponseModel *
 */
- (AWSTask *)e2gcanceleventPost:(E2GCancelEventRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GCheckRegisterResponseModel *
 */
- (AWSTask *)e2gcheckregisterPost:(E2GCheckRegisterRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GCreateEventResponseModel *
 */
- (AWSTask *)e2gcreateeventPost:(E2GCreateEventRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GEditMyProfileResponseModel *
 */
- (AWSTask *)e2geditmyprofilefunctionPost:(E2GEditMyProfileRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GGetBlockFriendResponseModel *
 */
- (AWSTask *)e2ggetblockfriendPost:(E2GGetBlockFriendRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GGetEventResponseModel *
 */
- (AWSTask *)e2ggeteventPost:(E2GGetEventRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GJoinEventResponseModel *
 */
- (AWSTask *)e2gjoineventPost:(E2GJoinEventRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GReadPasswordResponseModel *
 */
- (AWSTask *)e2greadpasswordPost:(E2GReadPasswordRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GReadUserSelfInfoResponseModel *
 */
- (AWSTask *)e2greaduserselfinfoPost:(E2GReadUserSelfInfoRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GSetBlockFriendResponseModel *
 */
- (AWSTask *)e2gsetblockfriendPost:(E2GSetBlockFriendRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GSnsRegisterResponseModel *
 */
- (AWSTask *)e2gsnsregisterPost:(E2GSnsRegisterRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GUserContactResponseModel *
 */
- (AWSTask *)e2gusercontactPost:(E2GUserContactRequestModel *)body;

/**
 
 
 @param body 
 
 return type: E2GUserContactFriendRequestResponseModel *
 */
- (AWSTask *)e2gusercontactfriendrequestPost:(E2GUserContactFriendRequestRequestModel *)body;

@end
