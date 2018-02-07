//
//  RLMBaseModel.m
//  RealMDemo
//
//  Created by Simon Mr on 2018/1/29.
//  Copyright © 2018年 Simon Mr. All rights reserved.
//

#import "RLMBaseModel.h"
#import <objc/runtime.h>
#import <MJExtension.h>

@interface RLMBaseModel ()

{
    NSArray<NSArray *> *_propertyArray;
}

@end

@implementation RLMBaseModel

- (NSArray *)propertyArray {
    if (!_propertyArray) {
        NSArray *ignoredArray = [self.class ignoredProperties];
        
        NSMutableArray *array = [NSMutableArray array];
        
        [self.class mj_enumerateProperties:^(MJProperty *property, BOOL *stop) {
            NSString *name = property.name;
            if (![ignoredArray containsObject:name]) {
                NSString *typeCode = property.type.code;
                NSString *type = @"";
                
                type = typeCode;
                
                if (![name isEqualToString:@"description"] &&
                    ![name isEqualToString:@"debugDescription"] &&
                    name.length > 0 &&
                    type.length > 0) {
                    [array addObject:@[ name, type ]];
                }
            }
        }];
        
        _propertyArray = array;
    }
    return _propertyArray;
}

#pragma mark - 成员方法
- (void)getData {
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
       
    }];
}

- (void)saveData {
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObject:self];
    [realm commitWriteTransaction];
}

#pragma mark - 类方法
+ (RLMBaseModel *)saveDataWithJson:(NSDictionary *)jsonDic {
    id model = [[[self class] alloc] initWithValue:jsonDic];
    
    [model saveData];
    
    return model;
}

+ (void)updateData:(void (^)(void))updateBlock {
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    updateBlock();
    [realm commitWriteTransaction];
}

+ (void)updateAllDataWithProperty:(NSString *)property value:(id)value {
    RLMResults *results = [self.class allObjects];
    [[RLMRealm defaultRealm] transactionWithBlock:^{
        [results setValue:value forKeyPath:property];
    }];
}

@end
