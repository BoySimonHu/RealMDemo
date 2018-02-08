//
//  DataInfoManager.h
//  RealMDemo
//
//  Created by Simon Mr on 2018/2/7.
//  Copyright © 2018年 Simon Mr. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserInfoModel.h"

@interface DataInfoManager : NSObject

@property (nonatomic, strong) UserInfoModel *user;

+ (instancetype)manager;

@end
