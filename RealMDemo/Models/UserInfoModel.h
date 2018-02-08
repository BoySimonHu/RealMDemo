//
//  UserInfoModel.h
//  RealMDemo
//
//  Created by Simon Mr on 2018/1/29.
//  Copyright © 2018年 Simon Mr. All rights reserved.
//

#import "RLMBaseModel.h"

@interface UserInfoModel : RLMBaseModel

@property NSString *_id;
@property NSString *name;
@property NSString *role;
@property NSString *type;

#pragma mark - 字段更新
@property (nonatomic, copy) void (^updateName)(NSString *name);

- (instancetype)initWithUserId:(NSString *)userID;

@end
