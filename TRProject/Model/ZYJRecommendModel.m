//
//  ZYJRecommendModel.m
//  TRProject
//
//  Created by summer on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJRecommendModel.h"

@implementation ZYJRecommendModel

@end
@implementation RecommendExtraModel

@end


@implementation RecommendDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"discount" : [RecommendDataDiscountModel class], @"subject" : [RecommendDataSubjectModel class], @"discount_subject" : [RecommendDataDiscount_SubjectModel class], @"slide" : [RecommendDataSlideModel class]};
}
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"raReferer":@"ra_referer"};
}


@end


@implementation RecommendDataCheckinModel

@end


@implementation RecommendDataSeckillingModel

@end


@implementation Seckill_Object

@end


@implementation RecommendDataDiscountModel

@end


@implementation RecommendDataSubjectModel

@end


@implementation RecommendDataDiscount_SubjectModel

@end


@implementation RecommendDataSlideModel

@end







