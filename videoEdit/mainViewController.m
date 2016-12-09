//
//  mainViewController.m
//  masonryTest
//
//  Created by gong on 16/11/14.
//  Copyright © 2016年 ches. All rights reserved.
//

#import "mainViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <Foundation/Foundation.h>

@interface mainViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *imageBtn;
@property (weak, nonatomic) IBOutlet UIButton *videoBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageShower;

@property (nonatomic,strong) UIImagePickerController *picker;
@property (nonatomic,strong) MPMoviePlayerController *player;
@property (nonatomic,strong) NSURL *videoUrl;
@end

@implementation mainViewController

- (MPMoviePlayerController *)player{
    if (!_player) {
        _player = [[MPMoviePlayerController alloc] init];
        _player.view.frame = CGRectMake(0, CGRectGetMaxY(self.imageShower.frame), Screen_width, 0.75 * Screen_width);
        _player.controlStyle = MPMovieControlStyleNone;
//        _player.repeatMode = MPMovieRepeatModeOne;
        //_player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:_player.view];
    }
    return _player;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:MPMoviePlayerPlaybackDidFinishNotification];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playEndNotification:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    [self initUI];
}

- (void)initUI{
    
}

- (void)makePickerViewController{
    
    self.picker = ({
        UIImagePickerController *pick = [[UIImagePickerController alloc] init];
        pick.view.backgroundColor = [UIColor orangeColor];
        pick.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pick.mediaTypes = @[(NSString *)kUTTypeMovie];
        pick.delegate = self;
        pick.allowsEditing = YES;
        pick;
    });
}

- (void)permissionCheck{
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        NSLog(@"支持相机");
    }else{
        NSLog(@"不支持相机");
        return;
    }
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        NSLog(@"支持图库");
    }else{
        NSLog(@"不支持图库");
        return;
    }
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
        NSLog(@"支持相片库");
    }else{
        NSLog(@"不支持相片库");
        return;
    }
}

- (void)playEndNotification:(NSNotification *)noti{
    NSLog(@"nooooo");
    [self.player.view removeFromSuperview];
    self.player = nil;
}

- (IBAction)imageClick:(id)sender {
    [self permissionCheck];
    [self makePickerViewController];
    
    [self presentViewController:self.picker animated:YES completion:nil];
}

- (IBAction)videoClick:(id)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"WeChatSight" ofType:@"mp4"];
//    self.videoUrl = [[NSURL alloc] initWithString:path];
    //self.videoUrl = [NSURL URLWithString:path];
    self.videoUrl = [NSURL fileURLWithPath:path];
    
//    MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc] initWithContentURL:self.videoUrl];
//    [self presentViewController:vc animated:NO completion:nil];
//    vc.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
//    [vc.moviePlayer play];
//    NSAssert(self.videoUrl, @"URL不能为空");
    self.player.contentURL = self.videoUrl;
    [self.player play];
//    [self.player setFullscreen:YES animated:YES];
}

- (UIImage *)getThumbFromUrl:(NSURL *)url{
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:url options:nil];
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    gen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *thumb = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return thumb;
}

//NSString *const  UIImagePickerControllerMediaType ;指定用户选择的媒体类型（文章最后进行扩展）
//NSString *const  UIImagePickerControllerOriginalImage ;原始图片
//NSString *const  UIImagePickerControllerEditedImage ;修改后的图片
//NSString *const  UIImagePickerControllerCropRect ;裁剪尺寸
//NSString *const  UIImagePickerControllerMediaURL ;媒体的URL
//NSString *const  UIImagePickerControllerReferenceURL ;原件的URL
//NSString *const  UIImagePickerControllerMediaMetadata;当来数据来源是照相机的时候这个值才有效
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    if ([info objectForKey:UIImagePickerControllerMediaURL]) {
        self.videoUrl = [info objectForKey:UIImagePickerControllerMediaURL];
    }
    self.imageShower.image = [self getThumbFromUrl:self.videoUrl];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}





@end
