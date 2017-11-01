//
//  UIView+backgroundColor.m
//  portal
//
//  Created by Store on 2017/9/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "UIView+backgroundColor.h"
#import "MACRO_COLOR.h"

@implementation UIView (backgroundColor)
- (instancetype)initWithColor:(unsigned long)color Alpha:(float)alpha{
    self = [self init];
    if (self) {
        self.backgroundColor = ColorWithHex(color, alpha);
    }
    return self;
}
- (void)setWithColor:(unsigned long)color Alpha:(float)alpha{
    self.backgroundColor = ColorWithHex(color, alpha);
}
@end
