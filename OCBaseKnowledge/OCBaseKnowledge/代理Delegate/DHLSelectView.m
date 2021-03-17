//
//  DHLSelectView.m
//  OCBaseKnowledge
//
//  Created by laolai on 2021/3/17.
//

#import "DHLSelectView.h"
#import "UIView+HzzTest.h"

// 扩展
@interface DHLSelectView ()

@end

@implementation DHLSelectView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildSubViews];
    }
    return self;
}

- (void)buildSubViews {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 60);
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"按钮1" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    __weak typeof(self)weakSelf = self;
    [button addTouchBlock:^{
        __strong typeof(self)strongSelf = weakSelf;
        if (strongSelf.delegate && [strongSelf.delegate respondsToSelector:@selector(method1)]) {
            [strongSelf.delegate method1];
        }
    }];
    [self addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(70, 0, 60, 60);
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"按钮2" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button addTouchBlock:^{
        __strong typeof(self)strongSelf = weakSelf;
        if (strongSelf.delegate && [strongSelf.delegate respondsToSelector:@selector(method2)]) {
            [strongSelf.delegate method2];
        }
    }];
    [self addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(140, 0, 60, 60);
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"按钮3" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTouchBlock:^{
        __strong typeof(self)strongSelf = weakSelf;
        if (strongSelf.delegate && [strongSelf.delegate respondsToSelector:@selector(method3)]) {
            [strongSelf.delegate method3];
        }
    }];
    [self addSubview:button];
}


@end
