//
//  DataBaseManager.m
//  RealMDemo
//
//  Created by Simon Mr on 2017/12/20.
//  Copyright © 2017年 Simon Mr. All rights reserved.
//

#import "DataBaseManager.h"

#import <objc/runtime.h>

@implementation DataBaseManager

#pragma mark - 配置数据库
// 创建realm数据库
+ (void)createDataBase {
    // 获取文件路径
    NSArray *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [docPath objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:@"data"];
    NSLog(@"filePath = %@",filePath);
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    [[[config.fileURL URLByDeletingLastPathComponent]
      URLByAppendingPathComponent:filePath]
     URLByAppendingPathExtension:@"realm"];
    config.readOnly = NO;
    config.schemaVersion = 2.0;
    // 配置config
    [RLMRealmConfiguration setDefaultConfiguration:config];
    
    // 创建DB
    NSError *error = nil;
    RLMRealm *realm = [RLMRealm realmWithConfiguration:config error:&error];
    
    if (!realm) {
        NSLog(@"%ld", error.code);
    }
}

#pragma mark - 表操作
// 创建新表
+ (BOOL)addNewTable:(NSString *)classString {
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    
    NSMutableArray *tableArr = config.objectClasses.mutableCopy;
    [tableArr addObject:[NSClassFromString(classString) class]];
    
    config.objectClasses = tableArr.copy;
    
    return YES;
}

// 更新数据库字段
+ (void)updateColumnWithObject:(RLMObject *)object {
    
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.schemaVersion = 2.0;
    config.migrationBlock = ^(RLMMigration *migration, uint64_t oldSchemaVersion) {
        RLMObjectSchema * obj = migration.newSchema.objectSchema.firstObject;
        RLMObjectSchema * obj1 = migration.oldSchema.objectSchema.firstObject;
        NSLog(@"%@", obj.properties);
        NSLog(@"%@", obj1.properties);
        if (oldSchemaVersion < 2.0) {
            
        }
    };
    
    [RLMRealmConfiguration setDefaultConfiguration:config];
    [RLMRealm defaultRealm];
}

@end
