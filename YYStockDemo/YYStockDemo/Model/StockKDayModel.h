//
//  DayModel.h
//  YYStockDemo
//
//  Created by admin on 2017/4/15.
//  Copyright © 2017年 yate1996. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@class StockKDayDataModel;
@interface StockKDayModel : BaseJSON
@property (nonatomic, strong)NSArray<StockKDayDataModel *> *data;
@property (nonatomic, strong)NSString *status;
@end

@interface StockKDayDataModel : JSONModel
@property (nonatomic, assign)NSUInteger close;
@property (nonatomic, assign)NSUInteger current;
@property (nonatomic, assign)NSUInteger high;
@property (nonatomic, assign)NSUInteger low;
@property (nonatomic, assign)NSUInteger open;
@property (nonatomic, assign)NSUInteger percent;
@property (nonatomic, assign)NSUInteger time;
@property (nonatomic, assign)NSUInteger turnrate;
@property (nonatomic, assign)NSUInteger volume;
@property (nonatomic, assign)NSUInteger volumemoney;
//@property (nonatomic,assign)NSUInteger last_close;

@end
