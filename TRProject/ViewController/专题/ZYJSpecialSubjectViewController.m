//
//  ZYJSpecialSubjectViewController.m
//  TRProject
//
//  Created by summer on 16/7/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJSpecialSubjectViewController.h"
#import "ZYJSpecialSubjectViewModel.h"
#import "ZYJSpecialSubjectCell.h"
#import "ZYJWebViewController.h"

static NSString * const specialIdetify = @"special";

@interface ZYJSpecialSubjectViewController()
@property (nonatomic) ZYJSpecialSubjectViewModel *specialVM;
@end

@implementation ZYJSpecialSubjectViewController

#pragma mark - Life Cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"目的地";
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.specialVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@", error);
            }else{
                [self.tableView reloadData];
                [self.tableView endHeaderRefresh];
                if (self.specialVM.isHasMore) {
                    [self.tableView.mj_footer resetNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    [self.tableView beginHeaderRefresh];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.specialVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@", error);
            }else{
                [self.tableView reloadData];
                if (self.specialVM.isHasMore) {
                    [self.tableView.mj_footer endRefreshing];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    
    [self.tableView registerClass:[ZYJSpecialSubjectCell class] forCellReuseIdentifier:specialIdetify];
    
}

#pragma mark - TableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.specialVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYJSpecialSubjectCell *cell = [tableView dequeueReusableCellWithIdentifier:specialIdetify forIndexPath:indexPath];
    [cell.iv sd_setImageWithURL:[self.specialVM iconForRow:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kScreenW / 636 * 400 + 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZYJWebViewController *webVC = [ZYJWebViewController new];
    NSURL *url = [self.specialVM URLForRow:indexPath.row];
    [webVC.webView loadRequest:[NSURLRequest requestWithURL:url]];
    webVC.navigationItem.title = [self.specialVM titleForRow:indexPath.row];
    webVC.tabBarController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat viewHeight = scrollView.bounds.size.height + scrollView.contentInset.top;
    for (ZYJSpecialSubjectCell *cell in [self.tableView visibleCells]) {
        CGFloat y = cell.centerY - scrollView.contentOffset.y;
        CGFloat p = y - viewHeight / 2;
        CGFloat scale = cos(p / viewHeight * 2) * 0.95;
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
            cell.iv.transform = CGAffineTransformMakeScale(scale, scale);
        } completion:NULL];
    }
}
#pragma mark - lazyLoad
- (ZYJSpecialSubjectViewModel *)specialVM {
	if(_specialVM == nil) {
		_specialVM = [[ZYJSpecialSubjectViewModel alloc] init];
	}
	return _specialVM;
}

@end
