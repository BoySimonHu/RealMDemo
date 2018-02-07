//
//  UserInfoModel.m
//  RealMDemo
//
//  Created by Simon Mr on 2018/1/29.
//  Copyright © 2018年 Simon Mr. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel

- (instancetype)initWithID:(NSString *)userID {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self = [[UserInfoModel objectsWhere:@"_id == '5a7291277a8d3c5130ca1a4b'"] firstObject];
    
    return self;
}

@end
