//
//  YYFiveRecordView.h
//  YYStock  ( https://github.com/yate1996 )
//
//  Created by yate1996 on 16/10/10.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYStockFiveRecordProtocol.h"
@interface YYFiveRecordView : UITableView <UITableViewDataSource>
@property (nonatomic, strong) id<YYStockFiveRecordProtocol> fiveRecordModel;
- (void)reDrawWithFiveRecordModel:(id<YYStockFiveRecordProtocol>)fiveRecordModel;
@end
