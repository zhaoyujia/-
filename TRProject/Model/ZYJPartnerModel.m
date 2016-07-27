//
//  ZYJPartnerModel.m
//  TRProject
//
//  Created by summer on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJPartnerModel.h"

@implementation ZYJPartnerModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data" : [PartnerDataModel class]};
}
@end
@implementation PartnerExtraModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"raSwitch":@"ra_switch"};
}
@end


@implementation PartnerDataModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id",
             @"publishTime":@"publish_time",
             @"startTime":@"start_time",
             @"replyNum":@"reply_num",
             @"citysStr":@"citys_str",
             @"appviewUrl":@"appview_url",
             @"endTime":@"end_time"};
}
@end


