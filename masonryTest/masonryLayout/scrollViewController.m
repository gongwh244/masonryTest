//
//  scrollViewController.m
//  masonryTest
//
//  Created by ches on 15/11/23.
//  Copyright © 2015年 ches. All rights reserved.
//

#import "scrollViewController.h"
#import "Masonry.h"
#import "UIColor+randomColor.h"

@interface scrollViewController ()

@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation scrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"scroll";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self scrollView];
}


- (UIScrollView *)scrollView{
    
    if (!_scrollView) {
        
        _scrollView = [UIScrollView new];
        _scrollView.pagingEnabled = YES;
        [self.view addSubview:_scrollView];
        
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.leading.equalTo(self.view);
            make.trailing.equalTo(self.view);
            make.height.equalTo(@200);
        }];
        
        UIView *contentView = [[UIView alloc] init];
        [_scrollView addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_scrollView);
            make.height.equalTo(@200);
        }];
        
        UIView *lastView;
        for (int i = 0; i < 3; i++) {
            
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor randomColor];
            [contentView addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(contentView);
                make.leading.equalTo((lastView ? lastView.mas_trailing : @0));
                make.height.equalTo(contentView);
                make.width.equalTo(_scrollView);
            }];
            lastView = view;
        }
        
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(lastView.mas_trailing);
        }];
    }
    return _scrollView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
