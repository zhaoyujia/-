//
//  ZYJPartnerModel.h
//  TRProject
//
//  Created by summer on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PartnerExtraModel,PartnerDataModel;
@interface ZYJPartnerModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray<PartnerDataModel *> *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, strong) PartnerExtraModel *extra;

@end
@interface PartnerExtraModel : NSObject

@property (nonatomic, assign) NSInteger raSwitch;

@end

@interface PartnerDataModel : NSObject

@property (nonatomic, copy) NSString *endTime;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, assign) NSInteger replys;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *citysStr;

@property (nonatomic, copy) NSString *startTime;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, assign) NSInteger views;

@property (nonatomic, copy) NSString *appviewUrl;

@end

