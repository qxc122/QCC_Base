//
//  basicUiTableView.h
//  TourismT
//
//  Created by Store on 2017/7/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "basicVc.h"




@interface basicUiTableView : basicVc
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,assign) UITableViewStyle  style; // 默认是分组
@property (nonatomic,assign) NSInteger Pagenumber;
@property (nonatomic,assign) NSInteger Pagesize;

@property (nonatomic,strong) NSArray  *registerClasss; //需要注册的cell


@property (nonatomic,assign) BOOL isNeedRefreshWhenLoginOrOut;
- (void)loadNewDataEndHeadsuccessSet:(UITableView *)TableView code:(NSInteger)code footerIsShow:(BOOL)footerIsShow  hasMore:(NSString *)hasMore;
- (void)loadNewDataEndHeadfailureSet:(UITableView *)TableView errorCode:(NSInteger)errorCode;

- (void)loadMoreDataEndFootsuccessSet:(UITableView *)TableView  hasMore:(NSString *)hasMore;
- (void)loadMoreDataEndFootfailureSet:(UITableView *)TableView errorCode:(NSInteger)errorCode msg:(NSString *)msg;

//#pragma --mark< UITableViewDelegate 高 必要时，子类可以重写父类方法>
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;


@end
