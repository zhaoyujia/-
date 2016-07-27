//
//  ZYJTravelViewModel.h
//  TRProject
//
//  Created by summer on 16/7/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "ZYJTravelModel.h"
@interface ZYJTravelViewModel :TRBaseViewModel
@property (nonatomic) NSInteger page;

@property (nonatomic, getter=isHasMore, readonly) BOOL hasMore;

@property (nonatomic) NSMutableArray<TravelDataModel*> *dataList;

@property (nonatomic) NSInteger rowNumber;

- (NSURL *)iconForRow:(NSInteger) row;

- (NSString *)titleForRow:(NSInteger) row;

- (NSString *)userNameForRow:(NSInteger) row;

- (NSInteger)viewsForRow:(NSInteger) row;

- (NSString *)replysForRow:(NSInteger) row;

- (NSURL *)viewURLForRow:(NSInteger) row;
@end
