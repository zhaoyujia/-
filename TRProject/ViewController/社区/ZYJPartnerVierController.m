//
//  ZYJPartnerVierController.m
//  TRProject
//
//  Created by summer on 16/7/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJPartnerVierController.h"
#import "ZYJPartnerCell.h"
#import "ZYJPartnerViewModel.h"
#import "ZYJWebViewController.h"

#import "ZLDropDownMenuUICalc.h"
#import "ZLDropDownMenuCollectionViewCell.h"
#import "ZLDropDownMenu.h"
#import "NSString+ZLStringSize.h"
static NSString *const partnerIdentify = @"partner";
@interface ZYJPartnerVierController()<ZLDropDownMenuDelegate, ZLDropDownMenuDataSource, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) ZYJPartnerViewModel *partnerVM;
@property (nonatomic) UITableView *tableView;
@property (nonatomic, strong) NSArray *mainTitleArray;
@property (nonatomic, strong) NSArray *subTitleArray;

@property (nonatomic, assign) NSInteger cityStr;
@property (nonatomic, assign) NSInteger endTime;
@property (nonatomic, assign) NSInteger startTime;

@end


@implementation ZYJPartnerVierController

#pragma mark - Life Cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.partnerVM getDataWithRequestMode:VMRequestModeRefresh cityStr:_cityStr endTime:_endTime startTime:_startTime completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@", error);
            }else{
                [self.tableView reloadData];
                [self.tableView endHeaderRefresh];
                if (self.partnerVM.isHasMore) {
                    [self.tableView.mj_footer resetNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    [self.tableView beginHeaderRefresh];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.partnerVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@", error);
            }else{
                [self.tableView reloadData];
                if (self.partnerVM.isHasMore) {
                    [self.tableView.mj_footer endRefreshing];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
    

    //下拉菜单
    ZLDropDownMenu *menu = [[ZLDropDownMenu alloc] init];
        [self.view addSubview:menu];
        menu.delegate = self;
        menu.dataSource = self;
        [menu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.left.right.equalTo(0);
            make.height.mas_equalTo(50);
        }];

    
    [self.tableView registerClass:[ZYJPartnerCell class] forCellReuseIdentifier:partnerIdentify];
    
}


#pragma mark - TableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.partnerVM.rowNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYJPartnerCell *cell = [tableView dequeueReusableCellWithIdentifier:partnerIdentify forIndexPath:indexPath];
    [cell dateIv];
    cell.dateLb.text = [NSString stringWithFormat:@"%@-%@", [self.partnerVM startTimeForRow:indexPath.section], [self.partnerVM endTimeForRow:indexPath.section]];
    [cell cityIv];
    cell.cityLb.text = [self.partnerVM cityStrForRow:indexPath.section];
    cell.titleLb.text = [self.partnerVM titleForRow:indexPath.section];
    cell.userName.text = [self.partnerVM usernameForRow:indexPath.section];
    cell.replyLb.text = [NSString stringWithFormat:@"%ld", [self.partnerVM replysForRow:indexPath.section]];
    [cell replyIv];
    cell.viewsLb.text = [NSString stringWithFormat:@"%ld", [self.partnerVM viewsForRow:indexPath.section]];
    [cell viewsIv];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kScreenW / 636 * 180;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYJWebViewController *webVC = [ZYJWebViewController new];
    NSURL *url = [self.partnerVM URLForRow:indexPath.section];
    [webVC.webView loadRequest:[NSURLRequest requestWithURL:url]];
    webVC.tabBarController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 7;
}



#pragma mark - ZLDropDownMenuDataSource

- (NSInteger)numberOfColumnsInMenu:(ZLDropDownMenu *)menu
{
    return self.mainTitleArray.count;
}

- (NSInteger)menu:(ZLDropDownMenu *)menu numberOfRowsInColumns:(NSInteger)column
{
    return [self.subTitleArray[column] count];
}

- (NSString *)menu:(ZLDropDownMenu *)menu titleForColumn:(NSInteger)column
{
    return self.mainTitleArray[column];
}

- (NSString *)menu:(ZLDropDownMenu *)menu titleForRowAtIndexPath:(ZLIndexPath *)indexPath
{
    NSArray *array = self.subTitleArray[indexPath.column];
    return array[indexPath.row];
}
#pragma mark - ZLDropDownMenuDelegate
- (void)menu:(ZLDropDownMenu *)menu didSelectRowAtIndexPath:(ZLIndexPath *)indexPath
{
    //出发月份:
    if (indexPath.column == 0) {
        switch (indexPath.row) {
            case 0: _endTime = 0; _startTime = 0; break;
            case 1: _endTime = 1469980799; _startTime = 1468028024; break;
            case 2: _endTime = 1472659199; _startTime = 1469980800; break;
            case 3: _endTime = 1475251199; _startTime = 1472659200; break;
            case 4: _endTime = 1477929599; _startTime = 1475251200; break;
            case 5: _endTime = 1480521599; _startTime = 1477929600; break;
            case 6: _endTime = 1483199999; _startTime = 1480521600; break;
            case 7: _endTime = 0; _startTime = 1483200000; break;
        }
        [self.tableView.mj_header beginRefreshing];
        [self.tableView reloadData];
    }
    //热门目的地
    else{
        switch (indexPath.row) {
            case 0:_cityStr = 0; break;
            case 1:_cityStr = 236; break;
            case 2:_cityStr = 186; break;
            case 3:_cityStr = 15; break;
            case 4:_cityStr = 13; break;
            case 5:_cityStr = 189; break;
            case 6:_cityStr = 238; break;
            case 7:_cityStr = 241; break;
            case 8:_cityStr = 14; break;
            case 9:_cityStr = 233; break;
            case 10:_cityStr = 240; break;
            case 11:_cityStr = 11; break;
            case 12:_cityStr = 497; break;
            case 13:_cityStr = 215; break;
            case 14:_cityStr = 213; break;
            case 15:_cityStr = 219; break;
            case 16:_cityStr = 402; break;
            case 17:_cityStr = 220; break;
        }
        [self.tableView.mj_header beginRefreshing];
        [self.tableView reloadData];
    }
}


#pragma mark - lazyLoad
- (ZYJPartnerViewModel *)partnerVM {
	if(_partnerVM == nil) {
		_partnerVM = [[ZYJPartnerViewModel alloc] init];
	}
	return _partnerVM;
}


- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.top.equalTo(50);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
	}
	return _tableView;
}


- (NSArray *)mainTitleArray {
	if(_mainTitleArray == nil) {
		_mainTitleArray = @[@"出发时间", @"热门目的地"];
	}
	return _mainTitleArray;
}

- (NSArray *)subTitleArray {
	if(_subTitleArray == nil) {
        _subTitleArray = @[
                           @[@"不限",  @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月", @"更远日期"],
                           @[@"不限", @"美国", @"法国", @"德国", @"英国", @"意大利", @"加拿大", @"新西兰", @"日本", @"韩国", @"澳大利亚", @"中国", @"马尔代夫", @"泰国", @"马来西亚", @"越南", @"阿联酋", @"尼泊尔"],
                           ];
	}
	return _subTitleArray;
}

@end
