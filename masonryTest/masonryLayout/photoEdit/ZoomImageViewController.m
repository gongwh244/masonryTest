//
//  ZoomImageViewController.m
//  masonryTest
//
//  Created by gong on 17/3/21.
//  Copyright © 2017年 ches. All rights reserved.
//

#import "ZoomImageViewController.h"

@interface ZoomImageViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *mainScrollView;
@property (nonatomic,strong) UIImageView *zoomImageView;
@property (nonatomic,strong) UIView *headView;

@end

@implementation ZoomImageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"ZoomImage";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    
    [self.view addSubview:self.mainScrollView];
    [self.view addSubview:self.headView];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width,64)];
        _headView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 64, 50)];
        [btn setTitle:@"back" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        [_headView addSubview:btn];
    }
    return _headView;
}

- (void)doubleTapAction:(UITapGestureRecognizer *)tap{
    
    CGFloat newScale = self.mainScrollView.zoomScale * 1.5;//zoomScale这个值决定了contents当前扩展的比例
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[tap locationInView:tap.view]];
    [self.mainScrollView zoomToRect:zoomRect animated:YES];
}

- (CGRect)zoomRectForScale:(CGFloat)scale withCenter:(CGPoint)center{
    
    CGRect zoomRect;
    zoomRect.size.height = self.mainScrollView.frame.size.height / scale;
    NSLog(@"zoomRect.size.height is %f",zoomRect.size.height);
    NSLog(@"self.frame.size.height is %f",self.mainScrollView.frame.size.height);
    zoomRect.size.width  = self.mainScrollView.frame.size.width  / scale;
    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    return zoomRect;
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIImageView *)zoomImageView{
    if (!_zoomImageView) {
        _zoomImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height)];
        _zoomImageView.image = [UIImage imageNamed:@"123.jpg"];
        _zoomImageView.contentMode = UIViewContentModeScaleAspectFit;
        _zoomImageView.center = CGPointMake(Screen_width/2, Screen_height/2);
    }
    return _zoomImageView;
}

- (UIScrollView *)mainScrollView{
    
    if (!_mainScrollView) {
        
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height)];
        _mainScrollView.delegate = self;
        _mainScrollView.userInteractionEnabled = YES;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.backgroundColor = [UIColor blackColor];
        [_mainScrollView addSubview:self.zoomImageView];
        [_mainScrollView setMinimumZoomScale:0.5f];
        [_mainScrollView setMaximumZoomScale:2.0f];
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapAction:)];
        doubleTap.numberOfTapsRequired = 2;
        [_mainScrollView addGestureRecognizer:doubleTap];
    }
    return _mainScrollView;
}


#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return self.zoomImageView;
}

//当滑动结束时

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    
    //把当前的缩放比例设进ZoomScale，以便下次缩放时实在现有的比例的基础上
    NSLog(@"scale is %f",scale);
//    [self.mainScrollView setZoomScale:scale animated:NO];
//    self.zoomImageView.center = CGPointMake(self.mainScrollView.contentSize.width/2, self.mainScrollView.contentSize.height/2);
}


@end
