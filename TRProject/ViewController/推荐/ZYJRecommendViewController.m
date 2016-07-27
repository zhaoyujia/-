//
//  ZYJRecommendViewController.m
//  TRProject
//
//  Created by summer on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJRecommendViewController.h"
#import "ZYJRecommendFirstCell.h"
#import "ZYJRecommendViewModel.h"
#import "ZYJRecommendSecondCell.h"
#import "ZYJRecommendThirdCell.h"
#import "ZYJRecommendFourthCell.h"
#import "ZYJRecommendBottomCell.h"
#import "ZYJTravelViewModel.h"
#import "ZYJWebViewController.h"
#import "ZYJSearchViewController.h"

static NSString * const firstIdentify = @"first";
static NSString * const secondIdentify = @"second";
static NSString * const thirdIdentify = @"third";
static NSString * const bottomIdentify = @"bottom";
static NSString * const fourthIdentify = @"fourth";

@interface ZYJRecommendViewController ()
@property (nonatomic) ZYJRecommendViewModel *recommendVM;
@property (nonatomic) ZYJTravelViewModel *travelVM;
//搜索控制器
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;
@end

@implementation ZYJRecommendViewController
#pragma mark - Life Cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"下一站";
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]bk_initWithImage:[UIImage imageNamed:@"Search_icn.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.41392.000.00."] style:UIBarButtonItemStyleDone handler:^(id sender) {
        [self.navigationController pushViewController:[[ZYJSearchViewController alloc] initWithCollectionViewLayout:self.flowLayout] animated:YES];
    }];
    self.navigationItem.rightBarButtonItem = right;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.recommendVM getDataWithCompletionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.travelVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
                    if (error)
                        NSLog(@"%@",error);
                    [self.tableView reloadData];
                    [self.tableView.mj_header endRefreshing];
                    [self.tableView.mj_footer resetNoMoreData];
                }];                
            }
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.travelVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                [self.tableView reloadData];
                if (self.travelVM.isHasMore) {
                    [self.tableView.mj_footer endRefreshing];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    
    
    [self.tableView registerClass:[ZYJRecommendFirstCell class] forCellReuseIdentifier:firstIdentify];
    [self.tableView registerClass:[ZYJRecommendSecondCell class] forCellReuseIdentifier:secondIdentify];
    [self.tableView registerClass:[ZYJRecommendThirdCell class] forCellReuseIdentifier:thirdIdentify];
    [self.tableView registerClass:[ZYJRecommendBottomCell class] forCellReuseIdentifier:bottomIdentify];
    [self.tableView registerClass:[ZYJRecommendFourthCell class] forCellReuseIdentifier:fourthIdentify];
    
//    头部与标题栏0距离
    self.tableView.contentInset = UIEdgeInsetsMake(-2, 0, 0, 0);
}


#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
        case 1:
        case 2:
            return 1;
            break;
            
        case 3:
            if (self.travelVM.rowNumber) {
                return self.travelVM.rowNumber + 1;
            }
            return 0;
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ZYJRecommendFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:firstIdentify forIndexPath:indexPath];
        cell.recommendVM = self.recommendVM;
        [cell.ic reloadData];
        return cell;
    }
    if (indexPath.section == 1) {
        ZYJRecommendSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:secondIdentify forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.recommendVM = self.recommendVM;
        cell.label.text = @"发现下一站";
        [cell.btn1 setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[self.recommendVM subjectIconForRow:0]]] forState:UIControlStateNormal];
        [cell.btn2 setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[self.recommendVM subjectIconForRow:1]]] forState:UIControlStateNormal];
        [cell.btn3 setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[self.recommendVM subjectIconForRow:2]]] forState:UIControlStateNormal];
        return cell;
    }
    if (indexPath.section == 2) {
        ZYJRecommendThirdCell *cell = [tableView dequeueReusableCellWithIdentifier:thirdIdentify forIndexPath:indexPath];
        cell.label.text = @"抢特价折扣";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.recommendVM = self.recommendVM;
        [cell.btn setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[self.recommendVM discountSubjectIcon]]] forState:UIControlStateNormal];
        [cell.colletionView reloadData];
        return cell;
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            ZYJRecommendFourthCell *cell = [tableView dequeueReusableCellWithIdentifier:fourthIdentify forIndexPath:indexPath];
            cell.label.text = @"看热门游记";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            ZYJRecommendBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:bottomIdentify forIndexPath:indexPath];
            [cell.iv1 sd_setImageWithURL:[self.travelVM iconForRow:indexPath.row - 1]];
            cell.label1.text = [self.travelVM titleForRow:indexPath.row - 1];
            cell.label2.text = [self.travelVM userNameForRow:indexPath.row - 1];
            cell.iv2.image = [UIImage imageNamed:@"together_browseIcon.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.40297.000.00."];
            cell.label3.text = [self.travelVM replysForRow:indexPath.row - 1];
            cell.iv3.image = [UIImage imageNamed:@"together_reviewIcon.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.49439.000.00."];
            cell.label4.text = [NSString stringWithFormat:@"%ld", [self.travelVM viewsForRow:indexPath.row - 1]];
            return cell;
        }
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return kScreenW / 636 * 340;
    }
    if (indexPath.section == 1) {
        return kScreenW / 636 * 537;
    }
    if (indexPath.section == 2){
        return kScreenW / 636 * 1070;
    }
    if (indexPath.section == 3 && indexPath.row == 0) {
        return 35;
    }
    return kScreenW / 636 * 175;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 3) {
        if (indexPath.row) {
            ZYJWebViewController *webVC = [ZYJWebViewController new];
            NSURL *url = [self.travelVM viewURLForRow:indexPath.row - 1];
            [webVC.webView loadRequest:[NSURLRequest requestWithURL:url]];
            [self.navigationController pushViewController:webVC animated:YES];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}

#pragma mark - lazyLoad
- (ZYJRecommendViewModel *)recommendVM {
	if(_recommendVM == nil) {
		_recommendVM = [[ZYJRecommendViewModel alloc] init];
	}
	return _recommendVM;
}



- (ZYJTravelViewModel *)travelVM {
	if(_travelVM == nil) {
		_travelVM = [[ZYJTravelViewModel alloc] init];
	}
	return _travelVM;
}


- (UICollectionViewFlowLayout *)flowLayout {
	if(_flowLayout == nil) {
		_flowLayout = [[UICollectionViewFlowLayout alloc] init];
	}
	return _flowLayout;
}

@end
