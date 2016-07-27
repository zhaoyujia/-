//
//  ZYJRecommendFirstCell.m
//  TRProject
//
//  Created by summer on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJRecommendFirstCell.h"
#import "ZYJWebViewController.h"
@implementation ZYJRecommendFirstCell



#pragma mark - lazyLoad
//滚动视图
- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [[iCarousel alloc] init];
        [self.contentView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(kScreenW / 636 * 340);
        }];
        _ic.pagingEnabled = YES;
        _ic.delegate = self;
        _ic.dataSource = self;
    }
    [self pc];
    
    [self.timer invalidate];
    self.timer = nil;
    self.timer = [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
        [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
    } repeats:YES];
    
    return _ic;
}

- (UIPageControl *)pc {
    if(_pc == nil) {
        _pc = [[UIPageControl alloc] init];
        [self.ic addSubview:_pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(-5);
        }];
        _pc.numberOfPages = self.recommendVM.slideRowNumber;
    }
    return _pc;
}


#pragma mark - iCarousel delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.recommendVM.slideRowNumber;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:carousel.bounds];
        UIImageView *iv = [UIImageView new];
        [view addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        iv.tag = 100;
    }
    UIImageView *iv = (UIImageView *)[view viewWithTag:100];
    [iv sd_setImageWithURL:[self.recommendVM slideIconForRow:index]];
    return view;
}

//iCarouselOptionWrap可以自动滚动
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
//页面控制器根据视图的滚动而滚动
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    self.pc.currentPage = carousel.currentItemIndex;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    ZYJWebViewController *webVC = [ZYJWebViewController new];
    NSURL *url = [self.recommendVM slideURLForRow:index];
    [webVC.webView loadRequest:[NSURLRequest requestWithURL:url]];
    [self.viewController.navigationController pushViewController:webVC animated:YES];
}

@end
