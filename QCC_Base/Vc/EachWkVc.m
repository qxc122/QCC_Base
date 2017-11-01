//
//  EachWkVc.m
//  portal
//
//  Created by Store on 2017/8/31.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "EachWkVc.h"
#import "HeaderAll.h"
#import "NSDictionary+Add.h"

@interface EachWkVc ()<WKScriptMessageHandler>

//@property (nonatomic, assign) BOOL isSelected;
@property (weak, nonatomic) UIButton *btnRight;

@property (assign, nonatomic) BOOL isCollection;


@property (assign, nonatomic) BOOL isNeedRefresh;
@end


@implementation EachWkVc
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isNeedRefresh = NO;
        self.IsHaveRightBtn = NO;
    }
    return self;
}

- (void)setCokie{
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];
    [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"isDisplayFinancialBack"];
    [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"hideWebBack"];
    
    [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"backWeb"];
    [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"backRootWeb"];
    
    [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"finishWeb"];
    [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"displayFinancialButton"];
    
    
    [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"OpenNewWkWebview"]; //打开新页面
    [userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc] initWithDelegate:self] name:@"callPhone"]; //打电话
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:PORTALCHANNEL forKey:@"channel"];
    [parameters setObject:PORTALACCESSSOURCE forKey:@"accessSource"];
    [parameters setObject:PHONEVERSION forKey:@"accessSourceType"];
    [parameters setObject:PORTALVERSION forKey:@"version"];
    

    
    NSString *sessionContext = [parameters dictionaryToJsonForH5];;
    NSString *cookieStr = [NSString stringWithFormat:@"document.cookie = 'sessionContext=%@'",sessionContext];
    WKUserScript * cookieScript = [[WKUserScript alloc]
                                   initWithSource:cookieStr
                                   injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    [userContentController addUserScript:cookieScript];
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.userContentController = userContentController;
    
    self.config = config;
}

- (void)popSelf{
    if (self.isCloseBack && [self.webView canGoBack]) {
        [self.webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)viewDidLoad{
    [self setCokie];
    [super viewDidLoad];
#ifdef DEBUG
//    UIBarButtonItem* rightBarutton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"保存", @"") style:UIBarButtonItemStylePlain target:self action:@selector(saveFUNc)];
//    self.navigationItem.rightBarButtonItem = rightBarutton;
#endif
}
#ifdef DEBUG
- (void)saveFUNc{
    //执行js
    [self.webView evaluateJavaScript:@"window.webkit.messageHandlers.finishWeb.postMessage('1')" completionHandler:^(id data, NSError * _Nullable error) {
        if (error) {
            NSLog(@"失败:%@",error.description);
        } else {
            NSLog(@"成功");
        }
    }];
}
#endif

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    //接受传过来的消息从而决定app调用的方法
    NSString *method = message.name;
    NSLog(@"method=%@",method);
    if ([method isEqualToString:@"OpenNewWkWebview"]){
        [self OpenNewWkWebview:message.body];
    }else if ([method isEqualToString:@"callPhone"]){
        if ([message.body isKindOfClass:[NSString class]]) {
            NSString *Tel=[[NSMutableString alloc] initWithFormat:@"tel:%@",message.body];
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:Tel]]) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:Tel]];
            }
        }
    }else if ([method isEqualToString:@"finishWeb"]){
        [self jumpfinishWeb:message.body];
    }else if ([method isEqualToString:@"backWeb"]){
        if ([self.webView canGoBack]) {
            [self.webView goBack];
        }
    }else if ([method isEqualToString:@"displayFinancialButton"]){
//        [self jumpdisplayFinancialButton:message.body];
    }else if ([method isEqualToString:@"refreshBalance"]){

    }else if ([method isEqualToString:@"hideWebBack"]){
        [self jumphideWebBack:message.body];
    }else if ([method isEqualToString:@"backRootWeb"]){
        if (self.webView.backForwardList.backList.count >=1) {
            [self.webView goToBackForwardListItem:[self.webView.backForwardList.backList firstObject]];
        }
    }
}

- (void)jumphideWebBack:(NSDictionary *)dic{
    NSLog(@"%@",dic);
    NSString *str = (NSString *)dic;
    if ([str isKindOfClass:[NSString class]] && [str isEqualToString:@"1"]) {
        [self customBackButton];
    } else {
        UIBarButtonItem* leftBarutton = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
        self.navigationItem.leftBarButtonItem = leftBarutton;
    }
}
    
- (void)jumpfinishWeb:(NSDictionary *)dic{
    NSLog(@"%@",dic);
    if ([self.navigationController.topViewController isEqual:self]) {
        NSString *isNeedRefresh = (NSString *)dic;
        if ([isNeedRefresh isKindOfClass:[NSString class]] && self.navigationController.childViewControllers.count>=2) {
            EachWkVc *ttmp = self.navigationController.childViewControllers[self.navigationController.childViewControllers.count-2];
            if ([ttmp isKindOfClass:[EachWkVc class]]) {
                if ([isNeedRefresh isEqualToString:@"1"]) {
                    ttmp.isNeedRefresh = YES;
#ifdef DEBUG
//                    [MBProgressHUD showPrompt:@"我收到了H5要刷新de消息"];
#endif
                } else {
                    ttmp.isNeedRefresh = NO;
                }
            }
        }
        
    }
    [self.navigationController popViewControllerAnimated:YES];
}

