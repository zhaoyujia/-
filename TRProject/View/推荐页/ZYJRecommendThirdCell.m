//
//  ZYJRecommendThirdCell.m
//  TRProject
//
//  Created by summer on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJRecommendThirdCell.h"
#import "ZYJWebViewController.h"
#import "ZYJRecommendCollectionViewCell.h"
@implementation ZYJRecommendThirdCell


#pragma mark - lazyLoad
- (UILabel *)label {
    if(_label == nil) {
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.left.equalTo(10);
        }];
        _label.textColor = [UIColor lightGrayColor];
        _label.font = [UIFont systemFontOfSize:15];
    }
    return _label;
}

- (UIButton *)btn {
    if(_btn == nil) {
        _btn = [[UIButton alloc] init];
        [self.contentView addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.label.mas_bottom).equalTo(10);
            make.left.equalTo(5);
            make.right.equalTo(-5);
            make.height.equalTo((kScreenW - 10) / 616 * 252);
        }];
        [_btn bk_addEventHandler:^(id sender) {
            ZYJWebViewController *webVC = [ZYJWebViewController new];
            [webVC.webView loadRequest:[NSURLRequest requestWithURL:[self.recommendVM discountSubjectURL]]];
            [self.viewController.navigationController pushViewController:webVC animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (UICollectionView *)colletionView {
    if(_colletionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 5;
        flowLayout.minimumInteritemSpacing = 5;
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        flowLayout.itemSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 3 * 5) / 2, kScreenW / 636 * 360);
        
        
        _colletionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout: flowLayout];
        [self.contentView addSubview:_colletionView];
        [_colletionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.btn.mas_bottom).equalTo(5);
            make.left.right.equalTo(0);
            make.height.equalTo(kScreenW / 636 * 720);
        }];
        _colletionView.delegate = self;
        _colletionView.dataSource = self;
        _colletionView.backgroundColor = [UIColor whiteColor];
        _colletionView.scrollEnabled = NO;
        [self.colletionView registerClass:[ZYJRecommendCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        
    }
    return _colletionView;
}

#pragma mark - CollectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.recommendVM.discountRowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZYJRecommendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iv sd_setImageWithURL:[self.recommendVM discountIconForRow:indexPath.row]];
    cell.label1.text = [self.recommendVM discountTitleForRow:indexPath.row];
    cell.label2.text = [self.recommendVM discountPriceOffForRow:indexPath.row];
    cell.label3.text = [self.recommendVM discountPricForRow:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
}

@end
