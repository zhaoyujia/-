//
//  ZYJSearchViewModel.h
//  TRProject
//
//  Created by summer on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "ZYJSearchDiscoutModel.h"
@interface ZYJSearchViewModel : TRBaseViewModel

- (void)getDataWithRequestMode:(VMRequestMode)requestMode cityStr:(NSString *)cityStr completionHandler:(void(^)(NSError *error))completionHandler;

@property (nonatomic, getter=isHasMore, readonly) BOOL hasMore;

@property (nonatomic) NSInteger page;

@property (nonatomic) NSMutableArray<SearchDiscountDataLastminutesModel*> *dataList;

@property (nonatomic) NSInteger rowNumber;

- (NSURL *)picForRow:(NSInteger) row;

- (NSString *)titleForRow:(NSInteger) row;

- (NSString *)departureTimeForRow:(NSInteger) row;

- (NSString *)lastminuteDesForRow:(NSInteger) row;

- (NSString *)priceForRow:(NSInteger) row;

- (NSURL *)URLForRow:(NSInteger) row;

@end
