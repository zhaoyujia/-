//
//  ZYJSearchCell.m
//  TRProject
//
//  Created by summer on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJSearchCell.h"

@implementation ZYJSearchCell
- (UIImageView *)pic {
    if(_pic == nil) {
        _pic = [[UIImageView alloc] init];
        [self.contentView addSubview:_pic];
        [_pic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.height.equalTo((kScreenW - 3 * 10)/ 2 / 290 * 185);
        }];
    }
    return _pic;
}

- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
        [self.contentView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.pic.mas_bottom).equalTo(15);
            make.left.equalTo(10);
            make.right.equalTo(-10);
        }];
        _title.font = [UIFont systemFontOfSize:14];
        _title.numberOfLines = 2;
    }
    return _title;
}

- (UILabel *)time {
    if(_time == nil) {
        _time = [[UILabel alloc] init];
        [self.contentView addSubview:_time];
        [_time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom).equalTo(15);
            make.left.equalTo(10);
        }];
        _time.font = [UIFont systemFontOfSize:12];
        _time.textColor = [UIColor lightGrayColor];
    }
    return _time;
}

- (UILabel *)priceOff {
    if(_priceOff == nil) {
        _priceOff = [[UILabel alloc] init];
        [self.contentView addSubview:_priceOff];
        [_priceOff mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.equalTo(-10);
        }];
        _priceOff.font = [UIFont systemFontOfSize:12];
        _priceOff.textColor = [UIColor lightGrayColor];
    }
    return _priceOff;
}

- (UILabel *)price {
    if(_price == nil) {
        _price = [[UILabel alloc] init];
        [self.contentView addSubview:_price];
        [_price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.bottom.equalTo(-10);
        }];
        _price.font = [UIFont systemFontOfSize:12];
        _price.textColor = [UIColor redColor];
    }
    return _price;
}

@end
