//
//  NSDictionary+toData.m
//  TourismT
//
//  Created by Store on 2017/2/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "NSDictionary+toData.h"  

@implementation NSDictionary (toData)
+(NSData *)returnDataWithDictionary:(NSDictionary*)dict

{
    
    NSMutableData *data = [[NSMutableData alloc]init];
    
    NSKeyedArchiver* archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    [archiver encodeObject:dict forKey:@"talkData"];
    
    [archiver finishEncoding];
    
    return data;
    
}

//NSData 转字典:

// NSData转dictonary

+(NSDictionary*)returnDictionaryWithDataPath:(NSData*)data

{
    
    //  NSData* data = [[NSMutableData alloc]initWithContentsOfFile:path]; 拿路径文件
    
    NSKeyedUnarchiver* unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    
    NSDictionary* myDictionary = [unarchiver decodeObjectForKey:@"talkData"];
    
    [unarchiver finishDecoding];
    
    return myDictionary;
    
}

- (NSString*)dictionaryToJsonStr{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
@end
