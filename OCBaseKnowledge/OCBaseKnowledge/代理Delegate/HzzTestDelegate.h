//
//  HzzTestDelegate.h
//  OCBaseKnowledge
//
//  Created by laolai on 2021/2/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HzzTestDelegate <NSObject>

@optional /// 可选
- (void)print;

@required /// 必实现
- (void)hello;

@end

NS_ASSUME_NONNULL_END
