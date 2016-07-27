//
//  ZYJSearchModel.m
//  TRProject
//
//  Created by summer on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJSearchModel.h"

@implementation ZYJSearchModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"raReferer":@"ra_referer"};
}
@end

@implementation SearchExtraModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"raSwitch":@"ra_switch"};
}

@end


@implementation SearchDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"entry" : [SearchDataEntryModel class]};
}

@end


@implementation SearchDataEntryModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id",
             @"parentParentname":@"parent_parentname",
             @"hasMguide":@"has_mguide"};
}
@end


