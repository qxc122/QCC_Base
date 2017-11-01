//
//  MACRO_COLOR.h
//  portal
//
//  Created by Store on 2017/8/31.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#ifndef MACRO_COLOR_h
#define MACRO_COLOR_h

#define RGBColor(R,G,B)  [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:1.0f]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
///随机颜色
#define RandomColor RGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)
#define ColorWithHex(rgbValue,a) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:(a)]


#define GENERAL_GREY_COLOR ColorWithHex(0x979797, 0.2) //一般灰色
#define VIEW_BACKGROUND_COLOR ColorWithHex(0xF2F2F2, 1.0) //背景颜色



#endif /* MACRO_COLOR_h */
