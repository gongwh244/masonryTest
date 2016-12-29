//
//  FormSelectSheet.m
//  masonryTest
//
//  Created by gong on 16/12/29.
//  Copyright © 2016年 ches. All rights reserved.
//

#import "FormSelectSheet.h"
#import "GoodsFormSelectViewController.h"

@interface FormSelectSheet ()

@property (nonatomic,strong) UIView *rootView;

@end

@implementation FormSelectSheet

- (instancetype)init{
    
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (UIView *)rootView{
    if (!_rootView) {
        _rootView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
    }
    return _rootView;
}

- (void)showSheet{
    
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    [window addSubview:self.rootView];
    GoodsFormSelectViewController *vc = [[GoodsFormSelectViewController alloc] init];
    vc.view.frame = CGRectMake(0, Screen_height * 0.5, Screen_width, Screen_height);
    [self.rootView addSubview:vc.view];
    [window addSubview:self.rootView];
//    [UIView animateWithDuration:0.3 animations:^{
//        
//        vc.view.backgroundColor = [UIColor colorWithRed:51.0f/255 green:51.0f/255 blue:51.0f/255 alpha:0.6f];
//        vc.view.frame = CGRectMake(0, 0, Screen_width, Screen_height);
//        
//    } completion:^(BOOL finished) {
//        
//    }];
}

- (void)dismissSheet{
    
}

@end
