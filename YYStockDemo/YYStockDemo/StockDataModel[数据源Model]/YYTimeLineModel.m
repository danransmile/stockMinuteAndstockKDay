//
//  YYTimeLineModel.m
//  投融宝
//
//  Created by yate1996 on 16/10/10.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "YYTimeLineModel.h"
#import <CoreGraphics/CoreGraphics.h>
@implementation YYTimeLineModel
{
    NSDictionary * _dict;
    NSString *Price;
    NSString *Volume;
}




-(NSString *)transformTimeStamp:(NSString *)time{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"HH:mm:ss"];
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[time doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
    
    //    double unixTimeStamp = [time doubleValue];
    //    NSTimeInterval _interval=unixTimeStamp;
    //    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    //    NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
    //    [_formatter setLocale:[NSLocale currentLocale]];
    //    [_formatter setDateFormat:@"yyyy-MM-dd"];
    //    NSString *_date=[_formatter stringFromDate:date];
}



- (NSString *)TimeDesc {
     NSString *timeStr = [_dict[@"time"] stringValue];
    return [self transformTimeStamp:timeStr];
}

- (NSString *)DayDatail {
    NSString *timeStr = [_dict[@"time"] stringValue];
    return [self transformTimeStamp:timeStr];
}

//前一天的收盘价
- (CGFloat )AvgPrice {
    return [_dict[@"last_close"] floatValue];
}

- (NSNumber *)Price {
    return _dict[@"current"];
}

- (CGFloat)Volume {
    return [_dict[@"volume"] floatValue];
}

- (BOOL)isShowTimeDesc {
    return YES;
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        _dict = dict;
        Price = _dict[@"current"];
        Volume = _dict[@"volume"];
    }
    return self;
}

@end
