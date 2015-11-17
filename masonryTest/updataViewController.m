//
//  updataViewController.m
//  masonryTest
//
//  Created by ches on 15/11/17.
//  Copyright © 2015年 ches. All rights reserved.
//
#define SCREEN_WIDTH                [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT               [UIScreen mainScreen].bounds.size.height

#import "updataViewController.h"
#import "Masonry.h"



@interface updataViewController ()

@end

@implementation updataViewController{
    UIButton *_btn;
    CGFloat _width;
    CGFloat _height;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"update";
    [self initUI];
}

- (void)initUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _width = 100;
    _height = 100;
    
    _btn = [[UIButton alloc] init];
    _btn.backgroundColor = [UIColor redColor];
    [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo([NSNumber numberWithFloat:_width]);
        make.height.equalTo([NSNumber numberWithFloat:_height]);
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
    }];
}

- (void)btnClick{
    
    
    _width = _width + SCREEN_WIDTH/3;
    _height = _height + SCREEN_HEIGHT/3;
    if (_width > SCREEN_WIDTH) {
        _width = SCREEN_WIDTH;
    }
    if (_height > SCREEN_HEIGHT) {
        _height = SCREEN_HEIGHT;
    }
    [_btn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo([NSNumber numberWithFloat:_width]);
        make.height.equalTo([NSNumber numberWithFloat:_height]);
    }];
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
