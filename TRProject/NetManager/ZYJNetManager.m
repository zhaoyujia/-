//
//  ZYJNetManager.m
//  TRProject
//
//  Created by summer on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJNetManager.h"
#import "ZYJRecommendModel.h"
#import "ZYJTravelModel.h"
#import "ZYJSpcialSubjectModel.h"
#import "ZYJDiscussModel.h"
#import "ZYJPartnerModel.h"
#import "ZYJSearchModel.h"
#import "ZYJSearchDiscoutModel.h"
@implementation ZYJNetManager
+ (id)getRecommendWithCompletionHandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:kRecommendPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([ZYJRecommendModel parseJSON:jsonObject], error);
    }];
}


+ (id)getRecommendWithPage:(NSInteger)page completionHandler:(void (^)(id, NSError *))completionHandler{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:@"qyer_ios" forKey:@"client_id"];
    [dic setObject:@"cd254439208ab658ddf9" forKey:@"client_secret"];
    [dic setObject:@"10" forKey:@"count"];
    [dic setObject:@(page) forKey:@"page"];
    [dic setObject:@"App%2520Store" forKey:@"track_app_channel"];
    [dic setObject:@"6.9.3" forKey:@"track_app_version"];
    [dic setObject:@"iPhone%25205%28ChinaMobile%2CChinaTelecom%2CChinaUnicom%29" forKey:@"track_device_info"];
    [dic setObject:@"91E153B7-B4D8-4B48-8AA3-D2EE5B3A4F57" forKey:@"track_deviceid"];
    [dic setObject:@"ios%25209.3.2" forKey:@"track_os"];
    [dic setObject:@"index" forKey:@"type"];
    [dic setObject:@"1" forKey:@"v"];
   
    return [self GET:kTravelPath parameters:dic progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([ZYJTravelModel parseJSON:jsonObject],error);
    }];
}

+ (id)getSpecialSubjectWithPage:(NSInteger)page completionHandler:(void (^)(id, NSError *))completionHandler{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:@"qyer_ios" forKey:@"client_id"];
    [dic setObject:@"cd254439208ab658ddf9" forKey:@"client_secret"];
    [dic setObject:@"20" forKey:@"count"];
    [dic setObject:@(page) forKey:@"page"];
    [dic setObject:@"App%2520Store" forKey:@"track_app_channel"];
    [dic setObject:@"6.9.3" forKey:@"track_app_version"];
    [dic setObject:@"iPhone%25205%28ChinaMobile%2CChinaTelecom%2CChinaUnicom%29" forKey:@"track_device_info"];
    [dic setObject:@"91E153B7-B4D8-4B48-8AA3-D2EE5B3A4F57" forKey:@"track_deviceid"];
    [dic setObject:@"ios%25209.3.2" forKey:@"track_os"];
    [dic setObject:@"index" forKey:@"type"];
    [dic setObject:@"1" forKey:@"v"];
    return [self GET:kSpecialSubjectPath parameters:dic progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([ZYJSpcialSubjectModel parseJSON:jsonObject],error);
    }];
}

+ (id)getDiscussWithPage:(NSInteger)page completionHandler:(void (^)(id, NSError *))completionHandler{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:@"qyer_ios" forKey:@"client_id"];
    [dic setObject:@"cd254439208ab658ddf9" forKey:@"client_secret"];
    [dic setObject:@"10" forKey:@"count"];
    [dic setObject:@"520c7983bd1dc3ac412179b01d4d6c17" forKey:@"oauth_token"];
    [dic setObject:@(page) forKey:@"page"];
    [dic setObject:@"App%2520Store" forKey:@"track_app_channel"];
    [dic setObject:@"6.9.3" forKey:@"track_app_version"];
    [dic setObject:@"iPhone%25205%28ChinaMobile%2CChinaTelecom%2CChinaUnicom%29" forKey:@"track_device_info"];
    [dic setObject:@"91E153B7-B4D8-4B48-8AA3-D2EE5B3A4F57" forKey:@"track_deviceid"];
    [dic setObject:@"ios%25209.3.2" forKey:@"track_os"];
    [dic setObject:@"8115959" forKey:@"track_user_id"];
    [dic setObject:@"1" forKey:@"v"];
    return [self GET:kDiscussPath parameters:dic progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([ZYJDiscussModel parseJSON:jsonObject],error);
    }];
}

+ (id)getPartnerWithPage:(NSInteger)page cityStr:(NSInteger)cityStr endTime:(NSInteger)endTime startTime:(NSInteger)startTime completionHandler:(void(^)(id model, NSError *error))completionHandler;{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:@"qyer_ios" forKey:@"client_id"];
    [dic setObject:@"cd254439208ab658ddf9" forKey:@"client_secret"];
    [dic setObject:@"20" forKey:@"count"];
    [dic setObject:@(cityStr) forKey:@"country_str"];
    [dic setObject:@(endTime) forKey:@"end_time"];
    [dic setObject:@"520c7983bd1dc3ac412179b01d4d6c17" forKey:@"oauth_token"];
    [dic setObject:@(page) forKey:@"page"];
    [dic setObject:@(startTime) forKey:@"start_time"];
    [dic setObject:@"App%2520Store" forKey:@"track_app_channel"];
    [dic setObject:@"6.9.3" forKey:@"track_app_version"];
    [dic setObject:@"iPhone%25205%28ChinaMobile%2CChinaTelecom%2CChinaUnicom%29" forKey:@"track_device_info"];
    [dic setObject:@"91E153B7-B4D8-4B48-8AA3-D2EE5B3A4F57" forKey:@"track_deviceid"];
    [dic setObject:@"ios%25209.3.2" forKey:@"track_os"];
    [dic setObject:@"8115959" forKey:@"track_user_id"];
    [dic setObject:@"1" forKey:@"v"];
    return [self GET:kPartnerPath parameters:dic progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([ZYJPartnerModel parseJSON:jsonObject],error);
    }];

}

+ (id)getSearchDiscountWithPage:(NSInteger)page cityStr:(NSString *)cityStr completionHandler:(void (^)(id, NSError *))completionHandler{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:@"qyer_ios" forKey:@"client_id"];
    [dic setObject:@"cd254439208ab658ddf9" forKey:@"client_secret"];
    [dic setObject:@"20" forKey:@"count"];
    [dic setObject:cityStr forKey:@"kw"];
    [dic setObject:@"520c7983bd1dc3ac412179b01d4d6c17" forKey:@"oauth_token"];
    [dic setObject:@(page) forKey:@"page"];
    [dic setObject:@"App%2520Store" forKey:@"track_app_channel"];
    [dic setObject:@"6.9.3" forKey:@"track_app_version"];
    [dic setObject:@"iPhone%25205%28ChinaMobile%2CChinaTelecom%2CChinaUnicom%29" forKey:@"track_device_info"];
    [dic setObject:@"91E153B7-B4D8-4B48-8AA3-D2EE5B3A4F57" forKey:@"track_deviceid"];
    [dic setObject:@"ios%25209.3.2" forKey:@"track_os"];
    [dic setObject:@"8115959" forKey:@"track_user_id"];
    [dic setObject:@"1" forKey:@"v"];
    return [self GET:kSearchDiscountPath parameters:dic progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([ZYJSearchDiscoutModel parseJSON:jsonObject],error);
    }];
}

@end
