//
//  ZYJSpecialSubjectViewModel.m
//  TRProject
//
//  Created by summer on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJSpecialSubjectViewModel.h"
#import "ZYJNetManager.h"
@implementation ZYJSpecialSubjectViewModel
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 1;
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page + 1;
    }
    _dataTask = [ZYJNetManager getSpecialSubjectWithPage:tmpPage completionHandler:^(ZYJSpcialSubjectModel *model, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }else{
            if (requestMode == VMRequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.data];
            _page += 1;
            _hasMore = model.data.count == 20;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

#pragma mark - lazyLoad

- (NSMutableArray<SpecialSubjectDataModel*> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<SpecialSubjectDataModel*> alloc] init];
    }
    return _dataList;
}

#pragma mark - methods

- (NSInteger)rowNumber{
    return self.dataList.count;
}

- (NSURL *)iconForRow:(NSInteger)row{
    return self.dataList[row].photo.yx_URL;
}

- (NSString *)titleForRow:(NSInteger)row{
    return self.dataList[row].title;
}

- (NSURL *)URLForRow:(NSInteger)row{
    return self.dataList[row].url.yx_URL;
}

@end
