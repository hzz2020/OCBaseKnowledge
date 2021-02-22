//
//  CustomObject.h
//  OCBaseKnowledge
//
//  Created by laolai on 2021/2/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomObject : NSObject

/// 知识点：ARC下 基本数据类型属性默认为atomic、readwrite、assign；OC对象类型默认为atomic, readwrite, strong。
@property (nonatomic, copy) NSString *name; ///OC对象 不用strong，就要coding出来copy
@property (nonatomic) NSInteger count; /// 默认assign

- (void)eat;


@end

NS_ASSUME_NONNULL_END
