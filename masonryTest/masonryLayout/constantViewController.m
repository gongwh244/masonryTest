//
//  constantViewController.m
//  masonryTest
//
//  Created by ches on 15/11/18.
//  Copyright © 2015年 ches. All rights reserved.
//

#import "constantViewController.h"
#import "Masonry.h"

@interface constantViewController ()

@end

@implementation constantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"constant";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUI];
}

- (void)setUI{
    
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blackView = [UIView new];
    blackView.backgroundColor = [UIColor blackColor];
    [redView addSubview:blackView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.left.equalTo(@20);
        make.bottom.equalTo(@-20);
        make.right.equalTo(@-20);
    }];
    
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@50);
        make.left.equalTo(@50);
        make.bottom.equalTo(@-50);
        make.right.equalTo(@-50);
    }];
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
