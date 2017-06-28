//
//  Calculator.m
//  masonryTest
//
//  Created by gong on 2017/6/28.
//  Copyright © 2017年 ches. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

+ (Calculator *)defaultCal{
    Calculator *cal = [[Calculator alloc] init];
    return cal;
}


- (Calculator *(^)(NSInteger))jia{
    return ^(NSInteger num){
        self.result += num;
        return self;
    };
}

- (Calculator *(^)(NSInteger))jian{
    return ^(NSInteger num){
        self.result -= num;
        return self;
    };
}

- (Calculator *(^)(NSInteger))chen{
    return ^(NSInteger num){
        self.result *= num;
        return self;
    };
}

- (Calculator *(^)(NSInteger))chu{
    return ^(NSInteger num){
        self.result /= num;
        return self;
    };
}

@end
