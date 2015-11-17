//
//  remakeViewController.m
//  masonryTest
//
//  Created by ches on 15/11/17.
//  Copyright © 2015年 ches. All rights reserved.
//

#import "remakeViewController.h"
#import "Masonry.h"

@interface remakeViewController ()

@end

@implementation remakeViewController{
    UIButton *_btn;
    BOOL _isTop;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"remake";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}

- (void)initUI{
    _isTop = YES;
    _btn = [[UIButton alloc] init];
    _btn.backgroundColor = [UIColor redColor];
    [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(100));
        make.height.equalTo(@(100));
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top);
    }];
}

- (void)btnClick{
    
    if (_isTop) {
        [_btn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(200));
            make.height.equalTo(@(200));
            make.right.equalTo(self.view.mas_right);
            make.bottom.equalTo(self.view.mas_bottom);
        }];
        _isTop = NO;
    }else{
        [_btn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(100));
            make.height.equalTo(@(100));
            make.left.equalTo(self.view.mas_left);
            make.top.equalTo(self.view.mas_top);
        }];
        _isTop = YES;
    }
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
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
