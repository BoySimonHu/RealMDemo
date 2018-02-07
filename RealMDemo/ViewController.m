//
//  ViewController.m
//  RealMDemo
//
//  Created by Simon Mr on 2017/12/19.
//  Copyright © 2017年 Simon Mr. All rights reserved.
//

#import "ViewController.h"

#import "UserInfoModel.h"
#import "DataBaseManager.h"

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
    
    // object operate
    UserInfoModel *user = [[UserInfoModel alloc] initWithID:@"5a7291277a8d3c5130ca1a4b"];;
    
    NSLog(@"--- role:%@ ---", user.role);
    
    [UserInfoModel updateData:^{
       user.name = @"洋葱";
    }];
    
    //  db.user.name 类似封装manager，不暴露具体model
    //
    
    
}

@end
