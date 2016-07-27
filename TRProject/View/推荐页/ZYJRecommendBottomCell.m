//
//  ZYJRecommendBottomCell.m
//  TRProject
//
//  Created by summer on 16/7/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJRecommendBottomCell.h"

@implementation ZYJRecommendBottomCell
- (UIImageView *)iv1 {
    if(_iv1 == nil) {
        _iv1 = [[UIImageView alloc] init];
        [self.contentView addSubview:_iv1];
        [_iv1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(5);
            make.bottom.equalTo(-5);
            make.width.equalTo(kScreenW / 636 * 218);
        }];
    }
    return _iv1;
}

- (UIImageView *)iv2 {
    if(_iv2 == nil) {
        _iv2 = [[UIImageView alloc] init];
        [self.contentView addSubview:_iv2];
        [_iv2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iv1.mas_right).equalTo(10);
            make.bottom.equalTo(-10);
            make.width.height.equalTo(kScreenW / 636 * 25);
        }];
    }
    return _iv2;
}

- (UIImageView *)iv3 {
    if(_iv3 == nil) {
        _iv3 = [[UIImageView alloc] init];
        [self.contentView addSubview:_iv3];
        [_iv3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.label3.mas_right).equalTo(30);
            make.bottom.equalTo(-10);
            make.width.height.equalTo(kScreenW / 636 * 25);
        }];
    }
    return _iv3;
}

- (UILabel *)label1 {
    if(_label1 == nil) {
        _label1 = [[UILabel alloc] init];
        [self.contentView addSubview:_label1];
        [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iv1.mas_right).equalTo(10);
            make.top.equalTo(8);
            make.right.equalTo(-10);
        }];
        _label1.font = [UIFont systemFontOfSize:14];
        _label1.numberOfLines = 2;
    }
    return _label1;
}

- (UILabel *)label2 {
    if(_label2 == nil) {
        _label2 = [[UILabel alloc] init];
        [self.contentView addSubview:_label2];
        [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iv1.mas_right).equalTo(10);
            make.top.equalTo(self.label1.mas_bottom).equalTo(12);
            make.right.equalTo(-10);
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
            make.left.equalTo(self.iv2.mas_right).equalTo(5);
            make.bottom.equalTo(self.iv2.mas_bottom);
        }];
        _label3.font = [UIFont systemFontOfSize:12];
        _label3.textColor = [UIColor lightGrayColor];
    }
    return _label3;
}

- (UILabel *)label4 {
    if(_label4 == nil) {
        _label4 = [[UILabel alloc] init];
        [self.contentView addSubview:_label4];
        [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iv3.mas_right).equalTo(5);
            make.bottom.equalTo(self.iv3.mas_bottom);
        }];
        _label4.font = [UIFont systemFontOfSize:12];
        _label4.textColor = [UIColor lightGrayColor];

    }
    return _label4;
}

@end
