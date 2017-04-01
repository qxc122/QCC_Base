//
//  SkyRadiusView.m
//  SkyRadiusView
//
//  Created by skytoup on 15/8/11.
//  Copyright (c) 2015年 skytoup. All rights reserved.
//

#import "QCCViewRoundRound.h"

@interface QCCViewRoundRound ()
@property (strong, nonatomic) UIColor *bgColor;
@end

@implementation QCCViewRoundRound

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:[UIColor clearColor]];
    _bgColor = backgroundColor;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    UIBezierPath *p = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:_radiusType cornerRadii:CGSizeMake(_cornerRadius, 0.f)];
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextAddPath(c, p.CGPath);
    CGContextClosePath(c);
    CGContextClip(c);
    CGContextAddRect(c, rect);
    CGContextSetFillColorWithColor(c, _bgColor.CGColor);
    CGContextFillPath(c);
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    self.backgroundColor = [UIColor whiteColor];
}
@end
