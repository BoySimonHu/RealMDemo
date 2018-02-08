//
//  RLMBaseModel.h
//  RealMDemo
//
//  Created by Simon Mr on 2018/1/29.
//  Copyright © 2018年 Simon Mr. All rights reserved.
//

#import <Realm/Realm.h>

@interface RLMBaseModel : RLMObject

/**
 存储对象
 */
- (void)saveData;

/**
 更新用户数据
 
 @param updateBlock 更新数据的block
 */
+ (void)updateData:(void (^)(void))updateBlock;

/**
 将jsonDic转化为Model存储到本地(更新或插入)
 
 @param jsonDic 得到的jsonDic
 @return RLMBaseModel对象
 */
+ (RLMBaseModel *)saveDataWithJson:(NSDictionary *)jsonDic;

/**
 批量更新某一字段
 
 @param property 要更新的属性名
 @param value 数据的value
 */
+ (void)updateAllDataWithProperty:(NSString *)property value:(id)value;

+ (RLMResults<RLMObject *> *)selectAllObjectByIdName:(NSString *)idName idValue:(id)idValue;

+ (RLMObject *)selectOneObjectByIdName:(NSString *)idName idValue:(id)idValue;


@end
