//
//  ZYJPartnerCell.m
//  TRProject
//
//  Created by summer on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJPartnerCell.h"

@implementation ZYJPartnerCell

- (UIImageView *)dateIv {
    if(_dateIv == nil) {
        _dateIv = [[UIImageView alloc] init];
        [self.contentView addSubview:_dateIv];
        [_dateIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20);
            make.left.equalTo(10);
            make.width.height.equalTo(kScreenW / 636 * 25);
        }];
        _dateIv.image = [UIImage imageNamed:@"companions_departure_timeIcon.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.52423.000.00."];
    }
    return _dateIv;
}

- (UILabel *)dateLb {
    if(_dateLb == nil) {
        _dateLb = [[UILabel alloc] init];
        [self.contentView addSubview:_dateLb];
        [_dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.dateIv.mas_right).equalTo(5);
            make.bottom.equalTo(self.dateIv.mas_bottom);
        }];
        _dateLb.font = [UIFont systemFontOfSize:13];

    }
    return _dateLb;
}

- (UIImageView *)cityIv {
    if(_cityIv == nil) {
        _cityIv = [[UIImageView alloc] init];
        [self.contentView addSubview:_cityIv];
        [_cityIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.dateLb.mas_right).equalTo(15);
            make.bottom.equalTo(self.dateIv.mas_bottom);
            make.width.equalTo(13);
            make.height.equalTo(17);
        }];
        _cityIv.image = [UIImage imageNamed:@"food_tap.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.55195.000.00."];
    }
    return _cityIv;
}

- (UILabel *)cityLb {
    if(_cityLb == nil) {
        _cityLb = [[UILabel alloc] init];
        [self.contentView addSubview:_cityLb];
        [_cityLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cityIv.mas_right).equalTo(5);
            make.bottom.equalTo(self.cityIv.mas_bottom);
            make.width.equalTo(150);
        }];
        _cityLb.font = [UIFont systemFontOfSize:13];
    }
    return _cityLb;
}


- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(30);
            make.top.equalTo(self.dateIv.mas_bottom).equalTo(10);
            make.right.equalTo(-10);
        }];
        _titleLb.font = [UIFont systemFontOfSize:13];
        _titleLb.textColor = [UIColor lightGrayColor];
    }
    return _titleLb;
}

- (UILabel *)userName {
    if(_userName == nil) {
        _userName = [[UILabel alloc] init];
        [self.contentView addSubview:_userName];
        [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.equalTo(-15);
        }];
        _userName.textColor = [UIColor lightGrayColor];
        _userName.font = [UIFont systemFontOfSize:12];
    }
    return _userName;
}

- (UILabel *)replyLb {
    if(_replyLb == nil) {
        _replyLb = [[UILabel alloc] init];
        [self.contentView addSubview:_replyLb];
        [_replyLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(-15);
        }];
        _replyLb.textColor = [UIColor lightGrayColor];
        _replyLb.font = [UIFont systemFontOfSize:12];
    }
    return _replyLb;
}

- (UIImageView *)replyIv {
    if(_replyIv == nil) {
        _replyIv = [[UIImageView alloc] init];
        [self.contentView addSubview:_replyIv];
        [_replyIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.replyLb.mas_left).equalTo(-5);
            make.bottom.equalTo(-15);
            make.width.height.equalTo(17);
        }];
        _replyIv.image = [UIImage imageNamed:@"setUp_feeBack.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.50858.000.00."];
    }
    return _replyIv;
}

- (UILabel *)viewsLb {
    if(_viewsLb == nil) {
        _viewsLb = [[UILabel alloc] init];
        [self.contentView addSubview:_viewsLb];
        [_viewsLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.replyLb.mas_left).equalTo(-30);
            make.bottom.equalTo(-15);
        }];
        _viewsLb.textColor = [UIColor lightGrayColor];
        _viewsLb.font = [UIFont systemFontOfSize:12];
    }
    return _viewsLb;
}

- (UIImageView *)viewsIv {
    if(_viewsIv == nil) {
        _viewsIv = [[UIImageView alloc] init];
        [self.contentView addSubview:_viewsIv];
        [_viewsIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.viewsLb.mas_left).equalTo(-5);
            make.bottom.equalTo(-15);
            make.width.height.equalTo(17);
        }];
        _viewsIv.image = [UIImage imageNamed:@"together_browseIcon.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.40297.000.00."];
    }
    return _viewsIv;
}

@end
