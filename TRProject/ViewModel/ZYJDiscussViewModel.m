//
//  ZYJDiscussViewModel.m
//  TRProject
//
//  Created by summer on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJDiscussViewModel.h"
#import "ZYJNetManager.h"
@implementation ZYJDiscussViewModel

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 1;
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page + 1;
    }
    _dataTask = [ZYJNetManager getDiscussWithPage:tmpPage completionHandler:^(ZYJDiscussModel *model, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }else{
            if (requestMode == VMRequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.data];
            _page += 1;
            _hasMore = model.data.count >= 10;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

#pragma mark - lazyLoad
- (NSMutableArray<DiscussDataModel*> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray alloc] init];
    }
    return _dataList;
}

#pragma mark - methods
- (NSInteger)rowNumber{
    return self.dataList.count;
}

- (NSURL *)avatarForRow:(NSInteger) row{
    return self.dataList[row].avatar.yx_URL;
}

- (NSString *)authorForRow:(NSInteger)row{
    return self.dataList[row].author;
}

//- (NSURL *)bigPicForRow:(NSInteger) row forIndex:(NSInteger)index{
//    return self.dataList[row].bigpicArr[index].yx_URL;
//}
- (NSMutableArray<NSString *> *)bigPicForRow:(NSInteger)row{
    return self.dataList[row].bigpicArr.mutableCopy;
}

- (NSString *)titleForRow:(NSInteger) row{
    return self.dataList[row].title;
}

- (NSString *)forumForRow:(NSInteger)row{
    return self.dataList[row].forum;
}

- (NSString *)replyTimeForRow:(NSInteger) row{
    return self.dataList[row].replyTime;
}

- (NSInteger)replyNumForRow:(NSInteger) row{
    return self.dataList[row].replyNum;
}

- (NSURL *)URLForRow:(NSInteger)row{
    return self.dataList[row].appviewUrl.yx_URL;
}

- (UIImage *)replyTimeIcon{
    return @"com_hot_timeIcon.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.2318.000.00.".yx_image;
}

- (UIImage *)replyNumIcon{
    return @"setUp_feeBack.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.50858.000.00.".yx_image;
}



@end
