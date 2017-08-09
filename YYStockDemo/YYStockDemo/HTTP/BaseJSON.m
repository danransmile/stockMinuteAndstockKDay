//
//  BaseJSON.m
//  YiGuScience
//
//  Created by admin on 2017/4/20.
//  Copyright © 2017年 刘艳芹. All rights reserved.
//

#import "BaseJSON.h"
#define ERRORTIMEOUT @"我去，服务器超时了！"

static BaseJSON *json = nil;
//最多执行总数
static const NSInteger tryAgainCount = 10;


@interface BaseJSON()

//是否需要提醒
@property (assign, nonatomic) BOOL isHint;
//当前执行次数
@property (assign, nonatomic) NSInteger tryAgainIndex;
@end

@implementation BaseJSON

+(BaseJSON *)sharInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        json = [[BaseJSON alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    });
    
    
    return json;
}

+(void)getPath:(NSString *)path parameters:(id)parameters isHint:(BOOL)isHint success:(onSuccess)success failure:(onFailure)failure{
    [[self sharInstance]executiveRequestWithMethod:@"GET" Path:path parameters:parameters isHint:isHint success:success failure:failure];
    
}

+(void)postPath:(NSString *)path parameters:(id)parameters isHint:(BOOL)isHint success:(onSuccess)success failure:(onFailure)failure{
    [[self sharInstance]executiveRequestWithMethod:@"POST" Path:path parameters:parameters isHint:isHint success:success failure:failure];
}
-(void)executiveRequestWithMethod:(NSString *)method Path:(NSString *)path parameters:(id)parameters isHint:(BOOL)isHint success:(onSuccess)success failure:(onFailure)failure{
    
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:method URLString:path parameters:nil error:nil];
    request.timeoutInterval = 300;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"Keep-alive" forHTTPHeaderField:@"Connection"];
    /* setShouldAttemptPersistentConnection:YES */
    [request setHTTPShouldHandleCookies:YES];
//    [request setShouldAttemptPersistentConnection:YES];
//    request.shouldGroupAccessibilityChildren = YES;
    request.HTTPShouldUsePipelining = YES;
//    NSLog(@"%@",request.allHTTPHeaderFields);
    NSData *data = [parameters dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    [request setHTTPBody:data];
    [[self dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSString *errors = [error.userInfo objectForKey:@"NSLocalizedDescription"];
            if (error.code == -1001) {
                
                [self notifyErrorCode:2 errorMessage:@"网络出错"];
                return ;
            }else{
                [self notifyErrorCode:2 errorMessage:errors];
                return;
            }
        }else{
            [self responsed:responseObject success:success failure:failure];
        }
    }]resume];
    
}

/**
 *  提取出data字段部分,返回给各自具体的实现方法.
 returnCodes:0:成功 1:警告 2：失败 3：过期
 如果是3说明本地时间戳过期 再次请求时间戳更新本地
 *
 */
- (void)responsed:(id)responseObject success:(onSuccess)success failure:(onFailure)failure{
    self.failure = failure;
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    if (responseObject == nil){
        /* 1.判断是不是有效的JSON串 */
        [self notifyErrorCode:-1 errorMessage:@"11"];
        return;
    }
    /* 2.获取网络上的状态，并给状态代码赋值 */
    /* 状态代码 */
    NSUInteger returnCode = 0;
    NSArray *data = [responseObject valueForKey:@"data"];
    NSString *returnStatus = [responseObject valueForKey:@"status"];
    NSString *msg = [responseObject valueForKey:@"msg"];
    NSString *result;
    if ([returnStatus isEqualToString:@"C_200"]) {
        returnCode = 0;
    }else if([returnStatus isEqualToString:@"W_300"]){
        returnCode = 1;
    }else if([responseObject valueForKey:@"E_500"]){
        returnCode = 2;
    }
    /* 3.根据状态代码执行不同的代理方法 */
    if(responseObject && [responseObject isKindOfClass:[NSDictionary class]]){
        if (returnCode == 0){
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:0 error:nil];
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
            NSDictionary *dic = responseObject;
            if (success){
                success(jsonDict,returnCode,data);
            }
        }else if(returnCode == 1 || returnCode == 2){
            if(stringIsEmpty(msg)){
                msg = @"11";
            }
            if (failure){
                failure(returnCode, msg);
            }
        }
    }
}


/* 提示错误信息 */
- (void)notifyErrorCode:(NSInteger)code errorMessage:(NSString *)errorMessage{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    //显示提示
    if (errorMessage == nil || [errorMessage isKindOfClass:[NSNull class]] || errorMessage.length == 0){
        errorMessage = @"11";
    }
    if (self.isHint){
        [self showHintView:errorMessage];
    }
    
    // 回调错误
    if (self.failure){
        dispatch_async(dispatch_get_main_queue(), ^{
            self. failure(code,errorMessage);
        });
    }
}
/* 显示提示信息 */
- (void)showHintView:(NSString *)message {
//    [[[UIApplication sharedApplication] delegate].window showDownMessage:message withDelay:1.0];
}

@end
