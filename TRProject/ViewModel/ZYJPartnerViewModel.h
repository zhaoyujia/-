//
//  ZYJPartnerViewModel.h
//  TRProject
//
//  Created by summer on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "ZYJPartnerModel.h"
@interface ZYJPartnerViewModel : TRBaseViewModel

- (void)getDataWithRequestMode:(VMRequestMode)requestMode cityStr:(NSInteger)cityStr endTime:(NSInteger)endTime startTime:(NSInteger)startTime completionHandler:(void(^)(NSError *error))completionHandler;

@property (nonatomic, getter=isHasMore, readonly) BOOL hasMore;

@property (nonatomic) NSInteger page;

@property (nonatomic) NSMutableArray<PartnerDataModel*> *dataList;

@property (nonatomic) NSInteger rowNumber;

- (NSString *)cityStrForRow:(NSInteger) row;

- (NSString *)titleForRow:(NSInteger) row;

- (NSString *)usernameForRow:(NSInteger) row;

- (NSURL *)URLForRow:(NSInteger) row;

- (NSInteger)replysForRow:(NSInteger) row;

- (NSInteger)viewsForRow:(NSInteger) row;

- (NSString *)startTimeForRow:(NSInteger) row;

- (NSString *)endTimeForRow:(NSInteger) row;

@end
