//
//  UserInfoModel.m
//  RealMDemo
//
//  Created by Simon Mr on 2018/1/29.
//  Copyright © 2018年 Simon Mr. All rights reserved.
//

#import "UserInfoModel.h"

#import "DataInfoManager.h"

@implementation UserInfoModel

+(NSArray<NSString *> *)ignoredProperties {
    return @[@"updateName"];
}

+ (NSString *)primaryKey {
    return @"_id";
}

- (instancetype)initWithUserId:(NSString *)userID {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    return (UserInfoModel *)[UserInfoModel selectOneObjectByIdName:@"_id" idValue:userID];
}

- (void (^)(NSString *))updateName {
    return ^(NSString *name) {
        RLMRealm *realm = [RLMRealm defaultRealm];
        
        [realm beginWriteTransaction];
        self.name = name;
        [realm commitWriteTransaction];
    };
}

@end
