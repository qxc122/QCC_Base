//
//  baseWkVc.m
//  portal
//
//  Created by Store on 2017/8/31.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "baseWkVc.h"


@interface baseWkVc ()<WKNavigationDelegate,WKUIDelegate>

@end

@implementation baseWkVc
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isCloseBack = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *back = [UIView new];
    [self.view addSubview:back];
    back.backgroundColor  =[UIColor clearColor];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    WKWebView *webView;
    if (self.config) {
        webView = [[WKWebView alloc]initWithFrame:CGRectZero configuration:self.config];
    } else {
        webView = [[WKWebView alloc]initWithFrame:CGRectZero];
    }
    
    //打开左划回退功能
//    webView.allowsBackForwardNavigationGestures =YES;
    [self.view addSubview:webView];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    self.webView = webView;
    webView.backgroundColor = VIEW_BACKGROUND_COLOR;
    webView.scrollView.showsHorizontalScrollIndicator = NO;
    webView.scrollView.showsVerticalScrollIndicator = NO;
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    UIProgressView *pro1=[[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    //设置的高度对进度条的高度没影响，整个高度=进度条的高度，进度条也是个圆角矩形
    //但slider滑动控件：设置的高度对slider也没影响，但整个高度=设置的高度，可以设置背景来检验
    [self.view addSubview:pro1];
    [pro1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.webView);
        make.right.equalTo(self.webView);
        make.top.equalTo(self.view);
        make.height.equalTo(@2);
    }];
    self.pro1 = pro1;
    //设置进度条颜色
    pro1.trackTintColor = [UIColor clearColor];
    //设置进度默认值，这个相当于百分比，范围在0~1之间，不可以设置最大最小值
    pro1.progress=0.0;
    //设置进度条上进度的颜色
    pro1.progressTintColor=[UIColor redColor];
    
    [webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    if (self.url) {
        if ([self.url isKindOfClass:[NSURL class]]) {
            [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
        }else if ([self.url isKindOfClass:[NSString class]]) {
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
        }
    }
}
- (void)setUrl:(id)url{
    _url = url;
    if (url) {
        if ([self.url isKindOfClass:[NSURL class]]) {
            [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
        }else if ([self.url isKindOfClass:[NSString class]]) {
            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
        }
    }
}
- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"title"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    NSLog(@"%s",__func__);
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"] ) {
        // 这里就不写进度条了，把加载的进度打印出来，进度条可以自己加上去！
        CGFloat newProgress = [[change objectForKey:NSKeyValueChangeNewKey] floatValue];
        NSLog(@"%f",newProgress);
        [self.pro1 setAlpha:1.0f];
        [self.pro1 setProgress:newProgress animated:YES];
        if (newProgress >= 1.0f) {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.pro1 setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.pro1 setProgress:0.0f animated:NO];
            }];
        }
    } else if (object == self.webView && [keyPath isEqualToString:@"title"] ) {
        // 这里就不写进度条了，把加载的进度打印出来，进度条可以自己加上去！
        //NSString *title = self.webView.title;
        if ([self.webView.title rangeOfString:@"."].location == NSNotFound && self.webView.title.length && ![self.webView.title isEqualToString:@"首页"]) {
            self.title = self.webView.title;
        }
    }else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}



//alert 警告框
-(void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    NSLog(@"alert message:%@",message);
}


//confirm 确认框
-(void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请确认" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }]];
    [self presentViewController:alert animated:YES completion:NULL];
    
    NSLog(@"confirm message:%@", message);
    
}

//prompt 输入框函数：

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"输入框" message:prompt preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.textColor = [UIColor blackColor];
    }];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler([[alert.textFields lastObject] text]);
    }]];
    
    [self presentViewController:alert animated:YES completion:NULL];
}

#pragma mark - WKUIDelegate
-(WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}


//- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
//    NSHTTPURLResponse *response = (NSHTTPURLResponse *)navigationResponse.response;
//    NSArray *cookies =[NSHTTPCookie cookiesWithResponseHeaderFields:[response allHeaderFields] forURL:response.URL];
//    //读取wkwebview中的cookie
//    for (NSHTTPCookie *cookie in cookies) {
//        // 这里就是你需要的cookie
//        NSLog(@"cookie=%@",cookie);
//        //        NSLog(@"cookie=%@",cookie);
//    }
//    decisionHandler(WKNavigationResponsePolicyAllow);
//}
//
//- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
//    NSLog(@"sdf");
//}
//-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
//    //如果是跳转一个新页面
//    if (navigationAction.targetFrame == nil) {
//        [webView loadRequest:navigationAction.request];
//    }
//    decisionHandler(WKNavigationActionPolicyAllow);
//}
@end
