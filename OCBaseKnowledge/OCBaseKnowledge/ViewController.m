//
//  ViewController.m
//  OCBaseKnowledge
//
//  Created by laolai on 2021/2/22.
//

#import "ViewController.h"
#import "UIView+HzzTest.h"
//#import "CustomObject.h"
#import "CustomObject+HzzTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
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
}


@end
