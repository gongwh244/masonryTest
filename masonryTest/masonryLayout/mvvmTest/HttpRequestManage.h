//
//  HttpRequestManage.h
//  masonryTest
//
//  Created by gong on 17/2/9.
//  Copyright © 2017年 ches. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequestManage : NSObject


















+ (void)HttpRequestGetWithUrl:(NSString *)url
                    parameter:(NSDictionary *)parameter
                 successBlock:(SuccessBlock)sucBlock
                 failureBlock:(FailureBlock)failBlock
                     netBlock:(NetWorkingBlock)netBlock;

+ (void)HttpRequestPostWithUrl:(NSString *)url
                    parameter:(NSDictionary *)parameter
                 successBlock:(SuccessBlock)sucBlock
                 failureBlock:(FailureBlock)failBlock
                     netBlock:(NetWorkingBlock)netBlock;

@end
