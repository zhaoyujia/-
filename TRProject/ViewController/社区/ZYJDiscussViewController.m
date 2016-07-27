//
//  ZYJDiscussViewController.m
//  TRProject
//
//  Created by summer on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJDiscussViewController.h"
#import "ZYJDiscussViewModel.h"
#import "ZYJDiscussCell.h"
#import "ZYJWebViewController.h"
#import "ZYJDiscussSecondCell.h"
static NSString * const firstIdentify = @"first";
static NSString * const secondIdentify = @"second";

@interface ZYJDiscussViewController()
@property (nonatomic) ZYJDiscussViewModel *discussVM;
@end

@implementation ZYJDiscussViewController
- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}



#pragma mark - Life Cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.discussVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@", error);
            }else{
                [self.tableView reloadData];
                [self.tableView endHeaderRefresh];
                if (self.discussVM.isHasMore) {
                    [self.tableView.mj_footer resetNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    [self.tableView beginHeaderRefresh];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.discussVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@", error);
            }else{
                [self.tableView reloadData];
                if (self.discussVM.isHasMore) {
                    [self.tableView.mj_footer endRefreshing];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    
    [self.tableView registerClass:[ZYJDiscussCell class] forCellReuseIdentifier:firstIdentify];
    [self.tableView registerClass:[ZYJDiscussSecondCell class] forCellReuseIdentifier:secondIdentify];
    //头部与标题栏0距离
    self.tableView.contentInset = UIEdgeInsetsMake(-1, 0, 0, 0);
    
}

#pragma mark - TableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.discussVM.rowNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger num = [self.discussVM bigPicForRow:indexPath.section].count;
    if (num) {
        ZYJDiscussCell *cell = [tableView dequeueReusableCellWithIdentifier:firstIdentify forIndexPath:indexPath];
//        cell.picNum = [self.discussVM bigPicForRow:indexPath.row].count;
        [cell.authorIv sd_setImageWithURL:[self.discussVM avatarForRow:indexPath.section]];
        cell.authorLb.text = [self.discussVM authorForRow:indexPath.section];
        cell.titleLb.text = [self.discussVM titleForRow:indexPath.section];
        
        for (int i = 0; i < num; i++) {
            [cell.ivs[i] sd_setImageWithURL:[self.discussVM bigPicForRow:indexPath.section][i].yx_URL];
        }
        for (int i = 2; i >= num; i--) {
            [cell.ivs[i] sd_setImageWithURL:nil];
        }

        cell.forumLb.text = [self.discussVM forumForRow:indexPath.section];
        cell.replyNumLb.text = [NSString stringWithFormat:@"%ld", [self.discussVM replyNumForRow:indexPath.section]];
        cell.replyNumIv.image = [self.discussVM replyNumIcon];
        cell.replyTimeLb.text = [self.discussVM replyTimeForRow:indexPath.section];
        cell.replyTimeIv.image = [self.discussVM replyTimeIcon];
        return cell;

    }else {
    ZYJDiscussSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:secondIdentify forIndexPath:indexPath];
    [cell.authorIv sd_setImageWithURL:[self.discussVM avatarForRow:indexPath.section]];
    cell.authorLb.text = [self.discussVM authorForRow:indexPath.section];
    cell.titleLb.text = [self.discussVM titleForRow:indexPath.section];
    cell.forumLb.text = [self.discussVM forumForRow:indexPath.section];
    cell.replyNumLb.text = [NSString stringWithFormat:@"%ld", [self.discussVM replyNumForRow:indexPath.section]];
    cell.replyNumIv.image = [self.discussVM replyNumIcon];
    cell.replyTimeLb.text = [self.discussVM replyTimeForRow:indexPath.section];
    cell.replyTimeIv.image = [self.discussVM replyTimeIcon];
    return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.discussVM bigPicForRow:indexPath.section].count == 0) {
        return kScreenW / 636 * 255 - 15;
    }
    return kScreenW / 636 * 405;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZYJWebViewController *webVC = [ZYJWebViewController new];
    NSURL *url = [self.discussVM URLForRow:indexPath.section];
    [webVC.webView loadRequest:[NSURLRequest requestWithURL:url]];
    webVC.tabBarController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
}

#pragma mark - lazyLoad
- (ZYJDiscussViewModel *)discussVM {
	if(_discussVM == nil) {
		_discussVM = [[ZYJDiscussViewModel alloc] init];
	}
	return _discussVM;
}

@end
