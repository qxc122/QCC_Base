//
//  basicVc.h
//  Tourism
//
//  Created by Store on 16/11/8.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderAll.h"


typedef NS_ENUM(NSInteger, empty_num)
{
    In_loading_empty_num = -48, //加载中
    fail_empty_num = 0, //加载失败
    succes_empty_num = 1,   //加载成功
    NoNetworkConnection_empty_num = 2,   //无网络连接
    NoNetworkConnection_TO_NetworkConnection_empty_num,   //从无网络连接 到有 网络连接
};

@interface basicVc : UIViewController
@property(assign, nonatomic) UIStatusBarStyle statusBarStyle;
@property (nonatomic,assign) CGFloat  sesPro;//提示多少秒 
@property (nonatomic,strong) MJRefreshHeader *header;//头部
@property (nonatomic,strong) MJRefreshFooter *footer;//底部
@property (nonatomic,assign) BOOL  isNeedRefreth;
@property (nonatomic,strong) NSString  *NodataTitle; // 没有数据时候的标题
@property (nonatomic,strong) NSString  *NodataDescribe; // 没有数据时候的描叙
@property (nonatomic,assign) empty_num  empty_type; //
@property (nonatomic,strong) NSArray *CTrollersToR; //将要移除的控制器



- (void)customBackButton;
- (void)popSelf;
- (void)setDZNEmptyDelegate:(id)TabOrColl;


- (void)openEachWkVcWithId:(id)url;

- (void)openbaseWkVcWithId:(id)url;


- (void)loadNewData;

- (void)loadMoreData;

- (void)OPenVc:(UIViewController *)vc;
    
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView;

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView;

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state;

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state;

- (void)DidTap;
@end
