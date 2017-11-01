//
//  UIImageView+Add.m
//  portal
//
//  Created by Store on 2017/8/31.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "UIImageView+Add.h"

@implementation UIImageView (Add)
- (void)SetContentModeScaleAspectFill{
    self.contentMode = UIViewContentModeScaleAspectFill; 
    self.clipsToBounds = YES;
}

- (void)SetFilletWith:(CGFloat)Radius{
    [self.layer setCornerRadius:Radius*0.5];
    [self.layer setMasksToBounds:YES];
}

- (void)SetBordersWith:(CGFloat)Width Color:(UIColor *)color{
    [self.layer setBorderWidth:(Width)];
    [self.layer setBorderColor:[color CGColor]];
}

-(UIImage *)GetScreenShotWithScreen:(UIView *)Screen
{
    UIGraphicsBeginImageContext(Screen.frame.size);
    [Screen.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * shotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGImageRef shotRef = shotImage.CGImage;
    CGImageRef ResultRef = CGImageCreateWithImageInRect(shotRef, self.frame);
    UIImage * Result = [UIImage imageWithCGImage:ResultRef];
    CGImageRelease(ResultRef);
    return Result;
}
@end
