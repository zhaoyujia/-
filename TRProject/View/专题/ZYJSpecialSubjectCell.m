//
//  ZYJSpecialSubjectCell.m
//  TRProject
//
//  Created by summer on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJSpecialSubjectCell.h"

@implementation ZYJSpecialSubjectCell

- (UIImageView *)iv {
    if(_iv == nil) {
        _iv = [[UIImageView alloc] init];
        [self.contentView addSubview:_iv];
        [_iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return _iv;
}


@end
