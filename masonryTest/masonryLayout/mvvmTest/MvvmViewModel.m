//
//  MvvmViewModel.m
//  masonryTest
//
//  Created by gong on 17/2/9.
//  Copyright © 2017年 ches. All rights reserved.
//

#import "MvvmViewModel.h"
#import "HttpRequestManage.h"
#import "WeiBoModel.h"

@implementation MvvmViewModel

- (void)setBlockWithSuccessBlock:(SuccessBlock)sucBlock
                    failureBlock:(FailureBlock)faiBlock
                        netBlock:(NetWorkingBlock)netBlock{
    _successBlock = sucBlock;
    _failureBlock = faiBlock;
    _netBlock = netBlock;
}

- (void)getWeiboList{
    
    NSDictionary *parameter = @{TOKEN: ACCESSTOKEN,
                                COUNT: @"100"
                                };
    
    [HttpRequestManage HttpRequestGetWithUrl:REQUESTPUBLICURL parameter:parameter successBlock:^(id returnValue) {
        
        [self WeiBoModelArrayWithDic:returnValue];
    } failureBlock:^(id returnValue) {
        
    } netBlock:^(id netState) {
        
    }];
}

- (void)WeiBoModelArrayWithDic:(NSDictionary *)dic{
    
    NSArray *statuses = dic[STATUSES];
    NSMutableArray *publicModelArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];
    
    for (int i = 0; i < statuses.count; i ++) {
        WeiBoModel *publicModel = [[WeiBoModel alloc] init];
        
        //设置时间
        NSDateFormatter *iosDateFormater=[[NSDateFormatter alloc]init];
        iosDateFormater.dateFormat=@"EEE MMM d HH:mm:ss Z yyyy";
        
        //必须设置，否则无法解析
        iosDateFormater.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
        NSDate *date=[iosDateFormater dateFromString:statuses[i][CREATETIME]];
        
        //目的格式
        NSDateFormatter *resultFormatter=[[NSDateFormatter alloc]init];
        [resultFormatter setDateFormat:@"MM月dd日 HH:mm"];
        
        publicModel.date = [resultFormatter stringFromDate:date];
        publicModel.userName = statuses[i][USER][USERNAME];
        publicModel.text = statuses[i][WEIBOTEXT];
        publicModel.imageUrl = [NSURL URLWithString:statuses[i][USER][HEADIMAGEURL]];
        publicModel.userId = statuses[i][USER][UID];
        publicModel.weiboId = statuses[i][WEIBOID];
        
        
        NSString *str = [NSString stringWithFormat:@"userId = %@;weiboId = %@;userName = %@;imageUrl = %@;date = %@;text = %@;",publicModel.userId,publicModel.weiboId,publicModel.userName,publicModel.imageUrl,publicModel.date,publicModel.text];
        NSLog(@"model = %@",str);
        
        [publicModelArray addObject:publicModel];
        
    }
    self.successBlock(publicModelArray);
}

@end
