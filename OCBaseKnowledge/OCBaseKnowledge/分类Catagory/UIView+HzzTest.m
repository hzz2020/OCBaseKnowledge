//
//  UIView+HzzTest.m
//  OCBaseKnowledge
//
//  Created by laolai on 2021/2/22.
//

#import "UIView+HzzTest.h"
#import <objc/runtime.h>

@implementation UIView (HzzTest)

/// runtime 方法混淆
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method initMethod = class_getInstanceMethod([self class], @selector(init));
        Method initNewMethod = class_getInstanceMethod([self class], @selector(ll_init));
        method_exchangeImplementations(initMethod, initNewMethod);
    });
}

- (instancetype)ll_init {
    UIView *view = [self ll_init];
    view.interval = 1;
    
    return view;
}

/**
 * 基础数据类型可以不使用关联对象
 */
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width {
    return self.bounds.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.bounds.size.height;
}


/**
 * 使用关联对象来添加成员变量
 */
- (void)setInterval:(NSInteger)interval {
    objc_setAssociatedObject(self, @"kInterval", @(interval), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSInteger)interval {
    NSInteger interval = [objc_getAssociatedObject(self, @"kInterval") integerValue];
    return interval;
}

///清除所有子视图
- (void)removeAllSubViews {
    for (UIView *view in self.subviews) {
        // 这里追加例外处理。飘过~
        if (view.tag == 404) {
            continue;
        }
        [view removeFromSuperview];
    }
}

///增加点击事件
- (void)addTouchBlock:(DefaultBlock)touchBlock {
    if (touchBlock) {
        objc_setAssociatedObject(self, @"kViewTouchBlock", touchBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
        self.userInteractionEnabled = YES;
    }
}

- (void)addTouchWithParaBlock:(ParamDefaultlock)touchBlock {
    if (touchBlock) {
        objc_setAssociatedObject(self, @"kViewTouchParaBlock", touchBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
        self.userInteractionEnabled = YES;
    }
}

- (void)tap:(UITapGestureRecognizer *)tap {
    if (tap.state == UIGestureRecognizerStateEnded) {
        [self touchUpInside];
    }
}

- (void)touchUpInside {
    ///如果没有超过连点间隔
    if ([NSDate date].timeIntervalSince1970 < [self getTouchTime].timeIntervalSince1970 + self.interval) {
        return;
    }
    
    ///获取点击回调
    DefaultBlock touchBlock = objc_getAssociatedObject(self, @"kViewTouchBlock");
    ParamDefaultlock touchParaBlock = objc_getAssociatedObject(self, @"kViewTouchParaBlock");
    
    ///记录点击时间
    objc_setAssociatedObject(self, @"kTouchTime", [NSDate date], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    ///执行Block
    if (touchBlock) {
        touchBlock();
    }
    if (touchParaBlock) {
        touchParaBlock(self);
    }
}

- (NSDate *)getTouchTime {
    return objc_getAssociatedObject(self, @"kTouchTime");
}

@end

@implementation UIButton (HzzTest)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method initMethod = class_getClassMethod([self class], @selector(buttonWithType:));
        Method initNewMethod = class_getClassMethod([self class], @selector(ll_buttonWithType:));
        method_exchangeImplementations(initMethod, initNewMethod);
    });
}

+ (instancetype)ll_buttonWithType:(UIButtonType)buttonType {
    UIButton *btn = [self ll_buttonWithType:buttonType];
    btn.interval = 1;
    
    return btn;
}

///增加点击事件
- (void)addTouchBlock:(DefaultBlock)touchBlock {
    if (touchBlock) {
        objc_setAssociatedObject(self, @"kViewTouchBlock", touchBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        [self addTarget:self action:@selector(touchUpInside) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)addTouchWithParaBlock:(ParamDefaultlock)touchBlock {
    if (touchBlock) {
        objc_setAssociatedObject(self, @"kViewTouchParaBlock", touchBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        [self addTarget:self action:@selector(touchUpInside) forControlEvents:UIControlEventTouchUpInside];
    }
}

@end
