//
//  ZYJDiscussCell.h
//  TRProject
//
//  Created by summer on 16/7/6.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYJDiscussCell : UITableViewCell

@property (nonatomic, assign) NSInteger picNum;

@property (nonatomic) UIImageView *authorIv;

@property (nonatomic) UILabel *authorLb;

@property (nonatomic) UILabel *titleLb;

@property (nonatomic) NSArray<UIImageView*> *ivs;

@property (nonatomic) UILabel *forumLb;

@property (nonatomic) UIImageView *replyTimeIv;

@property (nonatomic) UILabel *replyTimeLb;

@property (nonatomic) UIImageView *replyNumIv;

@property (nonatomic) UILabel *replyNumLb;

@end
