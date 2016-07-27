//
//  ZYJWebViewController.m
//  TRProject
//
//  Created by summer on 16/7/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ZYJWebViewController.h"

@implementation ZYJWebViewController
#pragma mark - Life Cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    UIBarButtonItem *left = [[UIBarButtonItem alloc]bk_initWithImage:[UIImage imageNamed:@"back.pdf.base.universal.regular.off.horizontal.normal.active.onepartscale.onepart.39371.000.00."] style:UIBarButtonItemStyleDone handler:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    self.navigationItem.leftBarButtonItem = left;
    
}
#pragma mark - lazyLoad
- (UIWebView *)webView {
    if(_webView == nil) {
        _webView = [[UIWebView alloc] init];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
    }
    return _webView;
}
@end
