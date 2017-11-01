//
//  UIImageView+Add.h
//  portal
//
//  Created by Store on 2017/8/31.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Add)
- (void)SetContentModeScaleAspectFill;
- (void)SetFilletWith:(CGFloat)Radius; 
- (void)SetBordersWith:(CGFloat)Width Color:(UIColor *)color;
-(UIImage *)GetScreenShotWithScreen:(UIView *)Screen;
@end
