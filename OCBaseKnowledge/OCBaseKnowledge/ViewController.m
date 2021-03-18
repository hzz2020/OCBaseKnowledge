//
//  ViewController.m
//  OCBaseKnowledge
//
//  Created by laolai on 2021/2/22.
//

#import "ViewController.h"
#import "UIView+HzzTest.h"
#import "CustomObject+HzzTest.h"
#import "CrashCaseViewController.h"
#import "DHLSelectView.h"
#import "Person.h"

@interface ViewController () <DHLSelectViewDelegate>
@property (nonatomic, strong) DHLSelectView *dhlSelectView;
@property (nonatomic, strong) NSMutableArray *strongArray;
@property (nonatomic, strong) NSMutableArray *acopyArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    /* Delegate 代理 */
    [self.view addSubview:self.dhlSelectView];
    
    [self sqCopyTest];
    
    
    /******************* KVC ********************/
    Person *person = [Person new];
    /// setValue forKey
    [person setValue:@(1) forKey:@"age"];
    NSLog(@"%ld", (long)person->_age);
    NSLog(@"%ld", (long)person->_isAge);
    NSLog(@"%ld", (long)person->age);
    NSLog(@"%ld", (long)person->isAge);
    /// 触发KVO
    [person addObserver:self
             forKeyPath:@"age"
                options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                context:@"111"];
    [person setValue:@(9) forKey:@"age"];
    
    [person setValue:@(6) forKey:@"age"];
    
    person->_age = 5;
    person->_isAge = 2;
    person->age = 3;
    person->isAge = 4;
    /// valueForKey
    NSLog(@"age---%@", [person valueForKey:@"age"]);
    
    /// KVC嵌套使用
    Dog *dog = [Dog new];
    person.dog = dog;
    [person setValue:@(2) forKeyPath:@"dog.age"];
    NSLog(@"dog.age = %ld", (long)person.dog.age);
    
    
    
    
    
    
    
    
    
    
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(20, 80, 80, 80);
    view.backgroundColor = [UIColor redColor];
    [view addTouchBlock:^{
        NSLog(@"点击了view");
    }];
    [self.view addSubview:view];
    
    view = [UIView new];
    view.frame = CGRectMake(120, 80, 80, 80);
    view.backgroundColor = [UIColor yellowColor];
    [view addTouchWithParaBlock:^(id  _Nonnull object) {
        NSLog(@"点击了%@", object);
    }];
    [self.view addSubview:view];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 180, 80, 80);
    button.backgroundColor = [UIColor greenColor];
    [button addTouchBlock:^{
        NSLog(@"点击了button");
    }];
    [button addTouchWithParaBlock:^(id  _Nonnull object) {
        NSLog(@"点击了%@", object);
        NSLog(@"点击了%@", NSStringFromClass([object class]));
    }];
    [self.view addSubview:button];
    
    
    CustomObject *obj = [[CustomObject alloc] init];
    /// setter
    obj.obj_assign = @1;
    obj.obj_copy = @"copy";
    obj.obj_strong = @"strong";
    /// getter
    NSLog(@"%@", obj.obj_assign);
    NSLog(@"%@", obj.obj_copy);
    NSLog(@"%@", obj.obj_strong);
    
    [obj eat];
    [obj drink];
    
    [UIView logTest];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    if (context == @"111") {
        NSLog(@"%@-", object);
        NSLog(@"%@--", keyPath);
        NSLog(@"%@---", change);
    }
}

/// 深浅copy
- (void)sqCopyTest {
//    CustomView *vv = [[CustomView alloc] init];
//    vv.strongArray = self.strongArray;
//    vv.acopyArray = self.acopyArray;  /// 这里经过了一次copy，则根据copy规则 vv.acopyArray 成了不可变的。
//    
//    /// strong 有变均变
//    [self.strongArray addObject:@"4"];
//    [vv.strongArray addObject:@"6"];
//    /// strong修饰的变 copy修饰的不变
//    [self.acopyArray addObject:@"5"];
////    [vv.acopyArray addObject:@"7"]; // Crash
//    
//    self.acopyArray = [vv.acopyArray copy]; /// [不可变 copy] 为浅copy，两者指向同一处不可变的
////    [self.acopyArray addObject:@"000"]; /// Crash
//    self.acopyArray = @[@"aa",@"4444",@"333"].copy;
//    NSLog(@"");
}

#pragma mark ---- HzzTestDelegate
- (void)hello {
    NSLog(@"12131312");
}

//- (void)print {
//    NSLog(@"1111");
//}

- (NSMutableArray *)strongArray {
    if (!_strongArray) {
        _strongArray = [@[@"m-array-1",@"m-array-2",@"m-array-3"] mutableCopy];
    }
    return _strongArray;
}

- (NSMutableArray *)acopyArray {
    if (!_acopyArray) {
        _acopyArray = [@[@"m-array-1",@"m-array-2",@"m-array-3"] mutableCopy];
    }
    return _acopyArray;
}

- (DHLSelectView *)dhlSelectView {
    if (!_dhlSelectView) {
        _dhlSelectView = [[DHLSelectView alloc] initWithFrame:CGRectMake(20, 300, 200, 200)];
        _dhlSelectView.backgroundColor = [UIColor purpleColor];
        _dhlSelectView.delegate = self;
    }
    return _dhlSelectView;
}

#pragma mark - DHLSelectViewDelegate
- (void)method1 {
    NSLog(@"%s", __FUNCTION__);
}

- (void)method2 {
    NSLog(@"%s", __FUNCTION__);
}

//- (void)method3 {
//    NSLog(@"%s", __FUNCTION__);
//}


@end
