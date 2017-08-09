//
//  ViewController.m
//  BTC-Kline
//
//  Created by yate1996 on 16/4/27.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "ViewController.h"
#import "Y_KLineGroupModel.h"
#import "NetWorking.h"
#import "Y_StockChartViewController.h"
#import "Masonry.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];


}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    
}
- (IBAction)present:(id)sender {
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    appdelegate.isEable = YES;
    Y_StockChartViewController *stockChartVC = [Y_StockChartViewController new];
    stockChartVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:stockChartVC animated:YES completion:nil];
}
- (BOOL)shouldAutorotate
{
    return NO;
}
@end
