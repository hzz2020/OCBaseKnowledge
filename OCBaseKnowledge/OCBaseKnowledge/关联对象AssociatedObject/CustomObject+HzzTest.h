//
//  CustomObject+HzzTest.h
//  OCBaseKnowledge
//
//  Created by laolai on 2021/2/22.
//

#import "CustomObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomObject (HzzTest)

@property (nonatomic, strong) id obj_strong;
@property (nonatomic, copy) id obj_copy;
@property (nonatomic, assign) id obj_assign;

/// 在分类中 有与原类同名的方法
- (void)eat;

- (void)drink;

@end

NS_ASSUME_NONNULL_END
