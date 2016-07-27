//
//  ZYJRecommendThirdCell.h
//  TRProject
//
//  Created by summer on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYJRecommendViewModel.h"
@interface ZYJRecommendThirdCell : UITableViewCell<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic) UILabel *label;

@property (nonatomic) UIButton *btn;

@property (nonatomic) UICollectionView *colletionView;

@property (nonatomic) ZYJRecommendViewModel *recommendVM;

@end
