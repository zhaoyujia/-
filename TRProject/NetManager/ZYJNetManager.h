//
//  ZYJNetManager.h
//  TRProject
//
//  Created by summer on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYJNetManager : NSObject
//推荐页上半部分
+ (id)getRecommendWithCompletionHandler:(void(^)(id model, NSError *error))completionHandler;
//推荐页下半部分
+ (id)getRecommendWithPage:(NSInteger)page completionHandler:(void(^)(id model, NSError *error))completionHandler;
//专题页
+ (id)getSpecialSubjectWithPage:(NSInteger)page completionHandler:(void(^)(id model, NSError *error))completionHandler;
//社区页中的热议
+ (id)getDiscussWithPage:(NSInteger)page completionHandler:(void(^)(id model, NSError *error))completionHandler;
//社区页中的找伴侣
+ (id)getPartnerWithPage:(NSInteger)page cityStr:(NSInteger)cityStr endTime:(NSInteger)endTime startTime:(NSInteger)startTime completionHandler:(void(^)(id model, NSError *error))completionHandler;
//搜索页
+ (id)getSearchDiscountWithPage:(NSInteger)page cityStr:(NSString *)cityStr completionHandler:(void(^)(id model, NSError *error))completionHandler;


@end
