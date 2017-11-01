//
//  NSDictionary+Add.h
//  portal
//
//  Created by Store on 2017/8/30.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Add)
#pragma 字段转换成json字符串
- (NSString*)DicToJsonstr;
#pragma 字段转换成json字符串
- (NSString*)dictionaryToJsonForH5;
@end
