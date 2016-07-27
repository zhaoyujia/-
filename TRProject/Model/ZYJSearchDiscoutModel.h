//
//  ZYJSearchDiscoutModel.h
//  TRProject
//
//  Created by summer on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SearchDiscountDataModel,SearchDiscountDataLastminutesModel;
@interface ZYJSearchDiscoutModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) SearchDiscountDataModel *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, copy) NSString *raReferer;

@end
@interface SearchDiscountDataModel : NSObject

@property (nonatomic, copy) NSString *orderName;

@property (nonatomic, copy) NSString *sequence;

@property (nonatomic, copy) NSString *kw;

@property (nonatomic, strong) NSArray *recommend;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, copy) NSString *isRa;

@property (nonatomic, copy) NSString *orderValue;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) NSArray<SearchDiscountDataLastminutesModel *> *lastminutes;

@property (nonatomic, copy) NSString *traceSwitch;

@end

@interface SearchDiscountDataLastminutesModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *departureTime;

@property (nonatomic, copy) NSString *productType;

@property (nonatomic, copy) NSString *booktype;

@property (nonatomic, assign) NSInteger firstPub;

@property (nonatomic, copy) NSString *endDate;

@property (nonatomic, copy) NSString *feature;

@property (nonatomic, copy) NSString *lastminuteDes;

@property (nonatomic, copy) NSString *buyPrice;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, assign) NSInteger selfUse;

@property (nonatomic, assign) NSInteger perpertyTodayNew;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *saleCount;

@property (nonatomic, copy) NSString *firstpayEndTime;

@property (nonatomic, copy) NSString *listPrice;

@end

