//
//  ZYJDiscussModel.h
//  TRProject
//
//  Created by summer on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DiscussExtraModel,DiscussDataModel;
@interface ZYJDiscussModel : UITableViewController

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray<DiscussDataModel *> *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, strong) DiscussExtraModel *extra;

@end
@interface DiscussExtraModel : NSObject

@property (nonatomic, assign) NSInteger raSwitch;

@end

@interface DiscussDataModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *replyTime;

@property (nonatomic, assign) NSInteger isBest;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *userId;

@property (nonatomic, copy) NSString *forum;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<NSString *> *bigpicArr;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, assign) NSInteger replyNum;

@property (nonatomic, copy) NSString *forumId;

@property (nonatomic, copy) NSString *appviewUrl;

@property (nonatomic, assign) NSInteger isUot;

@end

