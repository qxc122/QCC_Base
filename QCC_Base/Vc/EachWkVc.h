//
//  EachWkVc.h
//  portal
//
//  Created by Store on 2017/8/31.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "baseWkVc.h"

@interface EachWkVc : baseWkVc
@property (nonatomic,strong) NSString *merchName;
@property (nonatomic,strong) NSString *merchId;

@property (nonatomic,assign) BOOL IsHaveRightBtn; //默认没有

- (void)Execute_the_JS_statementWith:(NSString *)str;
@end


@interface WeakScriptMessageDelegate : NSObject<WKScriptMessageHandler>

@property (nonatomic, weak) id<WKScriptMessageHandler> scriptDelegate;

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate;
@end
