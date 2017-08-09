//
//  BaseHTTP+CreateDiagram.m
//  YiGuScience
//
//  Created by admin on 2017/5/22.
//  Copyright © 2017年 刘艳芹. All rights reserved.
//

#import "BaseJSON+CreateDiagram.h"

@implementation BaseJSON (CreateDiagram)
/* 快照 */
+(void)snapshotWithSymbol:(NSString *)symbol
                  Success:(onSuccess)success
                  failure:(onFailure)failure{
    
    
    NSString *str = [NSString stringWithFormat:@"\"%@\"",symbol];

    
    
    [BaseJSON postPath:export_snap parameters:str isHint:NO success:^(id jsonObj, NSInteger returnCode, NSArray *data) {
        
    } failure:^(NSInteger erroeCode, NSString *errorMessage) {
        
    }];
    
    
    
}
/** 分时 */
+(void)MinuteWithSymbol:(NSString *)symbol
              Success:(onSuccess)success
                failure:(onFailure)failure{
    NSString *str = [NSString stringWithFormat:@"\"%@\"",symbol];
    
    
    [BaseJSON postPath:export_min parameters:str isHint:NO success:^(id jsonObj, NSInteger returnCode, NSArray *data) {
        if (success) {
            success(jsonObj,returnCode,data);
        }
    } failure:^(NSInteger erroeCode, NSString *errorMessage) {
        if (failure) {
            failure(erroeCode,errorMessage);
        }
    }];
    
}



/* 日K */
+(void)KDayWithSymbol:(NSString *)symbol
              Success:(onSuccess)success
              failure:(onFailure)failure{
    NSString *str = [NSString stringWithFormat:@"\"%@\"",symbol];
    NSLog(@"%@",export_day);
    
    [BaseJSON postPath:export_day parameters:str isHint:NO success:^(id jsonObj, NSInteger returnCode, NSArray *data) {
        if (success) {
            success(jsonObj,returnCode,data);
        }
    } failure:^(NSInteger erroeCode, NSString *errorMessage) {
        if (failure) {
            failure(erroeCode,errorMessage);
        }
    }];
}
/* 周K */
+(void)KWeekWithSymbol:(NSString *)symbol
               Success:(onSuccess)success
               failure:(onFailure)failure{
    NSString *str = [NSString stringWithFormat:@"\"%@\"",symbol];
    
    
    [BaseJSON postPath:export_week parameters:str isHint:NO success:^(id jsonObj, NSInteger returnCode, NSArray *data) {
        if (success) {
            success(jsonObj,returnCode,data);
        }
    } failure:^(NSInteger erroeCode, NSString *errorMessage) {
        if (failure) {
            failure(erroeCode,errorMessage);
        }
    }];
    
    
}
/* 月K */
+(void)KMonthWithSymbol:(NSString *)symbol
                Success:(onSuccess)success
                failure:(onFailure)failure{
    NSString *str = [NSString stringWithFormat:@"\"%@\"",symbol];

    
    
    
    [BaseJSON postPath:export_month parameters:str isHint:NO success:^(id jsonObj, NSInteger returnCode, NSArray *data) {
        if (success) {
            success(jsonObj,returnCode,data);
        }
    } failure:^(NSInteger erroeCode, NSString *errorMessage) {
        if (failure) {
            failure(erroeCode,errorMessage);
        }
    }];
    
    
}


@end
