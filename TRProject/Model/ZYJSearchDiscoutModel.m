//
//  ZYJSearchDiscoutModel.m
//  TRProject
//
//  Created by summer on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJSearchDiscoutModel.h"

@implementation ZYJSearchDiscoutModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"raSwitch":@"ra_switch"};
}
@end
@implementation SearchDiscountDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"lastminutes" : [SearchDiscountDataLastminutesModel class]};
}
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"isRa":@"is_ra",
             @"traceSwitch":@"trace_switch"};
}

@end


@implementation SearchDiscountDataLastminutesModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id",
             @"firstPub":@"first_pub",
             @"endDate":@"end_date",
             @"lastminuteDes":@"lastminute_des",
             @"buyPrice":@"buy_price",
             @"selfUse":@"self_use",
             @"perpertyTodayNew":@"perperty_today_new",
             @"saleCount":@"sale_count",
             @"firstpayEndTime":@"firstpay_end_time",
             @"listPrice":@"list_price"};
}

@end


