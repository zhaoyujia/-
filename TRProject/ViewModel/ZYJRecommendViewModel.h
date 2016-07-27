//
//  ZYJRecommendViewModel.h
//  TRProject
//
//  Created by summer on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "ZYJRecommendModel.h"
@interface ZYJRecommendViewModel :TRBaseViewModel

- (void)getDataWithCompletionHandler:(void(^)(NSError *error))completionHandler;

@property (nonatomic) ZYJRecommendModel *dataList;

//首页第一个cell内容

@property (nonatomic) NSInteger slideRowNumber;

- (NSURL *)slideIconForRow:(NSInteger) row;

- (NSURL *)slideURLForRow:(NSInteger) row;

//首页第二个cell内容

- (NSURL *)subjectIconForRow:(NSInteger) row;

- (NSURL *)subjectURLForRow:(NSInteger)row;

//首页第三个cell内容

- (NSURL *)discountSubjectIcon;

- (NSURL *)discountSubjectURL;

@property (nonatomic) NSInteger discountRowNumber;

@property (nonatomic) NSArray<NSURL*> *iconsURL;

- (NSURL *)discountIconForRow:(NSInteger) row;

- (NSString *)discountTitleForRow:(NSInteger) row;

- (NSString *)discountPriceOffForRow:(NSInteger) row;

- (NSString *)discountPricForRow:(NSInteger) row;

- (NSURL *)discountURLForRow:(NSInteger) row;

@end
