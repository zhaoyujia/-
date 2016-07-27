//
//  ZYJTravelModel.m
//  TRProject
//
//  Created by summer on 16/7/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJTravelModel.h"

@implementation ZYJTravelModel


+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data" : [TravelDataModel class]};
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"raReferer":@"ra_referer"};
}
@end
@implementation TravelExtraModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"raSwitch":@"ra_switch"};
}
@end


@implementation TravelDataModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id",
             @"viewAuthorUrl":@"view_author_url",
             @"":@"digest_level",
             @"userId":@"user_id",
             @"viewUrl":@"view_url"};
}
@end


