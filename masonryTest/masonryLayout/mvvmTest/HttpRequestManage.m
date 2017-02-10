//
//  HttpRequestManage.m
//  masonryTest
//
//  Created by gong on 17/2/9.
//  Copyright © 2017年 ches. All rights reserved.
//

#import "HttpRequestManage.h"


@implementation HttpRequestManage













+ (void)HttpRequestGetWithUrl:(NSString *)url
                    parameter:(NSDictionary *)parameter
                 successBlock:(SuccessBlock)sucBlock
                 failureBlock:(FailureBlock)failBlock
                     netBlock:(NetWorkingBlock)netBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = responseObject;
        sucBlock(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+ (void)HttpRequestPostWithUrl:(NSString *)url
                     parameter:(NSDictionary *)parameter
                  successBlock:(SuccessBlock)sucBlock
                  failureBlock:(FailureBlock)failBlock
                      netBlock:(NetWorkingBlock)netBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        DBUGLog(@"%@",dic);
        sucBlock(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
