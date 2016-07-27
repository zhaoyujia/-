//
//  ZYJSpcialSubjectModel.m
//  TRProject
//
//  Created by summer on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJSpcialSubjectModel.h"

@implementation ZYJSpcialSubjectModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data" : [SpecialSubjectDataModel class]};
}
@end


@implementation SpecialSubjectExtraModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"raSwitch":@"ra_switch"};
}
@end


@implementation SpecialSubjectDataModel

@end


