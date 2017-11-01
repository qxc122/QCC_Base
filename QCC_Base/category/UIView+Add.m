//
//  UIView+Add.m
//  portal
//
//  Created by Store on 2017/9/1.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "UIView+Add.h"

@implementation UIView (Add)
- (void)SetFilletWith:(CGFloat)Radius{
    [self.layer setCornerRadius:Radius*0.5];
    [self.layer setMasksToBounds:YES];
}
- (void)SetUIViewBordersWith:(CGFloat)Width Color:(UIColor *)color{
    [self.layer setBorderWidth:(Width)];
    [self.layer setBorderColor:[color CGColor]];
}
@end
