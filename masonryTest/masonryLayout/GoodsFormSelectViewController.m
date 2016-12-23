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
    
    
    

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    UITapGestureRecognizer *gg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hehe)];
    [view addGestureRecognizer:gg];
}

- (void)hehe{
    NSLog(@"999");
    [self.view removeFromSuperview];
}



- (void)showFormsSelectViewController{
    
    self.view.frame = CGRectMake(0, 0, Screen_width, Screen_height);
    UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    [window addSubview:self.view];
    self.view.hidden = YES;
    
    [UIView animateWithDuration:1 animations:^{
        
        self.view.backgroundColor = [UIColor colorWithRed:51.0f/255 green:51.0f/255 blue:51.0f/255 alpha:0.6f];
        self.view.hidden = NO;
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismissFormsSelectViewController{
    
    [UIView animateWithDuration:1 animations:^{
        
        self.view.backgroundColor = [UIColor colorWithRed:51.0f/255 green:51.0f/255 blue:51.0f/255 alpha:0];
        self.view.hidden = YES;
        
    } completion:^(BOOL finished) {
        self.view.hidden = YES;
        [self.view removeFromSuperview];
    }];
}



@end
