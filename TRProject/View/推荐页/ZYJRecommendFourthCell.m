//
//  ZYJRecommendFourthCell.m
//  TRProject
//
//  Created by summer on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJRecommendFourthCell.h"

@implementation ZYJRecommendFourthCell
- (UILabel *)label {
    if(_label == nil) {
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
        }];
        _label.textColor = [UIColor lightGrayColor];
        _label.font = [UIFont systemFontOfSize:15];
    }
    return _label;
}
@end
