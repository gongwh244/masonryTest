//
//  emitterViewController.m
//  masonryTest
//
//  Created by ches on 15/11/30.
//  Copyright © 2015年 ches. All rights reserved.
//

#import "emitterViewController.h"

@interface emitterViewController (){
    CAEmitterLayer *_fireEmitter;
    UIView *_imageView;
    CGFloat _angle;
}
@end

@implementation emitterViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    [self layoutImageView];
}

- (void)layoutImageView{
    
    _imageView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _imageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_imageView];
    _imageView.layer.cornerRadius = _imageView.bounds.size.width * 0.5;
    
    for (int i = 0; i < 5; i ++) {
        UIView *view = [UIView new];
        view.frame = [self randomLocation];
        view.backgroundColor = [UIColor whiteColor];
        [_imageView addSubview:view];
    }
    _angle = 0;
    [self startAnimation];
}

- (CGRect)randomLocation{
    CGFloat x = arc4random() % 101;
    CGFloat y = arc4random() % 101;
    return CGRectMake(x, y, 2, 2);
}

-(void)startAnimation{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.05];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
    _imageView.transform = CGAffineTransformMakeRotation(_angle * (M_PI / 180.0f));
    [UIView commitAnimations];
}

-(void)endAnimation{
    _angle += 10;
    [self startAnimation];
}






























































- (void)layOUtSnowEmitter{
    
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    //例子发射位置
    snowEmitter.emitterPosition = CGPointMake(100, self.view.frame.size.height - 64-100);
    //发射源的尺寸大小
    snowEmitter.emitterSize = CGSizeMake( 10, 0);
    //发射模式
    snowEmitter.emitterMode = kCAEmitterLayerVolume;
    //发射源的形状
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    
    //创建雪花类型的粒子
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    //粒子的名字
    snowflake.name = @"snow";
    //粒子参数的速度乘数因子
    snowflake.birthRate = 1.0;
    snowflake.lifetime = 10.0;
    //粒子速度
    snowflake.velocity =10.0;
    //粒子的速度范围
    snowflake.velocityRange = 100;
    //粒子y方向的加速度分量
    snowflake.yAcceleration = 15;
    //周围发射角度
    //snowflake.emissionRange = 0.5 * M_PI;
    snowflake.emissionLongitude = 0.25 *M_PI;
    snowflake.emissionLatitude = 0.25 *M_PI;
    //子旋转角度范围
    snowflake.spinRange = 0.5 * M_PI;
    snowflake.contents = (id)[[UIImage imageNamed:@"white"] CGImage];
    
    
    //snowEmitter.shadowColor = [[UIColor grayColor] CGColor];
    snowEmitter.emitterCells = [NSArray arrayWithObjects:snowflake,nil];
    [self.view.layer insertSublayer:snowEmitter atIndex:0];
}



@end
