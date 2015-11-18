//
//  marginViewController.m
//  masonryTest
//
//  Created by ches on 15/11/18.
//  Copyright © 2015年 ches. All rights reserved.


#import "marginViewController.h"
#import "Masonry.h"

@interface marginViewController ()

@end

@implementation marginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"martin";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUI];
}

- (void)setUI{
    
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    redView.layoutMargins = UIEdgeInsetsMake(5, 5, 5, 100);
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_topMargin);
        make.left.equalTo(self.view.mas_leftMargin);
        make.bottom.equalTo(self.view.mas_bottomMargin);
        make.right.equalTo(self.view.mas_rightMargin);
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
