//
//  HeaderAll.h
//  portal
//
//  Created by Store on 2017/8/30.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#ifndef HeaderAll_h
#define HeaderAll_h
#import "NSDictionary+Add.h"
#import "MJRefresh.h"
#import "UIView+Add.h"
#import "UITextField+Add.h"
#import "UIImageView+Add.h"
#import "UIButton+Add.h"
#import "UIColor+Add.h"
#import "UIImage+Add.h"
#import "NSString+Add.h"
#import "MBProgressHUD+MJ.h"
#import "MACRO_COLOR.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "Masonry.h"
#import "MACRO_PIC.h"
#import "MACRO_PORTAL.h"
#import "MACRO_UI.h"
#import "MACRO_ENUM.h"
#import "AFNetworkReachabilityManager.h"

//#import "basicUiTableView.h"
//#import "baseWkVc.h"
//#import "EachWkVc.h"

#import "NSString+Add.h"
#import "UIScrollView+EmptyDataSet.h"

//////////////////通知//////////////////
#define LOGIN_EXIT_NOTIFICATION  @"LOGIN_EXIT_NOTIFICATION"
#define GET_NEW_TOKEN_NOTIFICATION  @"GET_NEW_TOKEN_NOTIFICATION"
//////////////////通知//////////////////

#define kWeakSelf(type)  __weak typeof(type) weak##type = type;

#define TOURPAGESIZE 10
#define FIRSTPAGE    1

#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define PROPORTION_HEIGHT  SCREENHEIGHT/667.0
#define PROPORTION_WIDTH   SCREENWIDTH/375.0

//////////////////字体//////////////////
#define FONTNAME @"PingFangSC-Regular"
#define FONTNAMEMedium @"PingFangSC-Medium"
#define PingFangSC_Regular(F) [UIFont systemFontOfSize:F]
#define PingFangSC_Medium(F) [UIFont boldSystemFontOfSize:F]
//////////////////字体//////////////////


#define IPoneX (SCREENHEIGHT == 812)

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

#endif /* HeaderAll_h */
