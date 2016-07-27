//
//  ZYJRecommendModel.h
//  TRProject
//
//  Created by summer on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecommendExtraModel,RecommendDataModel,RecommendDataCheckinModel,RecommendDataSeckillingModel,Seckill_Object,RecommendDataDiscountModel,RecommendDataSubjectModel,RecommendDataDiscount_SubjectModel,RecommendDataSlideModel;
@interface ZYJRecommendModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) RecommendDataModel *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, copy) NSString *raReferer;

@property (nonatomic, strong) RecommendExtraModel *extra;

@end
@interface RecommendExtraModel : NSObject

@property (nonatomic, assign) NSInteger ra_switch;

@end

@interface RecommendDataModel : NSObject

@property (nonatomic, copy) NSString *search;

@property (nonatomic, strong) NSArray *mguide;

@property (nonatomic, strong) NSArray<RecommendDataDiscount_SubjectModel *> *discount_subject;

@property (nonatomic, strong) RecommendDataSeckillingModel *seckilling;

@property (nonatomic, strong) RecommendDataCheckinModel *checkin;

@property (nonatomic, strong) NSArray<RecommendDataSubjectModel *> *subject;

@property (nonatomic, strong) NSArray<RecommendDataDiscountModel *> *discount;

@property (nonatomic, strong) NSArray<RecommendDataSlideModel *> *slide;

@end

@interface RecommendDataCheckinModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *url;

@end

@interface RecommendDataSeckillingModel : NSObject

@property (nonatomic, strong) Seckill_Object *seckill_object;

@property (nonatomic, assign) NSInteger seckill_switch;

@end

@interface Seckill_Object : NSObject

@end

@interface RecommendDataDiscountModel : NSObject

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *end_date;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *priceoff;

@property (nonatomic, copy) NSString *photo;

@end

@interface RecommendDataSubjectModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *photo;

@end

@interface RecommendDataDiscount_SubjectModel : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *photo;

@end

@interface RecommendDataSlideModel : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *photo;

@end