//# 与原生交互
//
//recharge(type)  //充值方法 "rechargeBalance"(余额充值),"financialManageBalance"(理财充值)
//withdraw(type)  //提现方法 "withdrawBalance"(理财提现),"WithdrawFinancialManageBalance"(理财提现)
//
//isDisplayFinancialBack(boolean)  //顶部菜单栏显示返回按钮
//
//login();  //登录方法



- (void)Execute_the_JS_statementWith:(NSString *)str{
    [self.webView evaluateJavaScript:str completionHandler:^(id data, NSError * _Nullable error) {
        if (error) {
            NSLog(@"失败:%@",error.description);
        }else{
            NSLog(@"成功");
        }
    }];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%s",__func__);
}


#pragma --mark< OpenEachWkVc >
- (void)OpenNewWkWebview:(NSDictionary *)body{
    EachWkVc *vc = [EachWkVc new];
//    vc.url = body[@"url"];
    if ([body isKindOfClass:[NSString class]]) {
        vc.url = body;
    }else if ([body isKindOfClass:[NSDictionary class]]) {
        vc.url = body[@"url"];
        NSString *tmp = body[@"isClose"];
        if (tmp && tmp.length && [tmp isEqualToString:@"back"]) {
            vc.isCloseBack = YES;
        } else {
            vc.isCloseBack = NO;
        }
    }
    [self OPenVc:vc]; 
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isNeedRefresh) {
#ifdef DEBUG
//        [MBProgressHUD showPrompt:@"我要刷新了"];
#endif
        [self.webView reloadFromOrigin];
        self.isNeedRefresh = NO;
    }
}

- (void)resentCokie{
    if (self.webView.backForwardList.backList.count >=1) {
        [self.webView goToBackForwardListItem:[self.webView.backForwardList.backList firstObject]];
    }
    //    [self setUserScripts];
    //    if (self.webView.isLoading) {
    //        [self.webView stopLoading];
    //        [self.webView reload];
    //    }
    //    return;
    //js函数
    NSString *JSFuncString =
    @"function setCookieIOS(name,value,expires)\
    {\
    var oDate=new Date();\
    oDate.setDate(oDate.getDate()+expires);\
    document.cookie=name+'='+value+';expires='+oDate+';path=/'\
    }\
    function getCookieIOS(name)\
    {\
    var arr = document.cookie.match(new RegExp('(^| )'+name+'=([^;]*)(;|$)'));\
    if(arr != null) return unescape(arr[2]); return null;\
    }\
    function delCookieIOS(name)\
    {\
    var exp = new Date();\
    exp.setTime(exp.getTime() - 1);\
    var cval=getCookieIOS(name);\
    if(cval!=null) document.cookie= name + '='+cval+';expires='+exp.toGMTString();\
    }";
    
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:PORTALCHANNEL forKey:@"channel"];
    [parameters setObject:PORTALACCESSSOURCE forKey:@"accessSource"];
    [parameters setObject:PHONEVERSION forKey:@"accessSourceType"];
    [parameters setObject:PORTALVERSION forKey:@"version"];


    
    NSString *sessionContext = [parameters dictionaryToJsonForH5];
    
    //    NSString *cookieStr = [NSString stringWithFormat:@"document.cookie = 'sessionContext=%@'",sessionContext];
    
    
    //拼凑js字符串
    NSMutableString *JSCookieString = JSFuncString.mutableCopy;
    NSString *excuteJSStringDE1 = [NSString stringWithFormat:@"delCookieIOS('sessionContext');"];
    
    
    NSString *excuteJSString1 = [NSString stringWithFormat:@"setCookieIOS('%@', '%@', 1);", @"sessionContext",sessionContext];
    
    [JSCookieString appendString:excuteJSStringDE1];
    [JSCookieString appendString:excuteJSString1];
    
    //执行js
    [self.webView evaluateJavaScript:JSCookieString completionHandler:^(id data, NSError * _Nullable error) {
        if (error) {
            NSLog(@"失败:%@",error.description);
        } else {
            NSLog(@"成功");
        }
    }];

}
- (void)GET_NEW_TOKEN_NOTIFICATIONFunc:(NSNotification *)user{
    [self resentCokie];
}
#pragma --mark<登录退出的通知>
- (void)LOGIN_EXIT_NOTIFICATIONFunC:(NSNotification *)user{
    [self resentCokie];
}
@end

@implementation WeakScriptMessageDelegate

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate
{
    self = [super init];
    if (self) {
        _scriptDelegate = scriptDelegate;
    }
    return self;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    [self.scriptDelegate userContentController:userContentController didReceiveScriptMessage:message];
}
@end
