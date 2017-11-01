//
//  baseWkVc.h
//  portal
//
//  Created by Store on 2017/8/31.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "basicVc.h"
#import <WebKit/WKFoundation.h>
#import <WebKit/WebKit.h>

@interface baseWkVc : basicVc
@property (nonatomic,weak) WKWebView *webView;
@property (weak,nonatomic) UIProgressView *pro1;
@property (strong,nonatomic) WKWebViewConfiguration *config;
@property (nonatomic,strong) id url;


@property (nonatomic,assign) BOOL isCloseBack; //点击返回按钮是返回上一级还是关闭当前控制器  默认是返回

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context;
@end
