//
//  ViewController.m
//  masonryTest
//
//  Created by ches on 15/11/4.
//  Copyright © 2015年 ches. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"龚伟强";
    
    
    
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *greenView = [UIView new];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    NSInteger pad = 10;
    UIView *superView = self.view;
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).offset(pad);
        make.left.equalTo(superView.mas_left).offset(pad);
        make.bottom.equalTo(blueView.mas_top).offset(-pad);
        make.right.equalTo(greenView.mas_left).offset(-pad);
        
        make.width.equalTo(greenView.mas_width);
        make.height.equalTo(blueView.mas_height);
    }];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).offset(pad);
        make.left.equalTo(redView.mas_right).offset(pad);
        make.bottom.equalTo(blueView.mas_top).offset(-pad);
        make.right.equalTo(superView.mas_right).offset(-pad);
        
        make.width.equalTo(redView.mas_width);
        make.height.equalTo(blueView.mas_height);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(redView.mas_bottom).offset(pad);
        make.left.equalTo(superView.mas_left).offset(pad);
        make.bottom.equalTo(superView.mas_bottom).offset(-pad);
        make.right.equalTo(superView.mas_right).offset(-pad);
        
        make.height.equalTo(blueView.mas_height);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
