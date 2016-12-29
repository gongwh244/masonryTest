//
//  GoodsFormSelectViewController.m
//  masonryTest
//
//  Created by gong on 16/12/23.
//  Copyright © 2016年 ches. All rights reserved.
//

#import "GoodsFormSelectViewController.h"

@interface GoodsFormSelectViewController ()

@end

@implementation GoodsFormSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [btn setTitle:@"abc" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(hehe) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(110, 0, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hehe)];
    [redView addGestureRecognizer:tap];
}

- (void)hehe{
    NSLog(@"999");
}




@end
