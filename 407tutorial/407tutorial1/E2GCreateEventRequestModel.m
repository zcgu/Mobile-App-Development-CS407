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
 

#import "E2GCreateEventRequestModel.h"

@implementation E2GCreateEventRequestModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"userID": @"UserID",
             @"eventID": @"EventID",
             @"publishTime": @"PublishTime",
             @"endTime": @"EndTime",
             @"range": @"Range",
             @"foodStr": @"FoodStr",
             @"friendStr": @"FriendStr",
             @"location": @"Location",
             @"userID2": @"UserID2",
             @"latitude": @"Latitude",
             @"longitude": @"Longitude",
             @"valid": @"Valid",
             @"_description": @"Description",
             @"joinTime": @"JoinTime",
             @"cancelTime": @"CancelTime",
             @"operation": @"operation"
             };
}

@end
