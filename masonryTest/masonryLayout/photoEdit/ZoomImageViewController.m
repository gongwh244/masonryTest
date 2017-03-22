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
@property (nonatomic,strong) UIImageView *zoomImageView1;

@property (nonatomic,strong) UIImage *image;

@property (nonatomic,strong) UIView *headView;



@end

@implementation ZoomImageViewController

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

- (void)backAction{
    
//    [self.mainScrollView removeFromSuperview];
//    [self.headView removeFromSuperview];
//    [[[UIApplication sharedApplication] keyWindow] setWindowLevel:UIWindowLevelNormal];
    [self.navigationController popViewControllerAnimated:YES];
}


- (UIScrollView *)mainScrollView{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.frame = [UIScreen mainScreen].bounds;
        _mainScrollView.backgroundColor = [UIColor blackColor];
        _mainScrollView.maximumZoomScale = 2.0;
        _mainScrollView.minimumZoomScale = 1.0;
        _mainScrollView.delegate = self;
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.contentSize = CGSizeMake(self.zoomImageView.frame.size.width * 2, self.zoomImageView.frame.size.height);
        [_mainScrollView addSubview:self.zoomImageView];
        [_mainScrollView addSubview:self.zoomImageView1];
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleAction:)];
        doubleTap.numberOfTapsRequired = 2;
        [_mainScrollView addGestureRecognizer:doubleTap];
    }
    return _mainScrollView;
}

- (void)doubleAction:(UITapGestureRecognizer *)tap{
    CGFloat scale = self.mainScrollView.zoomScale;
    if (scale == 1.0f) {
        scale = 2.0f;
    }else if(scale == 2.0f){
        scale = 1.0f;
    }else{
        scale = 2.0f;
    }
    [self.mainScrollView setZoomScale:scale animated:YES];
}

- (UIImageView *)zoomImageView{
    if (!_zoomImageView) {
        _zoomImageView = [[UIImageView alloc] initWithImage:self.image];
        _zoomImageView.contentMode = UIViewContentModeScaleAspectFit;
        _zoomImageView.frame = CGRectMake(0, 0, Screen_width, Screen_width*(self.image.size.height/self.image.size.width));
    }
    return _zoomImageView;
}

- (UIImageView *)zoomImageView1{
    if (!_zoomImageView1) {
        _zoomImageView1 = [[UIImageView alloc] initWithImage:self.image];
        _zoomImageView1.contentMode = UIViewContentModeScaleAspectFit;
        _zoomImageView1.frame = CGRectMake(Screen_width, 0, Screen_width, Screen_width*(self.image.size.height/self.image.size.width));
    }
    return _zoomImageView1;
}

- (UIImage *)image{
    if (!_image) {
        _image = [UIImage imageNamed:@"123.jpg"];
    }
    return _image;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"ZoomImage";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
//    [[[UIApplication sharedApplication] keyWindow] addSubview:self.mainScrollView];
//    [[[UIApplication sharedApplication] keyWindow] addSubview:self.headView];
//    [[[UIApplication sharedApplication] keyWindow] setWindowLevel:UIWindowLevelStatusBar];// 设置WindowLevel与状态栏平级，起到隐藏状态栏的效果
    [self.view addSubview:self.mainScrollView];
    [self.view addSubview:self.headView];
    
//    self.zoomImageView.center = self.mainScrollView.center;
//    self.zoomImageView1.center = self.mainScrollView.center;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return self.zoomImageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    NSLog(@"x = %f",scrollView.center.x);
    NSLog(@"y = %f",scrollView.center.y);
    CGFloat xcenter = scrollView.center.x , ycenter = scrollView.center.y;
    //目前contentsize的width是否大于原scrollview的contentsize，如果大于，设置imageview中心x点为contentsize的一半，
//    以固定imageview在该contentsize中心。如果不大于说明图像的宽还没有超出屏幕范围，可继续让中心x点为屏幕中点，此种情况确保图像在屏幕中心。
    xcenter = scrollView.contentSize.width > scrollView.frame.size.width ? scrollView.contentSize.width/2 : xcenter;
    ycenter = scrollView.contentSize.height > scrollView.frame.size.height ? scrollView.contentSize.height/2 : ycenter;
    [self.zoomImageView setCenter:CGPointMake(xcenter, ycenter)];
    
}


@end
