//
//  ZYJDiscussSecondCell.m
//  TRProject
//
//  Created by summer on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJDiscussSecondCell.h"

@implementation ZYJDiscussSecondCell
- (UIImageView *)authorIv {
    if(_authorIv == nil) {
        _authorIv = [[UIImageView alloc] init];
        [self.contentView addSubview:_authorIv];
        [_authorIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(20);
            make.width.height.equalTo(30);
        }];
        _authorIv.layer.cornerRadius = 15;
        _authorIv.clipsToBounds = YES;
    }
    return _authorIv;
}

- (UILabel *)authorLb {
    if(_authorLb == nil) {
        _authorLb = [[UILabel alloc] init];
        [self.contentView addSubview:_authorLb];
        [_authorLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20);
            make.left.equalTo(self.authorIv.mas_right).equalTo(10);
        }];
        _authorLb.textColor = [UIColor lightGrayColor];
        _authorLb.font = [UIFont systemFontOfSize:12];
    }
    return _authorLb;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.authorIv.mas_right).equalTo(10);
            make.top.equalTo(self.authorLb.mas_bottom).equalTo(15);
            make.right.equalTo(-15);
        }];
        _titleLb.font = [UIFont systemFontOfSize:16];
        _titleLb.numberOfLines = 2;
    }
    return _titleLb;
}

- (UILabel *)forumLb {
    if(_forumLb == nil) {
        _forumLb = [[UILabel alloc] init];
        [self.contentView addSubview:_forumLb];
        [_forumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.authorIv.mas_right).equalTo(10);
            make.bottom.equalTo(-15);
        }];
        _forumLb.textColor = [UIColor colorWithRed:78 / 255.0 green:157 / 255.0 blue:234 / 255.0 alpha:1.0];
        _forumLb.font = [UIFont systemFontOfSize:12];
    }
    return _forumLb;
}

- (UIImageView *)replyTimeIv {
    if(_replyTimeIv == nil) {
        _replyTimeIv = [[UIImageView alloc] init];
        [self.contentView addSubview:_replyTimeIv];
        [_replyTimeIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-17);
            make.right.equalTo(self.replyTimeLb.mas_left).equalTo(-5);
        }];
    }
    return _replyTimeIv;
}

- (UILabel *)replyTimeLb {
    if(_replyTimeLb == nil) {
        _replyTimeLb = [[UILabel alloc] init];
        [self.contentView addSubview:_replyTimeLb];
        [_replyTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.replyNumIv.mas_left).equalTo(-30);
            make.bottom.equalTo(-15);
        }];
        _replyTimeLb.font = [UIFont systemFontOfSize:12];
        _replyTimeLb.textColor = [UIColor lightGrayColor];
    }
    return _replyTimeLb;
}

- (UIImageView *)replyNumIv {
    if(_replyNumIv == nil) {
        _replyNumIv = [[UIImageView alloc] init];
    }
    [self.contentView addSubview:_replyNumIv];
    [_replyNumIv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.replyNumLb.mas_left).equalTo(-5);
        make.bottom.equalTo(-15);
        make.height.width.equalTo(kScreenW / 636 * 25);
    }];
    
    return _replyNumIv;
}

- (UILabel *)replyNumLb {
    if(_replyNumLb == nil) {
        _replyNumLb = [[UILabel alloc] init];
        [self.contentView addSubview:_replyNumLb];
        [_replyNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-15);
            make.right.equalTo(-15);
        }];
        _replyNumLb.font = [UIFont systemFontOfSize:12];
        _replyNumLb.textColor = [UIColor lightGrayColor];
    }
    return _replyNumLb;
}
@end
