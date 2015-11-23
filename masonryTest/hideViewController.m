//
//  hideViewController.m
//  masonryTest
//
//  Created by ches on 15/11/23.
//  Copyright © 2015年 ches. All rights reserved.
//
#define POD             10
#import "hideViewController.h"
#import "UIColor+randomColor.h"
#import "Masonry.h"

@interface hideViewController ()

@property (nonatomic,strong) UIView *boseView;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *label;

@end

@implementation hideViewController

- (void)viewDidLoad{
    
    self.index = arc4random()%2;
    [self layoutBaseView];
    [self layoutImageView];
    [self initTimer];
}

- (void)initTimer{
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(refreshUI) userInfo:nil repeats:YES];
    [timer fire];
    
}


- (void)layoutBaseView{
    
    _boseView = [[UIView alloc] init];
    _boseView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_boseView];
    [_boseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.height.equalTo(@300);
    }];
}


- (void)layoutImageView{
    
    _imageView = [UIImageView new];
    _imageView.image = [UIImage imageNamed:@"123.jpg"];
    _imageView.userInteractionEnabled = YES;
    [_boseView addSubview:_imageView];
    
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [_imageView addGestureRecognizer:gr];
    
    _label = [UILabel new];
    _label.backgroundColor = [UIColor redColor];
    _label.hidden = _index == 0 ? YES : NO;
    _label.text = @"阿里开始的减肥拉克丝的积分卡拉斯的积分卡拉斯阿拉山口的积分卡洛斯的积分卡上";
    [_boseView addSubview:_label];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_boseView).offset(POD);
        make.leading.equalTo(_boseView).offset(POD);
        make.trailing.equalTo(_boseView).offset(-POD);
        make.bottom.equalTo((_index == 0 ? _boseView : _label.mas_top)).offset(-POD);
    }];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_boseView).offset(POD);
        make.bottom.equalTo(_boseView).offset(-POD);
        make.trailing.equalTo(_boseView).offset(-POD);
        make.height.equalTo(@(arc4random()%100));
    }];
}

- (void)tapClick{
    [self refreshUI];
}

- (void)refreshUI{
    
    self.index = arc4random()%2;
    
    [_imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_boseView).offset(POD);
        make.leading.equalTo(_boseView).offset(POD);
        make.trailing.equalTo(_boseView).offset(-POD);
        make.bottom.equalTo((_index == 0 ? _boseView : _label.mas_top)).offset(-POD);
    }];
    [_label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_boseView).offset(POD);
        make.bottom.equalTo(_boseView).offset(-POD);
        make.trailing.equalTo(_boseView).offset(-POD);
        make.height.equalTo(@(arc4random()%100));
    }];
    
    _label.hidden = _index == 0 ? YES : NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        _boseView.backgroundColor = [UIColor randomColor];
        [self.view layoutIfNeeded];
    }];
}


@end
