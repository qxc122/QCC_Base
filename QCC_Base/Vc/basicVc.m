//
//  basicVc.m
//  Tourism
//
//  Created by Store on 16/11/8.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "basicVc.h"

@interface basicVc ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end


@implementation basicVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customNavigationBar];
    [self customBackButton];
    self.view.backgroundColor = RGBACOLOR(255, 255, 255, 1);
    self.empty_type = In_loading_empty_num;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(LOGIN_EXIT_NOTIFICATIONFunC:)
                                                 name:LOGIN_EXIT_NOTIFICATION
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(GET_NEW_TOKEN_NOTIFICATIONFunc:)
                                                 name:GET_NEW_TOKEN_NOTIFICATION
                                               object:nil];
}

- (void)GET_NEW_TOKEN_NOTIFICATIONFunc:(NSNotification *)user{
//    self.FLAG_IN_DATA_UPDATE = YES;
//    [self loadNewData];
}

#pragma --mark<登录退出的通知>
- (void)LOGIN_EXIT_NOTIFICATIONFunC:(NSNotification *)user{
//    if (![[PortalHelper sharedInstance] get_userInfo] && [self.navigationController.topViewController isEqual:self]) {
//        [self.navigationController popToRootViewControllerAnimated:YES];
//    }
}
- (void)setRightBtn{
    [self.navigationItem.rightBarButtonItem setTintColor:COLOUR_TITLE_NORMAL];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(15),NSFontAttributeName, nil] forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(15),NSFontAttributeName, nil] forState:UIControlStateHighlighted];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(15),NSFontAttributeName, nil] forState:UIControlStateSelected];
}

- (void)customNavigationBar
{
    // 1.2设置所有导航条的标题颜色
    UINavigationBar *navBar = [UINavigationBar appearance];
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    md[NSFontAttributeName] = PingFangSC_Medium(17);
    md[NSForegroundColorAttributeName] = COLOUR_TITLE_NORMAL;
    [navBar setTitleTextAttributes:md]; 
}

- (void)customBackButton
{
    UIImage* image = [[UIImage imageNamed:PIC_CUSTOM_NAVIGATION_BACK_KING] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem* leftBarutton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(popSelf)];
    self.navigationItem.leftBarButtonItem = leftBarutton;
}
- (void)setDZNEmptyDelegate:(id)TabOrColl{
    if ([TabOrColl isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)TabOrColl;
        tableView.emptyDataSetSource = self;
        tableView.emptyDataSetDelegate = self;
    }else if ([TabOrColl isKindOfClass:[UICollectionView class]]) {
        UICollectionView *colobleView = (UICollectionView *)TabOrColl;
        colobleView.emptyDataSetSource = self;
        colobleView.emptyDataSetDelegate = self;
    }
}

- (void)popSelf
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc{
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%s",__func__);
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.statusBarStyle = UIStatusBarStyleLightContent;
        self.sesPro = 1.0f;
        [self hideBottomBarWhenPush];
        self.NodataTitle = NSLocalizedString(@"暂无数据", @"暂无数据");
        self.NodataDescribe = @" ";
    }
    return self;
}
- (void)hideBottomBarWhenPush
{
    self.hidesBottomBarWhenPushed = YES;
}

#pragma -mark<mj_header  头部>
- (MJRefreshHeader *)header{
    if (!_header) {
//        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//        [header setImages:@[[UIImage imageNamed:@"type1"],[UIImage imageNamed:@"type2"],[UIImage imageNamed:@"type3"],[UIImage imageNamed:@"type4"]] forState:MJRefreshStateIdle];
//        // Set the pulling state of animated images（Enter the status of refreshing as soon as loosen）
//        [header setImages:@[[UIImage imageNamed:@"type1"],[UIImage imageNamed:@"type2"],[UIImage imageNamed:@"type3"],[UIImage imageNamed:@"type4"]] forState:MJRefreshStatePulling];
//        // Set the refreshing state of animated images
//        [header setImages:@[[UIImage imageNamed:@"type1"],[UIImage imageNamed:@"type2"],[UIImage imageNamed:@"type3"],[UIImage imageNamed:@"type4"]] forState:MJRefreshStateRefreshing];
//        
//        // Hide the time
//        header.lastUpdatedTimeLabel.hidden = YES;
//        
//        // Hide the status
//        header.stateLabel.hidden = YES;
//        // Set header
//        
//        _header = header;
        
        MJRefreshHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        _header = header;
    }
    return _header;
}

#pragma -mark<加载新数据>
- (void)loadNewData{
    
}
#pragma -mark<加载更多数据>
- (void)loadMoreData{
    
}

#pragma -mark<mj_footer  头部>
- (MJRefreshFooter *)footer{
    if (!_footer) {
        MJRefreshFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        _footer = footer;
    }
    return _footer;
}



