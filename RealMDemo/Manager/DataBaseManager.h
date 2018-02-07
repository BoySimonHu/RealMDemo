//
//  DataBaseManager.h
//  RealMDemo
//
//  Created by Simon Mr on 2017/12/20.
//  Copyright © 2017年 Simon Mr. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Realm/Realm.h>
#import <Realm/RLMSchema.h>

@interface DataBaseManager : NSObject

@property (nonatomic, strong) RLMRealm *realm;

+ (void)createDataBase;

+ (BOOL)addNewTable:(NSString *)classString;

+ (void)updateColumnWithObject:(Class)object;


@end
