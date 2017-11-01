//
//  NSString+Add.h
//  portal
//
//  Created by Store on 2017/8/30.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Add)
#pragma 正则匹配手机号
- (BOOL)IsTelNumber;
#pragma 正则匹配身份证
- (BOOL)IsIdCardNumber;
#pragma mark - 计算内容文本的高度方法
- (CGFloat)HeightWithFont:(UIFont *)font withMaxWidth:(CGFloat)MaxWidth;
#pragma mark - 计算内容文本的宽度方法
- (CGFloat)WidthWithFont:(UIFont *)font withMaxHeight:(CGFloat)MaxHeight;;
#pragma --mark<返回一个富文本可变字符串  字体  颜色 行间距 换行模式>
- (NSMutableAttributedString *)CreatMutableAttributedStringWithFont:(UIFont *)font Color:(UIColor *)color LineSpacing:(CGFloat )lineSpacing Alignment:(NSTextAlignment )alignment BreakMode:(NSLineBreakMode)breakMode  firstLineHeadIndent:(CGFloat )firstLineHeadIndent  headIndent:(CGFloat )headIndent  paragraphSpacing:(CGFloat )paragraphSpacing WordSpace:(CGFloat)WordSpace;

- (NSDictionary *)dictionaryWithJsonString;

- (BOOL) deptNumInputShouldNumber;

- (BOOL)isChinese;//判断是否是纯汉字

- (BOOL)includeChinese;//判断是否含有汉字

- (BOOL) deptPassInputShouldAlpha;//判断全是字母  NO  表示是字母

-(BOOL)isValidateEmail; /*邮箱验证  MODIFIED BY HELENSONG*/

- (BOOL) validateZipCode;

-(NSString *)birthdayStrFromIdentityCard;  //根据身份证号获取生日

-(NSString *)getIdentityCardSex;//根据身份证号性别

-(NSString *)filterCharactorwithRegex:(NSString* )regexStr; //过滤文字

- (BOOL)ThejudgmentisaletterXx;

-(NSString *)formatterBankCardNum;

-(NSString *)formatterBankCardNumTwo;
@end
