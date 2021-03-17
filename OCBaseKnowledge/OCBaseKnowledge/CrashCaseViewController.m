//
//  CrashCaseViewController.m
//  OCBaseKnowledge
//
//  Created by laolai on 2021/3/5.
//

#import "CrashCaseViewController.h"

/**
 代理协议
 */
@protocol UnrecognizedSelectorVCDelegate <NSObject>

@optional
- (void)notImplementionFunc;

@end
/**
 测试控制器的代理对象
 */
@interface UnrecognizedSelectorVCObj : NSObject<UnrecognizedSelectorVCDelegate>

//@property (nonatomic, strong) NSString *name;

@end

@implementation UnrecognizedSelectorVCObj

// case1解决办法2：实现代理方法
//- (void)notImplementionFunc {
//    NSLog(@"%s", __FUNCTION__);
//}

@end

@interface CrashCaseViewController ()

@property(nonatomic, weak) id<UnrecognizedSelectorVCDelegate> delegate;
@property (nonatomic, copy) NSMutableArray *mArray;

@end

@implementation CrashCaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self case1];
    [self case2];
    [self case3];
    [self caseKVC1];
    [self caseKVC2];
    [self caseKVC3];
//    [self caseKVO1];
//    [self caseKVO2];
    
}

#pragma mark - unrecognized selector sent to instance
#pragma mark - 崩溃原因：找不到方法iOS系统抛出异常崩溃

/**
 场景一：没有实现代理
 */
- (void)case1 {
    UnrecognizedSelectorVCObj* obj = [[UnrecognizedSelectorVCObj alloc] init];
    self.delegate = obj;
    // 崩溃：reason: '-[UnrecognizedSelectorVCObj notImplementionFunc]: unrecognized selector sent to instance 0x2808047f0'
    [self.delegate notImplementionFunc];
    // 解决办法1：应该使用下面的代码
    if ( [self.delegate respondsToSelector:@selector(notImplementionFunc)] ) {
        [self.delegate notImplementionFunc];
    }
    
}
/**
 场景二：可变属性使用copy修饰
 */
- (void)case2 {
    NSMutableArray* array = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];
    self.mArray = array;
    // 崩溃：reason: '-[__NSArrayI addObject:]: unrecognized selector sent to instance 0x281198a50'
    [self.mArray addObject:@4];
    // 原因：NSMutableArray经过copy之后变成NSArray
    // @property (nonatomic, copy) NSMutableArray *mArray;
    // 等同于
    // - (void)setMArray:(NSMutableArray *)mArray {
    //    _mArray = mArray.copy;
    //}
    // 解决办法：使用strong修饰或者重写set方法

    // 知识点：集合类对象和非集合类对象的copy与mutableCopy
    // [NSArray copy]                  // 浅复制(新的和原来的是一个array)
    // [NSArray mutableCopy]           // 深复制(array是新的，但是内容还是原来的，内容的指针没有变化)
    // [NSMutableArray copy]           // 深复制(array是新的，但是内容还是原来的，内容的指针没有变化)
    // [NSMutableArray mutableCopy]    // 深复制(array是新的，但是内容还是原来的，内容的指针没有变化)
}
/**
 场景三：低版本系统使用高版本API
 */
- (void)case3 {
    if (@available(iOS 10.0, *)) {
        [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {

        }];
    } else {
        // Fallback on earlier versions
    }
}


#pragma mark - 解决方案：
// 1、给NSObject添加一个分类，实现【消息转发】的几个方法




#pragma mark ------------------分割线------------------
#pragma mark - KVC造成的crash

- (void)caseKVC1 {
    
}

- (void)caseKVC2 {
    
}

- (void)caseKVC3 {
    
}

@end
