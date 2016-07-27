//
//  ZYJRecommendViewModel.m
//  TRProject
//
//  Created by summer on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJRecommendViewModel.h"
#import "ZYJNetManager.h"

@implementation ZYJRecommendViewModel

#pragma mark - methods
- (void)getDataWithCompletionHandler:(void (^)(NSError *))completionHandler{
    _dataTask = [ZYJNetManager getRecommendWithCompletionHandler:^(id model, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        }else{
            self.dataList = model;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
//第一个cell
- (NSInteger)slideRowNumber{
    return self.dataList.data.slide.count;
}
- (NSURL *)slideIconForRow:(NSInteger)row{
    return self.dataList.data.slide[row].photo.yx_URL;
}
- (NSURL *)slideURLForRow:(NSInteger)row{
    return self.dataList.data.slide[row].url.yx_URL;
}

//第二个cell
- (NSURL *)subjectIconForRow:(NSInteger)row{
    return self.dataList.data.subject[row].photo.yx_URL;
}
- (NSURL *)subjectURLForRow:(NSInteger)row{
    return self.dataList.data.subject[row].url.yx_URL;
}

//第三个cell
- (NSURL *)discountSubjectIcon{
    return self.dataList.data.discount_subject.firstObject.photo.yx_URL;
}

- (NSURL *)discountSubjectURL{
    return self.dataList.data.discount_subject.firstObject.url.yx_URL;
}

- (NSInteger)discountRowNumber{
    return self.dataList.data.discount.count;
}

- (NSString *)discountTitleForRow:(NSInteger)row{
    return self.dataList.data.discount[row].title;
}

- (NSURL *)discountIconForRow:(NSInteger)row{
    return self.dataList.data.discount[row].photo.yx_URL;
}

- (NSString *)discountPriceOffForRow:(NSInteger)row{
    return self.dataList.data.discount[row].priceoff;
}

- (NSString *)discountPricForRow:(NSInteger)row{
    NSString *price = self.dataList.data.discount[row].price;
    NSString *Price = [price substringWithRange:NSMakeRange(4, [price length] - 11)];
    return [Price stringByAppendingString:@"元起"];
}



@end
