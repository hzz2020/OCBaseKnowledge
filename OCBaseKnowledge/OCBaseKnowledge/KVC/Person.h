//
//  Person.h
//  OCBaseKnowledge
//
//  Created by laolai on 2021/3/18.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    /// ④
    @public
    NSInteger _age;
    NSInteger _isAge;
    NSInteger age;
    NSInteger isAge;
}

@property (nonatomic, strong) Dog *dog;

@end

NS_ASSUME_NONNULL_END
