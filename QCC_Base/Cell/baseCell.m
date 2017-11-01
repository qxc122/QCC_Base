//
//  baseCell.m
//  QCCViewRoundRound
//
//  Created by Store on 2017/11/1.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "baseCell.h"

@implementation baseCell

+ (instancetype)cell:(Class)cellClass returnCellWith:(UITableView *)tableView
{
    NSAssert(cellClass, @"cellClass 不能为空");
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
    if (cell == nil) {
        cell = [[cellClass alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(cellClass)];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)setData:(id)data{
    _data = data;
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    // Configure the view for the selected state
//}

@end
