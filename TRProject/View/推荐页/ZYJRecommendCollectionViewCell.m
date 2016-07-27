//
//  ZYJRecommendCollectionViewCell.m
//  TRProject
//
//  Created by summer on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJRecommendCollectionViewCell.h"

@implementation ZYJRecommendCollectionViewCell
- (UIImageView *)iv {
    if(_iv == nil) {
        _iv = [[UIImageView alloc] init];
        [self.contentView addSubview:_iv];
        [_iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.height.equalTo((kScreenW - 15)/ 296 * 190 / 2);
        }];
    }
    return _iv;
}

- (UILabel *)label1 {
    if(_label1 == nil) {
        _label1 = [[UILabel alloc] init];
        [self.contentView addSubview:_label1];
        [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iv.mas_bottom).equalTo(20);
            make.left.right.equalTo(0);
        }];
        _label1.numberOfLines = 2;
         _label1.font = [UIFont systemFontOfSize:14];
    }
    return _label1;
}

- (UILabel *)label2 {
    if(_label2 == nil) {
        _label2 = [[UILabel alloc] init];
        [self.contentView addSubview:_label2];
        [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.label1.mas_bottom).equalTo(20);
            make.left.equalTo(5);
        }];
        _label2.font = [UIFont systemFontOfSize:12];
        _label2.textColor = [UIColor lightGrayColor];
    }
    return _label2;
}

- (UILabel *)label3 {
    if(_label3 == nil) {
        _label3 = [[UILabel alloc] init];
        [self.contentView addSubview:_label3];
        [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.label1.mas_bottom).equalTo(20);
            make.right.equalTo(-5);
        }];
        _label3.font = [UIFont systemFontOfSize:12];
        _label3.textColor = [UIColor redColor];
    }
    return _label3;
}

@end
