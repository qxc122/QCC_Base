//
//  UIButton+Add.m
//  portal
//
//  Created by Store on 2017/9/6.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "UIButton+Add.h"
#import "MACRO_COLOR.h"
#import "UIColor+Add.h"
@implementation UIButton (Add)
- (void)SetFilletWith:(CGFloat)Radius{
    [self.layer setCornerRadius:Radius*0.5];
    [self.layer setMasksToBounds:YES];
}

- (void)SetBordersWith:(CGFloat)Width Color:(UIColor *)color{
    [self.layer setBorderWidth:(Width)];
    [self.layer setBorderColor:[color CGColor]];
}

- (instancetype)initWithNormalColor:(unsigned long)Normalcolor NormalAlpha:(float)Normalalpha  NormalTitle:(NSString *)NormalTitle NormalImage:(NSString *)NormalImage NormalBackImage:(NSString *)NormalBackImage SelectedColor:(unsigned long)Selectedcolor SelectedAlpha:(float)Selectedalpha  SelectedTitle:(NSString *)SelectedTitle SelectedImage:(NSString *)SelectedImage SelectedBackImage:(NSString *)SelectedBackImage Font:(NSInteger)font NormalROrM:(NSString *)rOrm backColor:(unsigned long)backcolor backAlpha:(float)backalpha{
    self = [self init];
    if (self) {
        if (backalpha > 0.0) {
            self.backgroundColor = ColorWithHex(backcolor, backalpha);
        }
        if ([rOrm isEqualToString:@"r"] || [rOrm isEqualToString:@"R"]) {
            self.titleLabel.font = [UIFont systemFontOfSize:font];
        } else if ([rOrm isEqualToString:@"m"] || [rOrm isEqualToString:@"M"]) {
            self.titleLabel.font = [UIFont boldSystemFontOfSize:font];
        }
        
        if (NormalTitle && NormalTitle.length) {
            [self setTitle:NormalTitle forState:UIControlStateNormal];
        }
        if (NormalImage && NormalImage.length) {
            [self setImage:[UIImage imageNamed:NormalImage] forState:UIControlStateNormal];
        }
        if (NormalBackImage && NormalBackImage.length) {
            [self setBackgroundImage:[UIImage imageNamed:NormalBackImage] forState:UIControlStateNormal];
        }
        if (Normalalpha > 0.0) {
            [self setTitleColor:ColorWithHex(Normalcolor, Normalalpha) forState:UIControlStateNormal];
        }
        
        
        if (SelectedTitle && SelectedTitle.length) {
            [self setTitle:SelectedTitle forState:UIControlStateHighlighted];
            [self setTitle:SelectedTitle forState:UIControlStateSelected];
        }
        if (SelectedImage && SelectedImage.length) {
            [self setImage:[UIImage imageNamed:SelectedImage] forState:UIControlStateHighlighted];
            [self setImage:[UIImage imageNamed:SelectedImage] forState:UIControlStateSelected];
        }
        if (SelectedBackImage && SelectedBackImage.length) {
            [self setBackgroundImage:[UIImage imageNamed:SelectedBackImage] forState:UIControlStateHighlighted];
            [self setBackgroundImage:[UIImage imageNamed:SelectedBackImage] forState:UIControlStateSelected];
        }
        if (Selectedalpha > 0.0) {
            [self setTitleColor:ColorWithHex(Selectedcolor, Selectedalpha) forState:UIControlStateHighlighted];
            [self setTitleColor:ColorWithHex(Selectedcolor, Selectedalpha) forState:UIControlStateSelected];
        }
    }
    return self;
}

- (void)setWithNormalColor:(unsigned long)Normalcolor NormalAlpha:(float)Normalalpha  NormalTitle:(NSString *)NormalTitle NormalImage:(NSString *)NormalImage NormalBackImage:(NSString *)NormalBackImage SelectedColor:(unsigned long)Selectedcolor SelectedAlpha:(float)Selectedalpha  SelectedTitle:(NSString *)SelectedTitle SelectedImage:(NSString *)SelectedImage SelectedBackImage:(NSString *)SelectedBackImage Font:(NSInteger)font NormalROrM:(NSString *)rOrm backColor:(unsigned long)backcolor backAlpha:(float)backalpha{

    if (backalpha > 0.0) {
        self.backgroundColor = ColorWithHex(backcolor, backalpha);
    }
    if ([rOrm isEqualToString:@"r"] || [rOrm isEqualToString:@"R"]) {
        self.titleLabel.font = [UIFont systemFontOfSize:font];
    } else if ([rOrm isEqualToString:@"m"] || [rOrm isEqualToString:@"M"]) {
        self.titleLabel.font = [UIFont boldSystemFontOfSize:font];
    }
    
    if (NormalTitle && NormalTitle.length) {
        [self setTitle:NormalTitle forState:UIControlStateNormal];
    }
    if (NormalImage && NormalImage.length) {
        [self setImage:[UIImage imageNamed:NormalImage] forState:UIControlStateNormal];
    }
    if (NormalBackImage && NormalBackImage.length) {
        [self setBackgroundImage:[UIImage imageNamed:NormalBackImage] forState:UIControlStateNormal];
    }
    if (Normalalpha > 0.0) {
        [self setTitleColor:ColorWithHex(Normalcolor, Normalalpha) forState:UIControlStateNormal];
    }
    
    
    if (SelectedTitle && SelectedTitle.length) {
        [self setTitle:SelectedTitle forState:UIControlStateHighlighted];
        [self setTitle:SelectedTitle forState:UIControlStateSelected];
    }
    if (SelectedImage && SelectedImage.length) {
        [self setImage:[UIImage imageNamed:SelectedImage] forState:UIControlStateHighlighted];
        [self setImage:[UIImage imageNamed:SelectedImage] forState:UIControlStateSelected];
    }
    if (SelectedBackImage && SelectedBackImage.length) {
        [self setBackgroundImage:[UIImage imageNamed:SelectedBackImage] forState:UIControlStateHighlighted];
        [self setBackgroundImage:[UIImage imageNamed:SelectedBackImage] forState:UIControlStateSelected];
    }
    if (Selectedalpha > 0.0) {
        [self setTitleColor:ColorWithHex(Selectedcolor, Selectedalpha) forState:UIControlStateHighlighted];
        [self setTitleColor:ColorWithHex(Selectedcolor, Selectedalpha) forState:UIControlStateSelected];
    }
}

- (void)verticalImageAndTitle:(CGFloat)spacing {
//    self.titleLabel.backgroundColor = [UIColor greenColor];
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
    
}


@end
