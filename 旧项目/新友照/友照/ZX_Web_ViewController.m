//
//  ZX_Web_ViewController.m
//  友照
//
//  Created by cleloyang on 2016/11/24.
//  Copyright © 2016年 ZX_XPH. All rights reserved.
//

#import "ZX_Web_ViewController.h"
#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"

@interface ZX_Web_ViewController ()<UIWebViewDelegate, NJKWebViewProgressDelegate>

@property (nonatomic, strong) NJKWebViewProgressView *webViewProgressView;
@property (nonatomic, strong) NJKWebViewProgress *webViewProgress;
@property (nonatomic, strong)NSURL *fileURL;
@end

@implementation ZX_Web_ViewController

- (void)viewDidDisappear:(BOOL)animated
{
    [_webViewProgressView removeFromSuperview];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = _titleStr;
    _webViewProgress = [[NJKWebViewProgress alloc] init];
    _webV.delegate = _webViewProgress;
    _webViewProgress.webViewProxyDelegate = self;
    _webViewProgress.progressDelegate = self;
    
    
    CGRect navBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0,navBounds.size.height - 2,navBounds.size.width,2);
    _webViewProgressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    _webViewProgressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [_webViewProgressView setProgress:0 animated:YES];
    
    _fileURL = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"%@.html",_htmlStr] withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.fileURL];
    [self.webV loadRequest:request];
    
    [self.navigationController.navigationBar addSubview:_webViewProgressView];
}


//更新进度
- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [_webViewProgressView setProgress:progress animated:YES];
}

//页面加载成功
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //关闭进度条
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

//页面加载失败
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //关闭进度条
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
