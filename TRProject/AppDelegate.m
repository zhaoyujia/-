//
//  AppDelegate.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "ZYJNetManager.h"
#import "ZYJRecommendViewController.h"
#import "ZYJSpecialSubjectViewController.h"
#import "ZYJCommunityPageController.h"
#import "ZYJDiscussViewController.h"
#import "ZYJPartnerVierController.h"
@interface AppDelegate ()
@property (nonatomic) UITabBarController *tabBar;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    self.window.rootViewController = self.tabBar;
//    启动图多停留一秒
//    [NSThread sleepForTimeInterval:1.0];
    return YES;
}

#pragma mark - lazyLoad

- (UIWindow *)window {
    if(_window == nil) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
        _window.backgroundColor = [UIColor whiteColor];
    }
    return _window;
}


- (UITabBarController *)tabBar {
	if(_tabBar == nil) {
		_tabBar = [[UITabBarController alloc] init];
        //推荐页
        ZYJRecommendViewController *recommendVC = [[ZYJRecommendViewController alloc] initWithStyle:UITableViewStyleGrouped];
        UINavigationController *recommendNavi = [[UINavigationController alloc] initWithRootViewController:recommendVC];
        recommendNavi.tabBarItem.image = @"TabBar_Feature.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.5950.000.00.".yx_image;
        recommendNavi.tabBarItem.selectedImage = @"TabBar_Feature_Highlight.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.23183.000.00.".yx_image;
        recommendNavi.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);

        //目的地页
        ZYJSpecialSubjectViewController *specialVC = [[ZYJSpecialSubjectViewController alloc] initWithStyle:UITableViewStylePlain];
        UINavigationController *specialNavi = [[UINavigationController alloc] initWithRootViewController:specialVC];
        specialNavi.tabBarItem.image = @"TabBar_Place.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.9271.000.00.".yx_image;
        specialNavi.tabBarItem.selectedImage = @"TabBar_Place_Highlight.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.10153.000.00.".yx_image;
        specialNavi.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        
        //社区页
        ZYJCommunityPageController *communityPC = [[ZYJCommunityPageController alloc] initWithViewControllerClasses:@[[ZYJDiscussViewController class], [ZYJPartnerVierController class]] andTheirTitles:@[@"热议", @"找伴侣"]];
        UINavigationController *communityNavi = [[UINavigationController alloc] initWithRootViewController:communityPC];
        communityNavi.tabBarItem.image = @"TabBar_BBS.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.13712.000.00.".yx_image;
        communityNavi.tabBarItem.selectedImage = @"TabBar_BBS_Highlight.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.48157.000.00.".yx_image;
        communityNavi.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        
        [UITabBar appearance].barTintColor = [UIColor whiteColor];
        [UITabBar appearance].translucent = NO;
        [UITabBar appearance].barStyle = UIBarStyleDefault;
        [UINavigationBar appearance].translucent = NO;
        [UINavigationBar appearance].barStyle = UIBarStyleBlack;
        [UINavigationBar appearance].tintColor = [UIColor whiteColor];
        [UINavigationBar appearance].barTintColor = [UIColor colorWithRed:0 / 255.0 green:210 / 255.0 blue:155 / 255.0 alpha:1.0];
        _tabBar.viewControllers = @[recommendNavi, communityNavi, specialNavi];
	}
	return _tabBar;
}

@end
