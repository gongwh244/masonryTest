//
//  PhotoEditViewController.m
//  masonryTest
//
//  Created by gong on 17/3/21.
//  Copyright © 2017年 ches. All rights reserved.
//

#import "PhotoEditViewController.h"
#import "ZoomImageViewController.h"
#import "WZLBadgeImport.h"
@interface PhotoEditViewController ()

@property (nonatomic,strong) UIBarButtonItem *item;
@property (nonatomic,strong) UIButton *btn;

@end

@implementation PhotoEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"PhotoEdit";
    
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
    self.btn.layer.borderWidth = 1.0f;
    self.btn.layer.borderColor = [UIColor grayColor].CGColor;
    [self.btn setTitle:@"enter" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(changge) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
    self.item = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStyleBordered target:self action:@selector(enterClick)];
    [self.navigationItem setRightBarButtonItem:self.item];
}

- (void)enterClick{
    //ZoomImageViewController *vc = [[ZoomImageViewController alloc] init];
    //[self.navigationController pushViewController:vc animated:YES];
    
    [self.item clearBadge];
    [self.btn clearBadge];
}

- (void)changge{
    
    [self.item showBadgeWithStyle:WBadgeStyleRedDot value:1 animationType:WBadgeAnimTypeNone];
    [self.btn showBadgeWithStyle:WBadgeStyleRedDot value:1 animationType:WBadgeAnimTypeNone];
    self.item.badgeFrame = CGRectMake(10, 0, 8, 8);
    self.item.badgeBgColor = [UIColor greenColor];
}

@end
