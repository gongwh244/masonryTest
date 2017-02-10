//
//  WeiBoModel.h
//  masonryTest
//
//  Created by gong on 17/2/9.
//  Copyright © 2017年 ches. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiBoModel : NSObject

@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *weiboId;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSURL *imageUrl;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *text;

@end
