//
//  ZYJSearchModel.h
//  TRProject
//
//  Created by summer on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SearchExtraModel,SearchDataModel,SearchDataEntryModel;
@interface ZYJSearchModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) SearchDataModel *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, copy) NSString *raReferer;

@property (nonatomic, strong) SearchExtraModel *extra;

@end
@interface SearchExtraModel : NSObject

@property (nonatomic, assign) NSInteger raSwitch;

@end

@interface SearchDataModel : NSObject

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, strong) NSArray<SearchDataEntryModel *> *entry;

@end

@interface SearchDataEntryModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *label;

@property (nonatomic, assign) NSInteger beennumber;

@property (nonatomic, assign) NSInteger parentid;

@property (nonatomic, copy) NSString *parentParentname;

@property (nonatomic, copy) NSString *beenstr;

@property (nonatomic, assign) BOOL hasMguide;

@property (nonatomic, copy) NSString *enname;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *parentname;

@property (nonatomic, copy) NSString *cnname;

@property (nonatomic, assign) NSInteger grade;

@property (nonatomic, copy) NSString *photo;

@end

