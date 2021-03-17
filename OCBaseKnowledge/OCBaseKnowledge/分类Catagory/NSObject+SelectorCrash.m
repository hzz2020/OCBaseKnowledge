//
//  NSObject+SelectorCrash.m
//  OCBaseKnowledge
//
//  Created by laolai on 2021/3/9.
//

#import "NSObject+SelectorCrash.h"
#import <objc/runtime.h>

@implementation NSObject (SelectorCrash)
 
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
/// 实例方法
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([self respondsToSelector:aSelector]) {
        // 已实现不做处理
        return [self methodSignatureForSelector:aSelector];
    }
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"在 %@ 类中, 调用了没有实现的实例方法: %@ ",NSStringFromClass([self class]),NSStringFromSelector(anInvocation.selector));
}

/// 类方法
+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([self respondsToSelector:aSelector]) {
        // 已实现不做处理
        return [self methodSignatureForSelector:aSelector];
    }
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

+ (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"在 %@ 类中, 调用了没有实现的类方法: %@ ",NSStringFromClass([self class]),NSStringFromSelector(anInvocation.selector));
}

#pragma clang diagnostic pop

@end
