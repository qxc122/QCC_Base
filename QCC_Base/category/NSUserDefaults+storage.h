//
//  NSUserDefaults+storage.h
//  TourismT
//
//  Created by Store on 16/11/28.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (storage)
+ (void)setObject:(id)data withKey:(NSString *)key;
+ (id)getObjectWithKey:(NSString *)key;
@end
