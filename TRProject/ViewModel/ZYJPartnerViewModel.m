//
//  ZYJPartnerViewModel.m
//  TRProject
//
//  Created by summer on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJPartnerViewModel.h"
#import "ZYJNetManager.h"
@implementation ZYJPartnerViewModel

- (void)getDataWithRequestMode:(VMRequestMode)requestMode cityStr:(NSInteger)cityStr endTime:(NSInteger)endTime startTime:(NSInteger)startTime completionHandler:(void(^)(NSError *error))completionHandler{
    NSInteger tmpPage = 1;
    if (requestMode == VMRequestModeMore) {
        tmpPage = _page + 1;
    }
    _dataTask = [ZYJNetManager getPartnerWithPage:tmpPage cityStr:cityStr endTime:endTime startTime:startTime completionHandler:^(ZYJPartnerModel *model, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }else{
            if (requestMode == VMRequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.data];
            _page += 1;
            _hasMore = model.data.count != 0;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

#pragma mark - lazyLoad
- (NSMutableArray<PartnerDataModel*> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<PartnerDataModel*> alloc] init];
    }
    return _dataList;
}

#pragma mark - methods
- (NSInteger)rowNumber{
    return self.dataList.count;
}

- (NSString *)usernameForRow:(NSInteger)row{
    return self.dataList[row].username;
}

- (NSString *)titleForRow:(NSInteger)row{
    return self.dataList[row].title;
}

- (NSInteger)replysForRow:(NSInteger)row{
    return self.dataList[row].replys;
}

- (NSInteger)viewsForRow:(NSInteger)row{
    return self.dataList[row].views;
}

- (NSString *)cityStrForRow:(NSInteger)row{
    return self.dataList[row].citysStr;
}

- (NSURL *)URLForRow:(NSInteger)row{
    return self.dataList[row].appviewUrl.yx_URL;
}

- (NSString *)startTimeForRow:(NSInteger)row{
    double time = self.dataList[row].startTime.integerValue;
    int year = (int)time / 3600 / 24 / 365 + 1970;
    int day = (int)(time - 365*24*3600*(year-1970))/3600/24 - 10 - 182;
    int month = 0;
    if (day <= 31) {
        month = 7;
    }else if(day > 31 && day <= 62){
        month = 8, day = day - 31;
    }else if(day > 31 && day <= 62){
        month = 8, day = day - 31;
    }else if(day > 62 && day <= 92){
        month = 9, day = day - 62;
    }else if(day > 92 && day <= 123){
        month = 10, day = day - 92;
    }else if(day > 123 && day <= 153){
        month = 11, day = day - 123;
    }else if(day > 153 && day <= 164){
        month = 12, day = day - 153;
    }else{
        year = 2017;
    }
    
    NSString *date = nil;
    if (year == 2017) {
        date = [NSString stringWithFormat:@"%d", year];
    }else if (month < 10 && day >= 10) {
        date = [NSString stringWithFormat:@"%d.0%d.%d", year, month, day];
    }else if (month < 10 && day < 10) {
        date = [NSString stringWithFormat:@"%d.0%d.0%d", year, month, day];
    }else if (month >= 10 && day < 10) {
        date = [NSString stringWithFormat:@"%d.%d.0%d", year, month, day];
    }else{
        date = [NSString stringWithFormat:@"%d.%d.%d", year, month, day];
    }
    return date;

}

- (NSString *)endTimeForRow:(NSInteger)row{
    NSInteger time = self.dataList[row].endTime.integerValue;
    int year = (int)time / 3600 / 24 / 365 + 1970;
    int day = (int)(time - 365*24*3600*(year-1970))/3600/24 - 10 - 182;
    int month = 0;
    if (day <= 31) {
        month = 7;
    }else if(day > 31 && day <= 62){
        month = 8, day = day - 31;
    }else if(day > 31 && day <= 62){
        month = 8, day = day - 31;
    }else if(day > 62 && day <= 92){
        month = 9, day = day - 62;
    }else if(day > 92 && day <= 123){
        month = 10, day = day - 92;
    }else if(day > 123 && day <= 153){
        month = 11, day = day - 123;
    }else if(day > 153 && day <= 164){
        month = 12, day = day - 153;
    }else{
        year = 2017;
    }
    
    NSString *date = nil;
    if (year == 2017) {
        date = [NSString stringWithFormat:@"%d", year];
    }else if (month < 10 && day >= 10) {
        date = [NSString stringWithFormat:@"%d.0%d.%d", year, month, day];
    }else if (month < 10 && day < 10) {
        date = [NSString stringWithFormat:@"%d.0%d.0%d", year, month, day];
    }else if (month >= 10 && day < 10) {
        date = [NSString stringWithFormat:@"%d.%d.0%d", year, month, day];
    }else{
        date = [NSString stringWithFormat:@"%d.%d.%d", year, month, day];
    }
    return date;

}


@end
