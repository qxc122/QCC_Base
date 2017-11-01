//
//  UIImage+Add.m
//  portal
//
//  Created by Store on 2017/9/18.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "UIImage+Add.h"

@implementation UIImage (Add)
- (UIImage *)returnImageWithInsets:(UIEdgeInsets )insets{
    return  [self resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
}


//2、简单粗暴地图片裁剪方法 裁剪出的图片尺寸按照size的尺寸，但图片可能会被拉伸
- (UIImage *)thumbnailsize:(CGSize)asize
{
    UIImage *newimage;
    if (nil == self) {
        newimage = nil;
    }else{
        UIGraphicsBeginImageContext(asize);
        [self drawInRect:CGRectMake(0, 0, asize.width, asize.height)];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}
@end
