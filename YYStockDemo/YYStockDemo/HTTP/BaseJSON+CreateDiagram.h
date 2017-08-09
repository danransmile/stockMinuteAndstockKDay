//
//  BaseHTTP+CreateDiagram.h
//  YiGuScience
//
//  Created by admin on 2017/5/22.
//  Copyright © 2017年 刘艳芹. All rights reserved.
//

#import "BaseJSON.h"

@interface BaseJSON (CreateDiagram)
/* 快照 */
+(void)snapshotWithSymbol:(NSString *)symbol
                  Success:(onSuccess)success
                  failure:(onFailure)failure;
/* 日K */
+(void)KDayWithSymbol:(NSString *)symbol
              Success:(onSuccess)success
              failure:(onFailure)failure;
/* 周K */
+(void)KWeekWithSymbol:(NSString *)symbol
               Success:(onSuccess)success
               failure:(onFailure)failure;
/* 月K */
+(void)KMonthWithSymbol:(NSString *)symbol
                Success:(onSuccess)success
                failure:(onFailure)failure;


/* 分时 */
+(void)MinuteWithSymbol:(NSString *)symbol
                Success:(onSuccess)success
                failure:(onFailure)failure;

@end
