//
//  DataInfoManager.m
//  RealMDemo
//
//  Created by Simon Mr on 2018/2/7.
//  Copyright © 2018年 Simon Mr. All rights reserved.
//

#import "DataInfoManager.h"

@implementation DataInfoManager

+ (instancetype)manager {
    static DataInfoManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DataInfoManager alloc] init];
    });
    
    return manager;
}

- (UserInfoModel *)user {
#warning ID数据需要从网络取
    return [[UserInfoModel alloc] initWithUserId:@"5a7291277a8d3c5130ca1a4b"];
}

@end
