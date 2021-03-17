//
//  DHLSelectView.h
//  OCBaseKnowledge
//
//  Created by laolai on 2021/3/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DHLSelectViewDelegate <NSObject>

@required
- (void)method1;
- (void)method2;
@optional
- (void)method3;

@end


@interface DHLSelectView : UIView

@property (nonatomic, weak) id<DHLSelectViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
