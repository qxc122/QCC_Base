//
//  MACRO_ENUM.h
//  Tourism
//
//  Created by Store on 16/11/8.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#ifndef MACRO_ENUM_h
#define MACRO_ENUM_h

typedef NS_ENUM(NSInteger, PAYMENT_STATUS)
{
//    FAIL_PAYMENT_STATUS = -1,//支付失败
//    SUCCESS_PAYMENT_STATUS=1,//支付成功
//    CANCEL_PAYMENT_STATUS=0,//用户取消
    
    FAIL_PAYMENT_STATUS = -1,//支付失败
    SUCCESS_PAYMENT_STATUS =0,//支付成功
    CANCEL_PAYMENT_STATUS=100,//用户取消
};

//网络请求状态
typedef NS_ENUM(NSInteger, RespondCode)
{
    kRespondCodeNotJson             = -200,
    KRespondCodeNone                = -100,
    KRespondCodeFail                = -1, /** 失败 */
    kRespondCodeSuccess            = 0,/** 成功 */
    kRespondCodeExoipDateAccessToken = 100001,   /** Token无效 */
    kRespondCodeuserdoesnotexist = 3,   /** 用户未登录 */
    kRespondCodePasswordinputmultipleerrors = 38,   /** 错误码000038表示密码输入多次错误 */
    kRespondCodePassworderror = 1026,   /** 错误码001026表示密码错误 */
    
    KRespondCodeNotConnect         = -12315,    //网络无连接
    KRespondCodeVerificationcodeerror         = 1017,    //验证码错误
};



#endif /* MACRO_ENUM_h */
