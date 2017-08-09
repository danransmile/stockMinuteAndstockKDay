//
//  BaseJSON.h
//  YiGuScience
//
//  Created by admin on 2017/4/20.
//  Copyright © 2017年 刘艳芹. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
typedef void (^onSuccess)(id jsonObj,NSInteger returnCode,NSArray *data);
typedef void (^onFailure)(NSInteger erroeCode, NSString *errorMessage);

@interface BaseJSON : AFURLSessionManager
+(BaseJSON *)sharInstance;
@property (copy, nonatomic) onSuccess success;
@property (copy, nonatomic) onFailure failure;
+(void)postPath:(NSString *)path
     parameters:(id)parameters
         isHint:(BOOL)isHint
        success:(onSuccess)success
        failure:(onFailure)failure;
+(void)getPath:(NSString *)path
     parameters:(id)parameters
         isHint:(BOOL)isHint
        success:(onSuccess)success
        failure:(onFailure)failure;
@end
