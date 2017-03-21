//
//  PhotoEditViewController.m
//  masonryTest
//
//  Created by gong on 17/3/21.
//  Copyright © 2017年 ches. All rights reserved.
//

#import "PhotoEditViewController.h"
#import "ZoomImageViewController.h"

@interface PhotoEditViewController ()

@end

@implementation PhotoEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"PhotoEdit";
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
    [btn setTitle:@"enter" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(enterClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)enterClick{
    ZoomImageViewController *vc = [[ZoomImageViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
