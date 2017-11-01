//
//  NSString+Add.m
//  portal
//
//  Created by Store on 2017/8/30.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "NSString+Add.h"


@implementation NSString (Add)
#pragma 正则匹配手机号
- (BOOL)IsTelNumber{
    NSString *pattern =@"^1+[3578]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
#pragma 正则匹配身份证
- (BOOL)IsIdCardNumber{
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X|x)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
#pragma mark - 计算内容文本的高度方法
- (CGFloat)HeightWithFont:(UIFont *)font withMaxWidth:(CGFloat)MaxWidth{
    // 获取文字字典
    NSDictionary *dict = @{NSFontAttributeName: font};
    // 设定最大宽高
    CGSize size = CGSizeMake(MaxWidth, CGFLOAT_MAX);
    // 计算文字Frame
    CGRect frame = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return frame.size.height;
}
#pragma mark - 计算内容文本的宽度方法
- (CGFloat)WidthWithFont:(UIFont *)font withMaxHeight:(CGFloat)MaxHeight{
    // 获取文字字典
    NSDictionary *dict = @{NSFontAttributeName: font};
    // 设定最大宽高
    CGSize size = CGSizeMake(CGFLOAT_MAX, MaxHeight);
    // 计算文字Frame
    CGRect frame = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return frame.size.width;
}
#pragma --mark<返回一个富文本可变字符串  字体  颜色 行间距 换行模式>
- (NSMutableAttributedString *)CreatMutableAttributedStringWithFont:(UIFont *)font Color:(UIColor *)color LineSpacing:(CGFloat )lineSpacing Alignment:(NSTextAlignment )alignment BreakMode:(NSLineBreakMode)breakMode  firstLineHeadIndent:(CGFloat )firstLineHeadIndent  headIndent:(CGFloat )headIndent  paragraphSpacing:(CGFloat )paragraphSpacing WordSpace:(CGFloat)WordSpace{
    if (self && self.length) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:lineSpacing];//调整行间距
        [paragraphStyle setAlignment:alignment];
        [paragraphStyle setLineBreakMode:breakMode];
        
        NSDictionary *dic = @{NSFontAttributeName: font,
                              NSForegroundColorAttributeName: color,
                              NSParagraphStyleAttributeName: paragraphStyle,
                              NSKernAttributeName:@(WordSpace)};
        return [[NSMutableAttributedString alloc] initWithString:self attributes:dic];
    }
    return [[NSMutableAttributedString alloc] initWithString:@""];
}

- (NSDictionary *)dictionaryWithJsonString
{
    if (self == nil) {
        return nil;
    }
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

- (BOOL) deptNumInputShouldNumber {
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}

- (BOOL)isChinese { NSString *match = @"(^[\u4e00-\u9fa5]+$)"; NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match]; return [predicate evaluateWithObject:self]; }

- (BOOL)includeChinese { for(int i=0; i< [self length];i++) { int a =[self characterAtIndex:i]; if( a >0x4e00&& a <0x9fff){ return YES; } } return NO; }

- (BOOL) deptPassInputShouldAlpha
{
    
    NSString *regex =@"[a-zA-Z]*";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    if (![pred evaluateWithObject:self]) {
        
        return YES;
        
    }
    
    return NO;
    
}


/*邮箱验证
 MODIFIED BY HELENSONG*/
-(BOOL)isValidateEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL) validateZipCode{
    NSString *regex = @"[0-9]\\d{5}(?!\\d)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

-(NSString *)birthdayStrFromIdentityCard{  //根据身份证号获取生日
    NSMutableString *result = [NSMutableString stringWithCapacity:0];
    NSString *year = nil;
    NSString *month = nil;
    
    BOOL isAllNumber = YES;
    NSString *day = nil;
    if([self length]<14)
    return result;
    
    //**截取前14位
    NSString *fontNumer = [self substringWithRange:NSMakeRange(0, 13)];
    
    //**检测前14位否全都是数字;
    const char *str = [fontNumer UTF8String];
    const char *p = str;
    while (*p!='\0') {
        if(!(*p>='0'&&*p<='9'))
        isAllNumber = NO;
        p++;
    }
    if(!isAllNumber)
    return result;
    
    year = [self substringWithRange:NSMakeRange(6, 4)];
    month = [self substringWithRange:NSMakeRange(10, 2)];
    day = [self substringWithRange:NSMakeRange(12,2)];
    
    [result appendString:year];
    [result appendString:@"-"];
    [result appendString:month];
    [result appendString:@"-"];
    [result appendString:day];
    return result;
}

-(NSString *)getIdentityCardSex//根据身份证号性别
{
    int sexInt=[[self substringWithRange:NSMakeRange(16,1)] intValue];
    
    if(sexInt%2!=0)
    {
        return @"女";
    }
    else
    {
        return @"男";
    }
}

-(NSString *)filterCharactorwithRegex:(NSString* )regexStr{
    NSString *searchText = self;
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:&error];
    NSString *result = [regex stringByReplacingMatchesInString:searchText options:NSMatchingReportCompletion range:NSMakeRange(0, searchText.length) withTemplate:@""];
    return result;
}

#define NUMBERS @"0123456789."
- (BOOL)ThejudgmentisaletterXx{
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
    NSString *filtered = [[self componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    return [self isEqualToString:filtered];
}

-(NSString *)formatterBankCardNum{
    NSString *tempStr=self;
    NSInteger size =(tempStr.length / 4);
    NSMutableArray *tmpStrArr = [[NSMutableArray alloc] init];
    for (int n = 0;n < size; n++)
    {
        [tmpStrArr addObject:[tempStr substringWithRange:NSMakeRange(n*4, 4)]];
    }
    [tmpStrArr addObject:[tempStr substringWithRange:NSMakeRange(size*4, (tempStr.length % 4))]];
    tempStr = [tmpStrArr componentsJoinedByString:@" "];
    return tempStr;
}

-(NSString *)formatterBankCardNumTwo{
    return [NSString stringWithFormat:@"****  ****  ****  %@",self];
}

@end
