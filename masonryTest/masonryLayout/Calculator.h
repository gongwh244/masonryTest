//
//  Calculator.h
//  masonryTest
//
//  Created by gong on 2017/6/28.
//  Copyright © 2017年 ches. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface Calculator : NSObject



@property (nonatomic,assign) NSInteger result;

@property (nonatomic,copy) Calculator *(^jia)(NSInteger num);
@property (nonatomic,copy) Calculator *(^jian)(NSInteger num);
@property (nonatomic,copy) Calculator *(^chen)(NSInteger num);
@property (nonatomic,copy) Calculator *(^chu)(NSInteger num);

+ (Calculator *)defaultCal;
@end
