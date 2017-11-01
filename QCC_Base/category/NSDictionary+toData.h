//
//  NSDictionary+toData.h
//  TourismT
//
//  Created by Store on 2017/2/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (toData)

+(NSData *)returnDataWithDictionary:(NSDictionary*)dict;

//NSData 转字典:

// NSData转dictonary

+(NSDictionary*)returnDictionaryWithDataPath:(NSData*)data;

- (NSString*)dictionaryToJsonStr;
@end
