//
//  UIColor+Add.m
//  portal
//
//  Created by Store on 2017/9/1.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "UIColor+Add.h"

@implementation UIColor (Add)
//根据颜色生成图片
- (UIImage *)imageWithColor{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f); //宽高 1.0只要有值就够了
    UIGraphicsBeginImageContext(rect.size); //在这个范围内开启一段上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [self CGColor]);//在这段上下文中获取到颜色UIColor
    CGContextFillRect(context, rect);//用这个颜色填充这个上下文
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();//从这段上下文中获取Image属性,,,结束
    UIGraphicsEndImageContext();
    
    return image;
}
@end
