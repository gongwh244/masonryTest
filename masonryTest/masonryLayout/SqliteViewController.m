//
//  SqliteViewController.m
//  masonryTest
//
//  Created by gong on 2017/4/17.
//  Copyright © 2017年 ches. All rights reserved.
//

#import "SqliteViewController.h"
#import "Calculator.h"

@interface SqliteViewController ()

@property (nonatomic,strong) UIView *aniView;
@property (nonatomic,strong) UIView *aniView1;
@property (nonatomic,strong) UIButton *btn;

@property (nonatomic,strong) UILabel *showLabel;

@end

@implementation SqliteViewController

- (UILabel *)showLabel{
    if (!_showLabel) {
        _showLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 200, 100)];
        _showLabel.backgroundColor = [UIColor yellowColor];
        _showLabel.text = @"0";
        _showLabel.textAlignment = NSTextAlignmentCenter;
        _showLabel.font = [UIFont systemFontOfSize:50];
    }
    
    return _showLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Sqlite";
    
    self.aniView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    self.aniView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.aniView];
    
    self.aniView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 100, 100)];
    self.aniView1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.aniView1];
    
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
    self.btn.layer.borderWidth = 1.0f;
    self.btn.layer.borderColor = [UIColor grayColor].CGColor;
    [self.btn setTitle:@"enter" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(changge) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
    [self.view addSubview:self.showLabel];
}

- (void)changge{
    
    [self addAnimation];
}

//- (void)addAnimation{
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"position.x";
//    animation.values = @[@0, @10, @-10, @10, @0];
//    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
//    animation.duration = 0.4;
//    animation.additive = YES;
//    [self.aniView.layer addAnimation:animation forKey:@"basic"];
//}

- (void)addAnimation{
    NSInteger result = Calculator.defaultCal.jia(23).jian(12).result;
    NSLog(@"result = %ld",result);
}

@end
