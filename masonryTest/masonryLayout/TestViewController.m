//
//  TestViewController.m
//  masonryTest
//
//  Created by gong on 16/12/23.
//  Copyright © 2016年 ches. All rights reserved.
//

#import "TestViewController.h"
#import "GoodsFormSelectViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    UITapGestureRecognizer *gg = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hehe)];
    [self.view addGestureRecognizer:gg];
}
- (void)hehe{
    NSLog(@"000");
}


- (IBAction)showBtnClick:(id)sender {
    
//    UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
//    GoodsFormSelectViewController *vc = [[GoodsFormSelectViewController alloc] init];
//    vc.view.frame = CGRectMake(0, 0, Screen_width, Screen_height);
//    [window addSubview:vc.view];
//    //vc.view.hidden = YES;
//    
//    [UIView animateWithDuration:1 animations:^{
//        
//        vc.view.backgroundColor = [UIColor colorWithRed:51.0f/255 green:51.0f/255 blue:51.0f/255 alpha:0.6f];
//        vc.view.hidden = NO;
//        
//    } completion:^(BOOL finished) {
//        
//    }];
    
    GoodsFormSelectViewController *vc = [[GoodsFormSelectViewController alloc] init];
    [vc showFormsSelectViewController];
    
    
}

@end
