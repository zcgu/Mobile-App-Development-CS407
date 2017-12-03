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
 

#import "E2GReadUserSelfInfoResponseModel.h"

@implementation E2GReadUserSelfInfoResponseModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"userID": @"UserID",
             @"accountValid": @"AccountValid",
             @"gender": @"Gender",
             @"nickName": @"NickName",
             @"registerDate": @"RegisterDate",
             @"userEmail": @"UserEmail",
             @"userPhone": @"UserPhone",
             @"accountType": @"AccountType",
             @"endpointArn": @"EndpointArn",
             @"imgFileName": @"ImgFileName"
             };
}

+ (NSValueTransformer *)userIDJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GReadUserSelfInfoResponseModel_UserID class]];
}

+ (NSValueTransformer *)accountValidJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GReadUserSelfInfoResponseModel_AccountValid class]];
}

+ (NSValueTransformer *)genderJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GReadUserSelfInfoResponseModel_Gender class]];
}

+ (NSValueTransformer *)nickNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GReadUserSelfInfoResponseModel_NickName class]];
}

+ (NSValueTransformer *)registerDateJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GReadUserSelfInfoResponseModel_RegisterDate class]];
}

+ (NSValueTransformer *)userEmailJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GReadUserSelfInfoResponseModel_UserEmail class]];
}

+ (NSValueTransformer *)userPhoneJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GReadUserSelfInfoResponseModel_UserPhone class]];
}

+ (NSValueTransformer *)accountTypeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GReadUserSelfInfoResponseModel_AccountType class]];
}

+ (NSValueTransformer *)endpointArnJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GReadUserSelfInfoResponseModel_EndpointArn class]];
}

+ (NSValueTransformer *)imgFileNameJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GReadUserSelfInfoResponseModel_ImgFileName class]];
}

@end
