//
//  CustomView.h
//  OCBaseKnowledge
//
//  Created by laolai on 2021/2/23.
//

#import <UIKit/UIKit.h>
#import "HzzTestDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomView : UIView

@property (nonatomic, weak) id<HzzTestDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
