//
//  ZYJTravelModel.h
//  TRProject
//
//  Created by summer on 16/7/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TravelExtraModel,TravelDataModel;
@interface ZYJTravelModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray<TravelDataModel *> *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, copy) NSString *raReferer;

@property (nonatomic, strong) TravelExtraModel *extra;

@end
@interface TravelExtraModel : NSObject

@property (nonatomic, assign) NSInteger raSwitch;

@end

@interface TravelDataModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *viewAuthorUrl;

@property (nonatomic, copy) NSString *lastpost;

@property (nonatomic, assign) NSInteger digestLevel;

@property (nonatomic, copy) NSString *replys;

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, copy) NSString *likes;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *viewUrl;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *photo;

@property (nonatomic, assign) NSInteger views;

@end

