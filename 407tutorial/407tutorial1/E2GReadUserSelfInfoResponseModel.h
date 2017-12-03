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
#import <AWSCore/AWSCore.h>
#import "E2GReadUserSelfInfoResponseModel_UserID.h"
#import "E2GReadUserSelfInfoResponseModel_Gender.h"
#import "E2GReadUserSelfInfoResponseModel_NickName.h"
#import "E2GReadUserSelfInfoResponseModel_RegisterDate.h"
#import "E2GReadUserSelfInfoResponseModel_UserEmail.h"
#import "E2GReadUserSelfInfoResponseModel_AccountValid.h"
#import "E2GReadUserSelfInfoResponseModel_UserPhone.h"
#import "E2GReadUserSelfInfoResponseModel_AccountType.h"
#import "E2GReadUserSelfInfoResponseModel_EndpointArn.h"
#import "E2GReadUserSelfInfoResponseModel_ImgFileName.h"

 
@interface E2GReadUserSelfInfoResponseModel : AWSModel

@property (nonatomic, strong) E2GReadUserSelfInfoResponseModel_UserID *userID;


@property (nonatomic, strong) E2GReadUserSelfInfoResponseModel_AccountValid *accountValid;


@property (nonatomic, strong) E2GReadUserSelfInfoResponseModel_Gender *gender;


@property (nonatomic, strong) E2GReadUserSelfInfoResponseModel_NickName *nickName;


@property (nonatomic, strong) E2GReadUserSelfInfoResponseModel_RegisterDate *registerDate;


@property (nonatomic, strong) E2GReadUserSelfInfoResponseModel_UserEmail *userEmail;


@property (nonatomic, strong) E2GReadUserSelfInfoResponseModel_UserPhone *userPhone;


@property (nonatomic, strong) E2GReadUserSelfInfoResponseModel_AccountType *accountType;


@property (nonatomic, strong) E2GReadUserSelfInfoResponseModel_EndpointArn *endpointArn;


@property (nonatomic, strong) E2GReadUserSelfInfoResponseModel_ImgFileName *imgFileName;


@end
