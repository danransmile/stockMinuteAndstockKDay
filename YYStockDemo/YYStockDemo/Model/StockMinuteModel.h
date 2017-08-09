//
//  SingleStockMinuteModel.h
//  YiGuScience
//
//  Created by admin on 2017/5/17.
//  Copyright © 2017年 刘艳芹. All rights reserved.
//

@class StockMinuteDataModel;
@interface StockMinuteModel : JSONModel
@property (nonatomic, strong)NSArray<StockMinuteDataModel *> *data;
@property (nonatomic , copy) NSString * status;
@end


@interface StockMinuteDataModel : JSONModel
/* 现价 */
@property (nonatomic , assign) NSUInteger current;
/* 成交量 */
@property (nonatomic , assign) NSUInteger volume;
/* 幅 */
@property (nonatomic , assign) NSUInteger percent;
/* 时间 */
@property (nonatomic , assign) NSUInteger time;
@property (nonatomic,copy) NSString *last_close;

@property (nonatomic,copy) NSString *change;


@end
