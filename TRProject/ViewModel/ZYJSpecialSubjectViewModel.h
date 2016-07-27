//
//  ZYJSpecialSubjectViewModel.h
//  TRProject
//
//  Created by summer on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "ZYJSpcialSubjectModel.h"
@interface ZYJSpecialSubjectViewModel : TRBaseViewModel

@property (nonatomic, getter=isHasMore, readonly) BOOL hasMore;

@property (nonatomic) NSInteger page;

@property (nonatomic) NSMutableArray<SpecialSubjectDataModel*> *dataList;

@property (nonatomic) NSInteger rowNumber;

- (NSURL *)iconForRow:(NSInteger) row;

- (NSString *)titleForRow:(NSInteger) row;

- (NSURL *)URLForRow:(NSInteger) row;

@end
