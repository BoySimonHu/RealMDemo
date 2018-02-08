//
//  ViewController.m
//  RealMDemo
//
//  Created by Simon Mr on 2017/12/19.
//  Copyright © 2017年 Simon Mr. All rights reserved.
//

#import "ViewController.h"

#import "DataInfoManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dic =@{
                         @"_id":@"5a7291277a8d3c5130ca1a4b",
                         @"name":@"1517457703928_@@_18510282990",
                         @"role":@"teacher",
                         @"type":@"signup"
                         };
    
    // Sync
    
    [UserInfoModel saveDataWithJson:dic];
    
    NSLog(@"--- role:%@ ---", [DataInfoManager manager].user.role);
    
    [DataInfoManager manager].user.updateName(@"洋葱数学");
}

@end
