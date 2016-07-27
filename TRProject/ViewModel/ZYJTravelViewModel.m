//
//  ZYJTravelViewModel.m
//  TRProject
//
//  Created by summer on 16/7/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJTravelViewModel.h"
#import "ZYJNetManager.h"
@implementation ZYJTravelViewModel
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 0;
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page + 1;
    }
    _dataTask = [ZYJNetManager getRecommendWithPage:tmpPage completionHandler:^(ZYJTravelModel *model, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }else{
            if (requestMode == VMRequestModeRefresh) {
                [self.dataList removeAllObjects];
                _page = 0;
            }
            if (requestMode == VMRequestModeMore) {
                [self.dataList addObjectsFromArray:model.data];
                _page += 1;
            }
            _hasMore = model.data.count == 10;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
#pragma mark - lazyLoad
- (NSMutableArray<TravelDataModel*> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<TravelDataModel*> alloc] init];
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
- (NSString *)userNameForRow:(NSInteger)row{
    return self.dataList[row].username;
}

- (NSString *)replysForRow:(NSInteger)row{
    return self.dataList[row].replys;
}

- (NSInteger)viewsForRow:(NSInteger)row{
    return self.dataList[row].views;
}

- (NSURL *)viewURLForRow:(NSInteger)row{
    return self.dataList[row].viewUrl.yx_URL;
}




@end
