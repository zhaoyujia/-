//
//  ZYJRecommendSecondCell.m
//  TRProject
//
//  Created by summer on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJRecommendSecondCell.h"
#import "ZYJWebViewController.h"
@implementation ZYJRecommendSecondCell

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

- (UIButton *)btn1 {
    if(_btn1 == nil) {
        _btn1 = [[UIButton alloc] init];
        [self.contentView addSubview:_btn1];
        [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.label.mas_bottom).equalTo(10);
            make.left.equalTo(5);
            make.right.equalTo(-5);
            make.height.equalTo((kScreenW - 10) / 620 * 255);
        }];
        [_btn1 bk_addEventHandler:^(id sender) {
            ZYJWebViewController *webVC = [ZYJWebViewController new];
            [webVC.webView loadRequest:[NSURLRequest requestWithURL:[self.recommendVM subjectURLForRow:0]]];
            [self.viewController.navigationController pushViewController:webVC animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1;
}

- (UIButton *)btn2 {
    if(_btn2 == nil) {
        _btn2 = [[UIButton alloc] init];
        [self.contentView addSubview:_btn2];
        [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.btn1.mas_bottom).equalTo(5);
            make.left.equalTo(5);
            make.right.equalTo(self.contentView.mas_centerX).equalTo(-5);
            make.height.equalTo((kScreenW - 20) / 3);
        }];
        [_btn2 bk_addEventHandler:^(id sender) {
            ZYJWebViewController *webVC = [ZYJWebViewController new];
            [webVC.webView loadRequest:[NSURLRequest requestWithURL:[self.recommendVM subjectURLForRow:1]]];
            [self.viewController.navigationController pushViewController:webVC animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn2;
}

- (UIButton *)btn3 {
    if(_btn3 == nil) {
        _btn3 = [[UIButton alloc] init];
        [self.contentView addSubview:_btn3];
        [_btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.btn2.mas_top);
            make.left.equalTo(self.contentView.mas_centerX).equalTo(5);
            make.right.equalTo(-5);
            make.height.equalTo((kScreenW - 20) / 3);
        }];
         [_btn3 bk_addEventHandler:^(id sender) {
            ZYJWebViewController *webVC = [ZYJWebViewController new];
            [webVC.webView loadRequest:[NSURLRequest requestWithURL:[self.recommendVM subjectURLForRow:2]]];
            [self.viewController.navigationController pushViewController:webVC animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn3;
}

@end
