//
//  Person.m
//  OCBaseKnowledge
//
//  Created by laolai on 2021/3/18.
//

#import "Person.h"

@interface Person ()


@end

@implementation Person

#pragma mark ---- setValue:forKey:
/***
 1、顺序查找setKey、_setKey方法，找到就调用；
 2、没找到，查看accessInstanceVariablesDirectly返回值：为NO就调用【setValue:UndefinedKey】
 3、为YES，则顺序查找成员变量_key、_isKey、key、isKey；找到了就【赋】值；
 4、没找到调用【setValue:UndefinedKey】
 */


/// ①setKey
- (void)setAge:(NSInteger)age {
    NSLog(@"setAge---%zd", age);
}

/// ②_setKey
- (void)_setAge:(NSInteger)age {
    NSLog(@"_setAge---%zd", age);
}

/// ③判断accessInstanceVariablesDirectly返回值 默认YES( NO：异常；YES：正常)
+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

///// ①②③不走则依次找_key _isKey key isKey是否有

#pragma mark ---- valueForKey
/**
 1、顺序查找getKey、key、isKey、_key方法，找到就调用；
 2、没找到，查看accessInstanceVariablesDirectly返回值：为NO就调用【valueForUndefinedKey】
 3、为YES，则顺序查找成员变量_key、_isKey、key、isKey；找到了就【取】值；
 4、没找到调用【valueForUndefinedKey】
 */

- (NSInteger)getAge {
    return 1;
}
- (NSInteger)age {
    return 2;
}
- (NSInteger)isAge {
    return 3;
}
- (NSInteger)_age {
    return 4;
}

//+ (BOOL)accessInstanceVariablesDirectly {
//    return NO;
//}

@end
