//
//  ZYJSearchViewModel.m
//  TRProject
//
//  Created by summer on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJSearchViewModel.h"
#import "ZYJNetManager.h"
@implementation ZYJSearchViewModel

- (void)getDataWithRequestMode:(VMRequestMode)requestMode cityStr:(NSString *)cityStr completionHandler:(void(^)(NSError *error))completionHandler{
    NSInteger tmpPage = 1;
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page + 1;
    }
    _dataTask = [ZYJNetManager getSearchDiscountWithPage:tmpPage cityStr:cityStr completionHandler:^(ZYJSearchDiscoutModel *model, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }else{
            if (requestMode == VMRequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.data.lastminutes];
            _page += 1;
            _hasMore = model.data.lastminutes.count != 0;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

#pragma mark - lazyLoad
- (NSMutableArray<SearchDiscountDataLastminutesModel*> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<SearchDiscountDataLastminutesModel*> alloc] init];
    }
    return _dataList;
}

#pragma mark - methods
- (NSInteger)rowNumber{
    return self.dataList.count;
}

- (NSURL *)picForRow:(NSInteger)row{
    return self.dataList[row].pic.yx_URL;
}

- (NSString *)titleForRow:(NSInteger)row{
    return self.dataList[row].title;
}

- (NSString *)departureTimeForRow:(NSInteger)row{
    return self.dataList[row].departureTime;
}

- (NSString *)lastminuteDesForRow:(NSInteger)row{
    return self.dataList[row].lastminuteDes;
}

- (NSString *)priceForRow:(NSInteger)row{
    NSString *price = self.dataList[row].price;
    NSString *Price = [price substringWithRange:NSMakeRange(4, [price length] - 11)];
    return [Price stringByAppendingString:@"元起"];
}

- (NSURL *)URLForRow:(NSInteger)row{
    return self.dataList[row].url.yx_URL;
}

@end
