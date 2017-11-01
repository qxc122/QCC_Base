//
//  baseCell.h
//  QCCViewRoundRound
//
//  Created by Store on 2017/11/1.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface baseCell : UITableViewCell
@property (nonatomic,strong)id data;
+ (instancetype)cell:(Class)cellClass returnCellWith:(UITableView *)tableView;
- (void)setData:(id)data;
@end
