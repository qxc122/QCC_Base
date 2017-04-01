//
//  testtttttttt.m
//  TourismT
//
//  Created by Store on 2017/3/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "testtttttttt.h"
#import "TableViewCellsdfsdf.h"
#import "Masonry.h"
#import "UITableView+FDTemplateLayoutCell.h"
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;


@interface testtttttttt ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) NSTimer *scrollTimer;
@property (nonatomic,assign) NSInteger num;

@end


@implementation testtttttttt

- (void)viewDidLoad {
    [super viewDidLoad];
    self.num = 10;
    [self setUI];
}
- (void)setUI{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    //tableView.bounces = NO;
    //    tableView.tableHeaderView = cycleScrollView3;
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    tableView.backgroundColor = [UIColor clearColor];
        tableView.delegate = self;
        tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    [tableView registerClass:[TableViewCellsdfsdf class] forCellReuseIdentifier:NSStringFromClass([TableViewCellsdfsdf class])];

}


#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //return 200;
    
    kWeakSelf(self);
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([TableViewCellsdfsdf class]) configuration:^(TableViewCellsdfsdf *cell) {
        [weakself configureTableViewCellsdfsdf:cell atIndexPath:indexPath];
    }];
    return 0;
}
#pragma -mark<配置 cell>
- (void)configureTableViewCellsdfsdf:(TableViewCellsdfsdf *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.indexss = indexPath.row%3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return 0;
    return self.num;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{    TableViewCellsdfsdf *cell = [TableViewCellsdfsdf returnCellWith:tableView];
    [self configureTableViewCellsdfsdf:cell atIndexPath:indexPath];
    return  cell;
}


@end
