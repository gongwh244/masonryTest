//
//  UIColor+randomColor.m
//  masonryTest
//
//  Created by ches on 15/11/23.
//  Copyright © 2015年 ches. All rights reserved.
//

#import "UIColor+randomColor.h"

@implementation UIColor (randomColor)

+ (UIColor *)randomColor{
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
