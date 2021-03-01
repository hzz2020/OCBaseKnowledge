//
//  CustomObject+HzzTest.m
//  OCBaseKnowledge
//
//  Created by laolai on 2021/2/22.
//

#import "CustomObject+HzzTest.h"
#import <objc/runtime.h>

@implementation CustomObject (HzzTest)

- (id)obj_strong {
    return objc_getAssociatedObject(self, _cmd);
    // == return objc_getAssociatedObject(self, @selector(obj_strong));
}

- (void)setObj_strong:(id)obj_strong {
    objc_setAssociatedObject(self, @selector(obj_strong), obj_strong, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)obj_copy {
    return objc_getAssociatedObject(self, _cmd);
    // == return objc_getAssociatedObject(self, @selector(obj_copy));
}

- (void)setObj_copy:(id)obj_copy {
    objc_setAssociatedObject(self, @selector(obj_copy), obj_copy, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (id)obj_assign {
    return objc_getAssociatedObject(self, _cmd);
    // == return objc_getAssociatedObject(self, @selector(obj_assign));
}

- (void)setObj_assign:(id)obj_assign {
    objc_setAssociatedObject(self, @selector(obj_assign), obj_assign, OBJC_ASSOCIATION_ASSIGN);
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
// 父类方法一般使用继承、在分类中使用runtime的method swizzling来进行方法IMP的交换处理.
- (void)eat{
    NSLog(@"分类中与原类方法重名的方法");
}
#pragma clang diagnostic pop


- (void)drink {
    NSLog(@"分类中新增的方法");
}

@end
