//
//  ZYJCommunityPageController.m
//  TRProject
//
//  Created by summer on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJCommunityPageController.h"

#import "ZYJCommunityPageController.h"
#import "ZYJDiscussViewController.h"
@implementation ZYJCommunityPageController

- (instancetype)initWithViewControllerClasses:(NSArray<Class> *)classes andTheirTitles:(NSArray<NSString *> *)titles{
    if (self = [super initWithViewControllerClasses:classes andTheirTitles:titles]) {
        //显示在导航栏上
        self.showOnNavigationBar = YES;
        //设置高度
        self.menuHeight = 20;
        //设置题目的宽度
        self.menuItemWidth = 60;
        //设置菜单的背景色
        self.menuBGColor = [UIColor clearColor];
        //带有横线的风格
        self.menuViewStyle = WMMenuItemStateSelected;
        //未选中时的颜色
        self.titleColorNormal = [UIColor colorWithRed:220 / 255.0 green:220 / 255.0 blue:220 / 255.0 alpha:1.0];
        //选中时的颜色
        self.titleColorSelected = [UIColor whiteColor];
        
        self.titleSizeSelected = self.titleSizeNormal;
    }
    return self;
}

////设置题目
//- (NSArray<NSString *> *)titles{
//    return @[@"热议", @"找伴侣"];
//}
//
//#pragma mark - PageViewController Delegate
////1.内部有多少个子控制器?
//- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
//    return self.titles.count;
//}
//
////2.每个子控制器什么样?
//- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
//    switch (index) {
//        case 0:
//            return [[ZYJDiscussViewController alloc] initWithStyle:UITableViewStylePlain];
//            break;
//            
//        case 1:
//            return [[ZYJDiscussViewController alloc] initWithStyle:UITableViewStylePlain];
//            break;
//    }
//    return nil;
//}
//
////3.每个控制器的题目是什么?
//- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
//    return self.titles[index];
//}
@end
