//
//  UIButton+Add.h
//  portal
//
//  Created by Store on 2017/9/6.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Add)
- (void)SetFilletWith:(CGFloat)Radius;
- (void)SetBordersWith:(CGFloat)Width Color:(UIColor *)color;


- (instancetype)initWithNormalColor:(unsigned long)Normalcolor NormalAlpha:(float)Normalalpha  NormalTitle:(NSString *)NormalTitle NormalImage:(NSString *)NormalImage NormalBackImage:(NSString *)NormalBackImage SelectedColor:(unsigned long)Selectedcolor SelectedAlpha:(float)Selectedalpha  SelectedTitle:(NSString *)SelectedTitle SelectedImage:(NSString *)SelectedImage SelectedBackImage:(NSString *)SelectedBackImage Font:(NSInteger)font NormalROrM:(NSString *)rOrm backColor:(unsigned long)backcolor backAlpha:(float)backalpha;

- (void)setWithNormalColor:(unsigned long)Normalcolor NormalAlpha:(float)Normalalpha  NormalTitle:(NSString *)NormalTitle NormalImage:(NSString *)NormalImage NormalBackImage:(NSString *)NormalBackImage SelectedColor:(unsigned long)Selectedcolor SelectedAlpha:(float)Selectedalpha  SelectedTitle:(NSString *)SelectedTitle SelectedImage:(NSString *)SelectedImage SelectedBackImage:(NSString *)SelectedBackImage Font:(NSInteger)font NormalROrM:(NSString *)rOrm backColor:(unsigned long)backcolor backAlpha:(float)backalpha;

- (void)verticalImageAndTitle:(CGFloat)spacing;

@end
