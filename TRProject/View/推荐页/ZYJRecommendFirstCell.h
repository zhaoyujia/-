//
//  ZYJRecommendFirstCell.h
//  TRProject
//
//  Created by summer on 16/7/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iCarousel.h>
#import "ZYJRecommendViewModel.h"
@interface ZYJRecommendFirstCell : UITableViewCell<iCarouselDelegate, iCarouselDataSource>

@property (nonatomic) iCarousel *ic;

@property (nonatomic) ZYJRecommendViewModel *recommendVM;

@property (nonatomic) UIPageControl *pc;

@property (nonatomic) NSTimer *timer;


@end
