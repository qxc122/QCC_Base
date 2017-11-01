//
//  MACRO_PORTAL.h
//  portal
//
//  Created by Store on 2017/8/30.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#ifndef MACRO_PORTAL_h
#define MACRO_PORTAL_h

#define  PORTALCHANNEL   @"T"
#define  PORTALACCESSSOURCE  @"2"
#define  PORTALVERSION  @"1.0"

#define AppIdAppStore  @"1061514008"   //appStore 上的appid

// app版本
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// app build版本
#define APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
// 手机系统的版本
#define PHONEVERSION [[UIDevice currentDevice] systemVersion]

#define TIMESTAMP [NSString stringWithFormat:@"%ld", (long)[NSDate date].timeIntervalSince1970]

#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define PATH_APPCOMMONGLOBAL   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"PATH_appcommonglobal.data"]
#define PATH_HOMEDATA   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"PATH_HOMEDATA.data"]
#define PATH_APPIDANDSECRET   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"PATH_appid.data"]
#define PATH_TOKEN   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"PATH_Token.data"]
#define PATH_USERINFO   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"PATH_userForApp.data"]

#define PATH_SET_UP   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"PATH_PATH_SET_UP.data"]
#define PATH_BANK_PATH   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"PATH_BANK_PATH.data"]
#define PATH_deviceToken   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"PATH_deviceToken_PATH.data"]
#define PATH_timePre   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"PATH_timePre.data"]

#define  PAYMENT_STATUS_NOTE   @"Paymentstatusnote" //支付状态
#define  PAYMENT_STATUS_NOTESTR   @"Paymentstatusnotestr" //支付状态的文字说明
#define  PAYMENT_STATUS_NOTE_RAW_DATA   @"PAYMENT_STATUS_NOTE_RAW_DATA" //支付的原始数据

//#define  KEY_SELFFLAG    @"selfFlag"
#define  KEY_NAME   @"name"
#define  KEY_MOBILE   @"mobile"
#define  KEY_EMAIL   @"email"

#define  KEY_AREA   @"area"
#define  KEY_CITY   @"city"
#define  KEY_RECEIVERNAME   @"receiverName"
#define  KEY_DETAILADDRESS   @"detailAddress"
#define  KEY_PROVINCE  @"province"
#define  KEY_POSTCODE   @"postCode"

#define  KEY_ENNAME   @"enName"
#define  KEY_SUNAME   @"suname"
#define  KEY_BIRTHDAY   @"birthday"
#define  KEY_SEX   @"sex"
#define  KEY_CERNO  @"certNo"
#define  KEY_NATIONALITY   @"nationality"
#define  KEY_CERtTYPE  @"certType"
#define  KEY_EXPIREDATE   @"expireDate"

#define  KEY_COUNTRYCODE  @"countryCode"
#define  KEY_COUNTRYNAME   @"countryName"

#define  SCHEML  @"TempusPortal"

#define  MANY_SECONDS   1.5

#ifdef DEBUG
#define  PORTALAPPID   @"https://itunes.apple.com/cn/app/id1061514008"
#else
#define  PORTALAPPID   @"https://itunes.apple.com/cn/app/id1061514008"
#endif

#define  PAYSUCCESSFUL   @"支付成功"
#define  PAYCANCELLED   @"用户取消"
#define  PAYFAILURE   @"支付失败"



#endif /* MACRO_PORTAL_h */