#pragma --mark<打开  baseWkVc 页面>
- (void)openbaseWkVcWithId:(id)url{
//    baseWkVc *wkweb = [[baseWkVc alloc]init];
//    wkweb.url = url;
//    [self OPenVc:wkweb];
}

#pragma --mark<打开  baseWkVc 页面>
- (void)openEachWkVcWithId:(id)url{
//    EachWkVc *wkweb = [[EachWkVc alloc]init];
//    wkweb.url = url;
//    [self OPenVc:wkweb];
}

- (void)OPenVc:(UIViewController *)vc{
    UINavigationController *tmp = [[UIApplication sharedApplication]keyWindow].rootViewController;
    if ([tmp isKindOfClass:[UINavigationController class]]) {
        [tmp pushViewController:vc animated:YES];
    }
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.CTrollersToR.count) {
        NSMutableArray *muArry =[self.navigationController.viewControllers mutableCopy];
        for (UIViewController *vc in self.navigationController.viewControllers) {
            for (Class class in self.CTrollersToR) {
                if ([vc isKindOfClass:class] && ![vc isEqual:self.navigationController.topViewController]) {
                    [muArry removeObject:vc];
                    break;
                }
            }
        }
        self.navigationController.viewControllers = muArry;
        self.CTrollersToR = nil;
    }
}

