//
//  ZYJDiscussModel.m
//  TRProject
//
//  Created by summer on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJDiscussModel.h"

@implementation ZYJDiscussModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data" : [DiscussDataModel class]};
}
@end
@implementation DiscussExtraModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"raSwitch":@"ra_switch"};
}

@end


@implementation DiscussDataModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id",
             @"replyTime":@"reply_time",
             @"isBest":@"is_best",
             @"userId":@"user_id",
             @"bigpicArr":@"bigpic_arr",
             @"replyNum":@"reply_num",
             @"forumId":@"forum_id",
             @"appviewUrl":@"appview_url",
             @"isUot":@"is_uot"};
}
@end


