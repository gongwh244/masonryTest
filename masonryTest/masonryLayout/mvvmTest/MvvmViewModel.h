//
//  MvvmViewModel.h
//  masonryTest
//
//  Created by gong on 17/2/9.
//  Copyright © 2017年 ches. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface MvvmViewModel : NSObject

@property (nonatomic,copy)SuccessBlock successBlock;
@property (nonatomic,copy)FailureBlock failureBlock;
@property (nonatomic,copy)NetWorkingBlock netBlock;

- (void)setBlockWithSuccessBlock:(SuccessBlock)sucBlock
                    failureBlock:(FailureBlock)faiBlock
                        netBlock:(NetWorkingBlock)netBlock;

- (void)getWeiboList;

@end
