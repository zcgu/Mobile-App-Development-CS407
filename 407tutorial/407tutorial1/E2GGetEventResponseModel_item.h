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
#import "E2GGetEventResponseModel_item_UserID2.h"
#import "E2GGetEventResponseModel_item_Friend.h"
#import "E2GGetEventResponseModel_item_Range.h"
#import "E2GGetEventResponseModel_item_UserID.h"
#import "E2GGetEventResponseModel_item_Longitude.h"
#import "E2GGetEventResponseModel_item_JoinTime.h"
#import "E2GGetEventResponseModel_item_EventID.h"
#import "E2GGetEventResponseModel_item_Description.h"
#import "E2GGetEventResponseModel_item_Location.h"
#import "E2GGetEventResponseModel_item_CancelTime.h"
#import "E2GGetEventResponseModel_item_PublishTime.h"
#import "E2GGetEventResponseModel_item_Latitude.h"
#import "E2GGetEventResponseModel_item_Valid.h"
#import "E2GGetEventResponseModel_item_EndTime.h"
#import "E2GGetEventResponseModel_item_Food.h"

 
@interface E2GGetEventResponseModel_item : AWSModel

@property (nonatomic, strong) E2GGetEventResponseModel_item_UserID *userID;


@property (nonatomic, strong) E2GGetEventResponseModel_item_EventID *eventID;


@property (nonatomic, strong) E2GGetEventResponseModel_item_PublishTime *publishTime;


@property (nonatomic, strong) E2GGetEventResponseModel_item_EndTime *endTime;


@property (nonatomic, strong) E2GGetEventResponseModel_item_Range *range;


@property (nonatomic, strong) E2GGetEventResponseModel_item_Food *food;


@property (nonatomic, strong) E2GGetEventResponseModel_item_Friend *friend;


@property (nonatomic, strong) E2GGetEventResponseModel_item_Location *location;


@property (nonatomic, strong) E2GGetEventResponseModel_item_UserID2 *userID2;


@property (nonatomic, strong) E2GGetEventResponseModel_item_Latitude *latitude;


@property (nonatomic, strong) E2GGetEventResponseModel_item_Longitude *longitude;


@property (nonatomic, strong) E2GGetEventResponseModel_item_Valid *valid;


@property (nonatomic, strong) E2GGetEventResponseModel_item_Description *_description;


@property (nonatomic, strong) E2GGetEventResponseModel_item_JoinTime *joinTime;


@property (nonatomic, strong) E2GGetEventResponseModel_item_CancelTime *cancelTime;


@end
