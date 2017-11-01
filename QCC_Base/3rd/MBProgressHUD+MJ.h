//
//  MBProgressHUD+MJ.h
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (MJ)
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showPrompt:(NSString *)prompt toView:(UIView *)view;
+ (void)showPrompt:(NSString *)prompt  DetailedPrompt:(NSString *)DetailedPrompt toView:(UIView *)view;



+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (void)showPrompt:(NSString *)prompt;
+ (void)showPrompt:(NSString *)prompt  DetailedPrompt:(NSString *)DetailedPrompt;


+ (void)showSuccess:(NSString *)success toView:(UIView *)view afterDelay:(CGFloat)second;
+ (void)showError:(NSString *)error toView:(UIView *)view  afterDelay:(CGFloat)second;
+ (void)showPrompt:(NSString *)prompt toView:(UIView *)view afterDelay:(CGFloat)second;
+ (void)showPrompt:(NSString *)prompt  DetailedPrompt:(NSString *)DetailedPrompt toView:(UIView *)view  afterDelay:(CGFloat)second;


+ (void)showSuccess:(NSString *)success  afterDelay:(CGFloat)second;
+ (void)showError:(NSString *)error afterDelay:(CGFloat)second;
+ (void)showPrompt:(NSString *)prompt afterDelay:(CGFloat)second;
+ (void)showPrompt:(NSString *)prompt  DetailedPrompt:(NSString *)DetailedPrompt afterDelay:(CGFloat)second;


+ (void)showLoadingMessage:(NSString *)message;
+ (void)showLoadingMessage:(NSString *)message toView:(UIView *)view;
+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;
@end
