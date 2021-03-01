//
//  UIView+HzzTest.h
//  OCBaseKnowledge
//
//  Created by laolai on 2021/2/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DefaultBlock)(void); // 无参数的block
typedef void(^ParamDefaultlock)(id object); // 有参数的block

@interface UIView (HzzTest)
/// 知识点：
/// 1、基础数据类型可以不使用关联对象来实现getter、settet方法；
/// 2、ARC下 基本数据类型属性默认为atomic、readwrite、assign；OC对象类型默认为atomic, readwrite, strong。
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) NSInteger interval; ///点击事件间隔 防止连续点击

/// 清除所有子视图
- (void)removeAllSubViews;

+ (void)logTest;

/// 增加点击事件
- (void)addTouchBlock:(DefaultBlock)touchBlock;
- (void)addTouchWithParaBlock:(ParamDefaultlock)touchBlock;

@end

#pragma mark ---- UIButton的分类

@interface UIButton (HzzTest)

- (void)addTouchBlock:(DefaultBlock)touchBlock;
- (void)addTouchWithParaBlock:(ParamDefaultlock)touchBlock;

@end

NS_ASSUME_NONNULL_END
