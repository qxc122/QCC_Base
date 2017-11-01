//
//  basicUiTableView.m
//  TourismT
//
//  Created by Store on 2017/7/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "basicUiTableView.h"
#import "AFNetworkReachabilityManager.h"

#define  NETWORK_FROM_CONNECTION_TO_CONNECTION_NOTIFICATION @"NETWORK_FROM_CONNECTION_TO_CONNECTION_NOTIFICATION"

@interface basicUiTableView ()<UITableViewDelegate,UITableViewDataSource>
//@property (nonatomic,assign) BOOL isNeedRefresh; 
@end

NSInteger Mystatus = AFNetworkReachabilityStatusReachableViaWWAN;
@implementation basicUiTableView
+ (void)initialize
{
    if (self == [self class]) {
        //        1.创建网络状态监测管理者
        AFNetworkReachabilityManager *manger = [AFNetworkReachabilityManager sharedManager];
        //        开启监听，记得开启，不然不走block
        [manger startMonitoring];
        //        2.监听改变
        [manger setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                    NSLog(@"未知");
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    NSLog(@"没有网络");
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    NSLog(@"3G|4G");
                    [self postNETWORK_FROM_CONNECTION_TO_CONNECTION_NOTIFICATION];
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    NSLog(@"WiFi");
                    [self postNETWORK_FROM_CONNECTION_TO_CONNECTION_NOTIFICATION];
                    break;
                default:
                    break;
            }
            Mystatus = status;
        }];
    }
}
+ (void)postNETWORK_FROM_CONNECTION_TO_CONNECTION_NOTIFICATION{
    if (Mystatus != AFNetworkReachabilityStatusReachableViaWWAN && Mystatus != AFNetworkReachabilityStatusReachableViaWiFi) {
        NSNotification *notification =[NSNotification notificationWithName:NETWORK_FROM_CONNECTION_TO_CONNECTION_NOTIFICATION object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isNeedRefreth) {
        self.isNeedRefreth = NO;
        self.header.hidden = NO;
        [self.header beginRefreshing];
    }
}
#pragma --mark<网络从无连接到连接的通知>
- (void)NETWORK_FROM_CONNECTION_TO_CONNECTION_NOTIFICATIONFunC:(NSNotification *)user{
    if (self.tableView) {
        self.empty_type = NoNetworkConnection_TO_NetworkConnection_empty_num;
        [self.tableView reloadData];
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.style = UITableViewStyleGrouped;
        self.Pagesize = TOURPAGESIZE;
        self.Pagenumber = FIRSTPAGE;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableView];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(NETWORK_FROM_CONNECTION_TO_CONNECTION_NOTIFICATIONFunC:)
                                                 name:NETWORK_FROM_CONNECTION_TO_CONNECTION_NOTIFICATION
                                               object:nil];
}
- (void)setTableView{
    UIView *back = [UIView new];
    back.backgroundColor =[UIColor clearColor];
    [self.view addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:self.style];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    tableView.backgroundColor =  [UIColor clearColor];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.mj_header = self.header;
    [self setDZNEmptyDelegate:tableView];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}
- (void)setRegisterClasss:(NSArray *)registerClasss{
    _registerClasss = registerClasss;
    for (Class tmp in registerClasss) {
        [self.tableView registerClass:tmp forCellReuseIdentifier:NSStringFromClass(tmp)];
    }
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.empty_type == succes_empty_num) {
        id cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
        if ([cell isKindOfClass:[UITableViewCell class]]) {
            kWeakSelf(self);
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([cell class]) configuration:^(id cell) {
                NSString *method =[NSString stringWithFormat:@"configure%@:atIndexPath:",NSStringFromClass([cell class])];

                SEL selector = NSSelectorFromString(method);
                if ([weakself respondsToSelector:selector]) {
                    [weakself performSelector:selector withObject:cell withObject:indexPath];
                }
            }];
        }
    }
    return 0.01;
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellT"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellT"];
    }
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     return [[UIView alloc] init];
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
     return [[UIView alloc] init];
}
#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.empty_type == succes_empty_num) {
        return 1;
    }
    return 0;
}



- (void)loadNewDataEndHeadsuccessSet:(UITableView *)TableView code:(NSInteger)code footerIsShow:(BOOL)footerIsShow hasMore:(NSString *)hasMore{
    if (!TableView) {
        TableView = self.tableView;
    }
    self.empty_type = code;
    [self.header endRefreshing];
    self.header.hidden = YES;
    [TableView reloadData];
    if (self.empty_type == succes_empty_num && footerIsShow) {
        self.tableView.mj_footer = self.footer;
        if ([hasMore isEqualToString:@"1"]) {
            self.footer.hidden = NO;
            if (self.footer.state == MJRefreshStateNoMoreData) {
                [self.footer resetNoMoreData];
            }
        }else{
            self.footer.hidden = YES;
        }
        self.Pagenumber++;
    }
}
- (void)loadNewDataEndHeadfailureSet:(UITableView *)TableView errorCode:(NSInteger)errorCode{
    if (!TableView) {
        TableView = self.tableView;
    }
    self.empty_type = errorCode;
    [self.header endRefreshing];
    self.footer.hidden = YES;
    [TableView reloadData];
}

- (void)loadMoreDataEndFootsuccessSet:(UITableView *)TableView  hasMore:(NSString *)hasMore{
    if (!TableView) {
        TableView = self.tableView;
    }
    [self.footer endRefreshing];
    if ([hasMore isEqualToString:@"1"]) {
        self.footer.hidden = NO;
        if (self.footer.state == MJRefreshStateNoMoreData) {
            [self.footer resetNoMoreData];
        }
    }else{
        self.footer.hidden = YES;
    }
    self.Pagenumber++;
    [TableView reloadData];
}
- (void)loadMoreDataEndFootfailureSet:(UITableView *)TableView errorCode:(NSInteger)errorCode msg:(NSString *)msg{
    if (!TableView) {
        TableView = self.tableView;
    }
    if (msg && msg.length) {
        [MBProgressHUD showPrompt:msg toView:self.view];
    }
    [self.footer endRefreshing];
}

@end

