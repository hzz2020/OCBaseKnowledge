//
//  CustomView.m
//  OCBaseKnowledge
//
//  Created by laolai on 2021/2/23.
//

#import "CustomView.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildSubViews];
    }
    return self;
}

- (void)buildSubViews {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [self addGestureRecognizer:tap];
    self.userInteractionEnabled = YES;
}

- (void)click {
    if ([self.delegate respondsToSelector:@selector(print)]) {
        [self.delegate print];
    }
    
    if ([self.delegate respondsToSelector:@selector(hello)]) {
        [self.delegate hello];
    }
}

@end
