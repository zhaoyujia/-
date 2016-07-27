//
//  ZYJSpcialSubjectModel.h
//  TRProject
//
//  Created by summer on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SpecialSubjectExtraModel,SpecialSubjectDataModel;
@interface ZYJSpcialSubjectModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray<SpecialSubjectDataModel *> *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, strong) SpecialSubjectExtraModel *extra;

@end
@interface SpecialSubjectExtraModel : NSObject

@property (nonatomic, assign) NSInteger raSwitch;

@end

@interface SpecialSubjectDataModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *photo;

@end

