//
//  NSUserDefaults+storage.m
//  TourismT
//
//  Created by Store on 16/11/28.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "NSUserDefaults+storage.h"

@implementation NSUserDefaults (storage)
+ (void)setObject:(id)data withKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:data forKey:key];
    [defaults synchronize];
}
+ (id)getObjectWithKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id data = [defaults objectForKey:key];
    return data;
}
@end
