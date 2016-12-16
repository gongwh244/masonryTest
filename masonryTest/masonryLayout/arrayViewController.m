//
//  arrayViewController.m
//  masonryTest
//
//  Created by ches on 15/11/20.
//  Copyright © 2015年 ches. All rights reserved.
//

#import "arrayViewController.h"
#import "Masonry.h"
#import "UIColor+randomColor.h"
@interface arrayViewController ()


@end

@implementation arrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"array";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUI];
    
}

- (void)setUI{
    
    UIButton *btn1 = [UIButton new];
    [btn1 setTitle:@"up" forState:UIControlStateNormal];
    btn1.backgroundColor = [UIColor randomColor];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton new];
    [btn2 setTitle:@"center" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor randomColor];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton new];
    [btn3 setTitle:@"down" forState:UIControlStateNormal];
    btn3.backgroundColor = [UIColor randomColor];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(btn3Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    CGFloat pod = 20;
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(pod);
        make.leading.equalTo(self.view).offset(pod);
        make.height.equalTo(@100);
        make.trailing.equalTo(btn2.mas_leading).offset(-pod);
        make.width.equalTo(@[btn2,btn3]);
    }];
    
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(pod);
        make.leading.equalTo(btn1.mas_trailing).offset(pod);
        make.height.equalTo(@100);
        make.trailing.equalTo(btn3.mas_leading).offset(-pod);
        make.width.equalTo(@[btn1,btn3]);
    }];
    
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(pod);
        make.leading.equalTo(btn2.mas_trailing).offset(pod);
        make.height.equalTo(@100);
        make.trailing.equalTo(self.view).offset(-pod);
        make.width.equalTo(@[btn2,btn1]);
    }];
    
}

- (void)btn1Action{
    
}

- (void)btn2Action{
    
}

- (void)btn3Action{
    
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
