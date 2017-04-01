//
//  TableViewCellsdfsdf.m
//  TourismT
//
//  Created by Store on 2017/3/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "TableViewCellsdfsdf.h"
#import "QCCViewRoundRound.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
@interface TableViewCellsdfsdf ()
@property (nonatomic,weak) QCCViewRoundRound *avtor;
@property (nonatomic,weak) QCCViewRoundRound *avtor2;
@property (nonatomic,weak) QCCViewRoundRound *avtor3;

@end


@implementation TableViewCellsdfsdf
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    TableViewCellsdfsdf *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[TableViewCellsdfsdf alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        QCCViewRoundRound *avtor = [[QCCViewRoundRound alloc] init];
        [self.contentView addSubview:avtor];
        
        QCCViewRoundRound *avtor2 = [[QCCViewRoundRound alloc] init];
        [self.contentView addSubview:avtor2];
        
        QCCViewRoundRound *avtor3 = [[QCCViewRoundRound alloc] init];
        [self.contentView addSubview:avtor3];
        
        [avtor mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(5);
            make.bottom.equalTo(self.contentView).offset(-5);
            make.width.equalTo(@100);
            make.height.equalTo(@100);
        }];
        
        [avtor2 mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.right.equalTo(self.contentView);
            make.left.equalTo(avtor.mas_right).offset(30);
            make.top.equalTo(self.contentView).offset(5);
            make.bottom.equalTo(self.contentView).offset(-5);
            make.width.equalTo(@100);
            make.height.equalTo(@100);
        }];
        
        [avtor3 mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.right.equalTo(self.contentView);
            make.left.equalTo(avtor2.mas_right).offset(30);
            make.top.equalTo(self.contentView).offset(5);
            make.bottom.equalTo(self.contentView).offset(-5);
            make.width.equalTo(@100);
            make.height.equalTo(@100);
        }];
        avtor.radiusType = UIRectCornerBottomLeft;
        avtor.cornerRadius = 30;
        avtor.backgroundColor = [UIColor greenColor];
        avtor2.radiusType = UIRectCornerBottomRight;
        avtor2.cornerRadius = 20;
        //avtor2.backgroundColor = [UIColor redColor];
        avtor3.radiusType = UIRectCornerAllCorners;
        avtor3.cornerRadius = 40;
        self.avtor =avtor;
        self.avtor2 =avtor2;
        self.avtor3 =avtor3;
    }
    return self;
}
@end
