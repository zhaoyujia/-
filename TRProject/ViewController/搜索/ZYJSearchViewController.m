//
//  ZYJSearchViewController.m
//  TRProject
//
//  Created by summer on 16/7/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJSearchViewController.h"
#import "ZYJSearchCell.h"
#import "ZYJSearchViewModel.h"
#import "ZYJWebViewController.h"

static NSString * const searchIdetify = @"search";

@interface ZYJSearchViewController()<UICollectionViewDelegateFlowLayout>
@property (nonatomic) ZYJSearchViewModel *searchVM;
//@property (nonatomic) UISearchController *searchC;
@property (nonatomic) UITextField *textField;
@end


@implementation ZYJSearchViewController

- (void)setCityStr:(NSString *)cityStr{
    _cityStr = cityStr;
    [self.collectionView reloadData];
}

#pragma mark - Life Cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = self.textField;
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc]bk_initWithImage:[UIImage imageNamed:@"back.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.39371.000.00."] style:UIBarButtonItemStyleDone handler:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    self.navigationItem.leftBarButtonItem = left;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.bounds = CGRectMake(0, 0, 50, 20);
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button bk_whenTapped:^{
        [self.searchVM getDataWithRequestMode:VMRequestModeRefresh cityStr:self.textField.text completionHandler:^(NSError *error) {
            if (error) {
                NSLog(@"%@", error);
            }else{
                [self.collectionView reloadData];
                if (self.searchVM.isHasMore) {
                    [self.collectionView.mj_footer resetNoMoreData];
                }else{
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
        
        self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.searchVM getDataWithRequestMode:VMRequestModeMore cityStr:self.textField.text completionHandler:^(NSError *error) {
                if (error) {
                    NSLog(@"%@", error);
                }else{
                    [self.collectionView reloadData];
                    if (self.searchVM.isHasMore) {
                        [self.collectionView.mj_footer endRefreshing];
                    }else{
                        [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                    }
                }
            }];
        }];

        [self.textField resignFirstResponder];
    }];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = right;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];

    [self.collectionView registerClass:[ZYJSearchCell class] forCellWithReuseIdentifier:searchIdetify];
    
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.textField resignFirstResponder];
}

#pragma mark - collectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.searchVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZYJSearchCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:searchIdetify forIndexPath:indexPath];
    [cell.pic sd_setImageWithURL:[self.searchVM picForRow:indexPath.row]];
    cell.title.text = [self.searchVM titleForRow:indexPath.row];
    cell.time.text = [self.searchVM departureTimeForRow:indexPath.row];
    cell.priceOff.text = [self.searchVM lastminuteDesForRow:indexPath.row];
    cell.price.text = [self.searchVM priceForRow:indexPath.row];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 3 * 10) / 2;
    return CGSizeMake(width, (kScreenW - 3 * 10) / 2 * 390 / 290);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZYJWebViewController *webVC = [ZYJWebViewController new];
    NSURL *url = [self.searchVM URLForRow:indexPath.row];
    [webVC.webView loadRequest:[NSURLRequest requestWithURL:url]];
    [self.navigationController pushViewController:webVC animated:YES];
}


//#pragma mark - UISearchResultsUpdating delegate
//- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
//    NSString *text = searchController.searchBar.text;
//    //获取搜索控制器的结果控制器, 向里面传参. 需要强制类型转化.
//    ((ZYJSearchViewController *)(searchController.searchResultsController)).cityStr = text;
//}

#pragma mark - lazyLoad
- (ZYJSearchViewModel *)searchVM {
	if(_searchVM == nil) {
		_searchVM = [[ZYJSearchViewModel alloc] init];
	}
	return _searchVM;
}

//- (UISearchController *)searchC {
//    if(_searchC == nil) {
//        _searchC = [[UISearchController alloc] initWithSearchResultsController:self];
//        _searchC.searchResultsUpdater = self;
//    }
//    return _searchC;
//}

- (UITextField *)textField {
	if(_textField == nil) {
		_textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 25)];
        _textField.placeholder = @"搜索特价地点";
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.font = [UIFont systemFontOfSize:12];
	}
	return _textField;
}

@end
