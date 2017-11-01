//
//  UITextField+Add.m
//  portal
//
//  Created by Store on 2017/9/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "UITextField+Add.h"

@implementation UITextField (Add)
- (instancetype)initWithColor:(unsigned long)color Alpha:(float)alpha Font:(NSInteger)font ROrM:(NSString *)rOrm{
    self = [self init];
    if (self) {
        self.textColor = ColorWithHex(color, alpha);
        if ([rOrm isEqualToString:@"r"] || [rOrm isEqualToString:@"R"]) {
            self.font = [UIFont systemFontOfSize:font];
        } else if ([rOrm isEqualToString:@"m"] || [rOrm isEqualToString:@"M"]) {
            self.font = [UIFont boldSystemFontOfSize:font];
        }
    }
    return self;
}

- (void)setWithColor:(unsigned long)color Alpha:(float)alpha Font:(NSInteger)font ROrM:(NSString *)rOrm{
    self.textColor = ColorWithHex(color, alpha);
    if ([rOrm isEqualToString:@"r"] || [rOrm isEqualToString:@"R"]) {
        self.font = [UIFont systemFontOfSize:font];
    } else if ([rOrm isEqualToString:@"m"] || [rOrm isEqualToString:@"M"]) {
        self.font = [UIFont boldSystemFontOfSize:font];
    }
}
@end