#pragma --<空白页处理>
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    if (self.empty_type == succes_empty_num) {
        return [UIImage imageNamed:PIC_NONE_DATA_PLACE];
    } else if (self.empty_type == fail_empty_num) {
        return [UIImage imageNamed:PIC_NONE_NET_PLACE];
    } else if (self.empty_type == NoNetworkConnection_empty_num) {
        return [UIImage imageNamed:PIC_NONE_NET_PLACE];
    }else{
        return [UIImage imageNamed:PIC_NONE_NET_PLACE];
    }
    return nil;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
   
    if (self.empty_type == NoNetworkConnection_empty_num) {
        NSMutableAttributedString *all = [[NSMutableAttributedString alloc]init];
        NSAttributedString *title = [[NSString stringWithFormat:@"\n%@",NSLocalizedString(@"您的网络未连接", @"您的网络未连接")] CreatMutableAttributedStringWithFont:PingFangSC_Regular(14) Color:ColorWithHex(0x000000, 0.4) LineSpacing:0 Alignment:NSTextAlignmentCenter BreakMode:NSLineBreakByTruncatingTail firstLineHeadIndent:0 headIndent:0 paragraphSpacing:0 WordSpace:0];
        [all appendAttributedString:title];
        return all;
    }if (self.empty_type == NoNetworkConnection_TO_NetworkConnection_empty_num) {
        NSMutableAttributedString *all = [[NSMutableAttributedString alloc]init];
        NSAttributedString *title = [[NSString stringWithFormat:@"\n%@",NSLocalizedString(@"您的网络未连接", @"您的网络未连接")] CreatMutableAttributedStringWithFont:PingFangSC_Regular(14) Color:ColorWithHex(0x000000, 0.4) LineSpacing:0 Alignment:NSTextAlignmentCenter BreakMode:NSLineBreakByTruncatingTail firstLineHeadIndent:0 headIndent:0 paragraphSpacing:0 WordSpace:0];
        [all appendAttributedString:title];
        return all;
    }else if (self.empty_type == succes_empty_num){
        NSMutableAttributedString *all = [[NSMutableAttributedString alloc]init];
        NSAttributedString *title = [[NSString stringWithFormat:@"\n%@",self.NodataTitle&&self.NodataTitle.length?self.NodataTitle:@" "] CreatMutableAttributedStringWithFont:PingFangSC_Regular(14) Color:ColorWithHex(0x000000, 0.4) LineSpacing:0 Alignment:NSTextAlignmentCenter BreakMode:NSLineBreakByTruncatingTail firstLineHeadIndent:0 headIndent:0 paragraphSpacing:0 WordSpace:0];
        [all appendAttributedString:title];
        return all;
    }else{
        NSMutableAttributedString *all = [[NSMutableAttributedString alloc]init];
        NSAttributedString *title = [[NSString stringWithFormat:@"\n%@",NSLocalizedString(@"服务器开小差了,请重试", @"服务器开小差了,请重试")] CreatMutableAttributedStringWithFont:PingFangSC_Regular(14) Color:ColorWithHex(0x000000, 0.4) LineSpacing:0 Alignment:NSTextAlignmentCenter BreakMode:NSLineBreakByTruncatingTail firstLineHeadIndent:0 headIndent:0 paragraphSpacing:0 WordSpace:0];
        [all appendAttributedString:title];
        return all;
    }
    return nil;
}
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView{
    if (self.empty_type == NoNetworkConnection_empty_num) {
        NSMutableAttributedString *all = [[NSMutableAttributedString alloc]init];
        [all appendAttributedString:[@"\n\n\n " CreatMutableAttributedStringWithFont:PingFangSC_Regular(12) Color:ColorWithHex(0x2D2D2D, 0.3) LineSpacing:0 Alignment:NSTextAlignmentCenter BreakMode:NSLineBreakByTruncatingTail firstLineHeadIndent:0 headIndent:0 paragraphSpacing:0 WordSpace:0]];
        return all;
    }if (self.empty_type == NoNetworkConnection_TO_NetworkConnection_empty_num) {
        NSMutableAttributedString *all = [[NSMutableAttributedString alloc]init];
        [all appendAttributedString:[@"\n\n\n " CreatMutableAttributedStringWithFont:PingFangSC_Regular(12) Color:ColorWithHex(0x2D2D2D, 0.3) LineSpacing:0 Alignment:NSTextAlignmentCenter BreakMode:NSLineBreakByTruncatingTail firstLineHeadIndent:0 headIndent:0 paragraphSpacing:0 WordSpace:0]];
        return all;
    }else if (self.empty_type == succes_empty_num){
        NSMutableAttributedString *all = [[NSMutableAttributedString alloc]init];
        NSAttributedString *title = [[NSString stringWithFormat:@"%@\n\n",self.NodataDescribe&&self.NodataDescribe.length?self.NodataDescribe:@" "] CreatMutableAttributedStringWithFont:PingFangSC_Regular(14) Color:ColorWithHex(0x000000, 0.4) LineSpacing:0 Alignment:NSTextAlignmentCenter BreakMode:NSLineBreakByTruncatingTail firstLineHeadIndent:0 headIndent:0 paragraphSpacing:0 WordSpace:0];
        [all appendAttributedString:title];
        return all;
    }else{
        NSMutableAttributedString *all = [[NSMutableAttributedString alloc]init];
        [all appendAttributedString:[@"\n\n\n " CreatMutableAttributedStringWithFont:PingFangSC_Regular(12) Color:ColorWithHex(0x2D2D2D, 0.3) LineSpacing:0 Alignment:NSTextAlignmentCenter BreakMode:NSLineBreakByTruncatingTail firstLineHeadIndent:0 headIndent:0 paragraphSpacing:0 WordSpace:0]];
        return all;
    }
    return nil;
}
//按钮文本或者背景样式
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    if (self.empty_type == NoNetworkConnection_empty_num) {
        return [NSLocalizedString(@"检查设置", @"检查设置") CreatMutableAttributedStringWithFont:PingFangSC_Regular(16) Color:ColorWithHex(0x4EA2FF, 1.0) LineSpacing:0 Alignment:NSTextAlignmentCenter BreakMode:NSLineBreakByTruncatingTail firstLineHeadIndent:0 headIndent:0 paragraphSpacing:0 WordSpace:0];
    }else if (self.empty_type != succes_empty_num){
        return [NSLocalizedString(@"重新加载", @"重新加载") CreatMutableAttributedStringWithFont:PingFangSC_Regular(16) Color:ColorWithHex(0x4EA2FF, 1.0) LineSpacing:0 Alignment:NSTextAlignmentCenter BreakMode:NSLineBreakByTruncatingTail firstLineHeadIndent:0 headIndent:0 paragraphSpacing:0 WordSpace:0];
    }if (self.empty_type == NoNetworkConnection_TO_NetworkConnection_empty_num) {
        return [NSLocalizedString(@"重新加载", @"重新加载") CreatMutableAttributedStringWithFont:PingFangSC_Regular(16) Color:ColorWithHex(0x4EA2FF, 1.0) LineSpacing:0 Alignment:NSTextAlignmentCenter BreakMode:NSLineBreakByTruncatingTail firstLineHeadIndent:0 headIndent:0 paragraphSpacing:0 WordSpace:0];
    }
    return nil;
}
- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state{
    if(self.empty_type != succes_empty_num || self.empty_type == NoNetworkConnection_empty_num || self.empty_type == NoNetworkConnection_TO_NetworkConnection_empty_num){
        return  [UIImage imageNamed:EMPTY_STATUS_BUTTON_BOX];
    }
    return nil;
}

//- (CGPoint)offsetForEmptyDataSet:(UIScrollView *)scrollView{
//      return CGPointMake(SCREENWIDTH*0.5, 300);
//}
//
//- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView{
//    return 30;
//}
//
//- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView{
//    return 15.0;
//}


//空白页的背景色

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIColor clearColor];
}

//是否显示空白页，默认YES
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    if (self.empty_type == In_loading_empty_num){
        return NO;
    }
    return YES;
}

//空白页点击事件
//- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView {
//    [self DidTap];
//}

- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView{
    if (self.empty_type == NoNetworkConnection_empty_num) {
        [self CheckNetWork];
    }else{
        [self DidTap];
    }
}

- (void)CheckNetWork{
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

- (void)DidTap{
    if (self.empty_type != succes_empty_num) {
        if ([AFNetworkReachabilityManager sharedManager].reachable) {
            self.header.hidden = NO;
            [self.header beginRefreshing];
        }
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:self.statusBarStyle];
}
@end
