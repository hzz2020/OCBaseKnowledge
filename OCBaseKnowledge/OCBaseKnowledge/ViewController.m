//
//  ViewController.m
//  OCBaseKnowledge
//
//  Created by laolai on 2021/2/22.
//

#import "ViewController.h"
#import "UIView+HzzTest.h"
#import "CustomObject+HzzTest.h"
#import "CustomView.h"

@interface ViewController () <HzzTestDelegate>

@property (nonatomic, strong) NSMutableArray *strongArray;
@property (nonatomic, strong) NSMutableArray *acopyArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self sqCopyTest];
    
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
    
    /* Delegate */
    CustomView *cView = [[CustomView alloc] initWithFrame:CGRectMake(220, 220, 100, 100)];
    cView.backgroundColor = [UIColor darkGrayColor];
    cView.delegate = self;
    [self.view addSubview:cView];
    
    [UIView logTest];
}

/// 深浅copy
- (void)sqCopyTest {
    CustomView *vv = [[CustomView alloc] init];
    vv.strongArray = self.strongArray;
    vv.acopyArray = self.acopyArray;  /// 这里经过了一次copy，则根据copy规则 vv.acopyArray 成了不可变的。
    
    /// strong 有变均变
    [self.strongArray addObject:@"4"];
    [vv.strongArray addObject:@"6"];
    /// strong修饰的变 copy修饰的不变
    [self.acopyArray addObject:@"5"];
//    [vv.acopyArray addObject:@"7"]; // Crash
    
    self.acopyArray = [vv.acopyArray copy]; /// [不可变 copy] 为浅copy，两者指向同一处不可变的
//    [self.acopyArray addObject:@"000"]; /// Crash
    self.acopyArray = @[@"aa",@"4444",@"333"].copy;
    NSLog(@"");
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


@end
