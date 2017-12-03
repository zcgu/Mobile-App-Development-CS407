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
 

#import "E2GGetEventResponseModel_item.h"

@implementation E2GGetEventResponseModel_item

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"userID": @"UserID",
             @"eventID": @"EventID",
             @"publishTime": @"PublishTime",
             @"endTime": @"EndTime",
             @"range": @"Range",
             @"food": @"Food",
             @"friend": @"Friend",
             @"location": @"Location",
             @"userID2": @"UserID2",
             @"latitude": @"Latitude",
             @"longitude": @"Longitude",
             @"valid": @"Valid",
             @"_description": @"Description",
             @"joinTime": @"JoinTime",
             @"cancelTime": @"CancelTime"
             };
}

+ (NSValueTransformer *)userIDJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_UserID class]];
}

+ (NSValueTransformer *)eventIDJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_EventID class]];
}

+ (NSValueTransformer *)publishTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_PublishTime class]];
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_EndTime class]];
}

+ (NSValueTransformer *)rangeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_Range class]];
}

+ (NSValueTransformer *)foodJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_Food class]];
}

+ (NSValueTransformer *)friendJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_Friend class]];
}

+ (NSValueTransformer *)locationJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_Location class]];
}

+ (NSValueTransformer *)userID2JSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_UserID2 class]];
}

+ (NSValueTransformer *)latitudeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_Latitude class]];
}

+ (NSValueTransformer *)longitudeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_Longitude class]];
}

+ (NSValueTransformer *)validJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_Valid class]];
}

+ (NSValueTransformer *)_descriptionJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_Description class]];
}

+ (NSValueTransformer *)joinTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_JoinTime class]];
}

+ (NSValueTransformer *)cancelTimeJSONTransformer {
    return [NSValueTransformer awsmtl_JSONDictionaryTransformerWithModelClass:[E2GGetEventResponseModel_item_CancelTime class]];
}

@end
