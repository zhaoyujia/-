//
//  ZYJDiscussViewModel.h
//  TRProject
//
//  Created by summer on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRBaseViewModel.h"
#import "ZYJDiscussModel.h"
@interface ZYJDiscussViewModel : TRBaseViewModel

@property (nonatomic, getter=isHasMore, readonly) BOOL hasMore;

@property (nonatomic) NSInteger page;

@property (nonatomic) NSMutableArray<DiscussDataModel*> *dataList;

@property (nonatomic) NSInteger rowNumber;

- (NSURL *)avatarForRow:(NSInteger) row;

- (NSString *)authorForRow:(NSInteger) row;

- (NSMutableArray<NSString*> *)bigPicForRow:(NSInteger) row;

- (NSString *)titleForRow:(NSInteger) row;

- (NSString *)forumForRow:(NSInteger) row;

- (NSString *)replyTimeForRow:(NSInteger) row;

- (NSInteger)replyNumForRow:(NSInteger) row;

- (NSURL *)URLForRow:(NSInteger) row;

- (UIImage *)replyTimeIcon;

- (UIImage *)replyNumIcon;

@end
