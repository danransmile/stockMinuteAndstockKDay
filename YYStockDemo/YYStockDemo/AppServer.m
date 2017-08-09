//
//  AppServer.m
//  YYStockDemo
//
//  Created by yate1996 on 16/10/17.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "AppServer.h"

@implementation AppServer
/**
 Get请求调用
 @param url     url
 @param params  请求参数
 @param success 成功回调
 @param fail    失败回调
 */
+ (void)Get:(NSString*) url params:(id)params success:(void (^)(NSDictionary *response))success fail:(void(^)(NSDictionary *info))fail {
    if ([url isEqualToString:@"minute"]) {
        success([NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"minuteData" ofType:@"plist"]]);
    }
    if ([url isEqualToString:@"day"]) {
        success([NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dayData" ofType:@"plist"]]);
    }
    if ([url isEqualToString:@"five"]) {
        success([NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fiveData" ofType:@"plist"]]);
    }
    if ([url isEqualToString:@"Property"]) {
        success([NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"]]);
    }
}
@end
