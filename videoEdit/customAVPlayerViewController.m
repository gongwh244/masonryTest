//
//  customAVPlayerViewController.m
//  masonryTest
//
//  Created by gong on 16/12/10.
//  Copyright © 2016年 ches. All rights reserved.
//

#import "customAVPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface customAVPlayerViewController ()

@property (nonatomic,strong) AVPlayer *player;

@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) AVPlayerLayer *playerLayer;
@property (nonatomic,strong) UIButton *playBtn;
@property (nonatomic,strong) UIProgressView *progressView;


@end

@implementation customAVPlayerViewController
#pragma mark -
#pragma mark - UI Layout
- (UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_width)];
        _backView.backgroundColor = [UIColor grayColor];
    }
    return _backView;
}

- (AVPlayerLayer *)playerLayer{
    if (!_playerLayer) {
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        _playerLayer.frame = CGRectMake(0, 0, Screen_width, 0.75*Screen_width);
        _playerLayer.backgroundColor = [UIColor yellowColor].CGColor;
    }
    return _playerLayer;
}

- (UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0.75 * Screen_width, 0.25 * Screen_width, 0.25 * Screen_width)];
        [_playBtn setTitle:@">" forState:UIControlStateNormal];
        _playBtn.titleLabel.font = [UIFont systemFontOfSize:40];
        [_playBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _playBtn.backgroundColor = [UIColor redColor];
        [_playBtn addTarget:self action:@selector(playOrPause) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBtn;
}

- (UIProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0.25 * Screen_width, (0.75 + 0.12) * Screen_width, 0.75 * Screen_width, 0.25 * Screen_width)];
        _progressView.backgroundColor = [UIColor blueColor];
    }
    return _progressView;
}

- (AVPlayer *)player{
    if (!_player) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"WeChatSight" ofType:@"mp4"];
        NSURL *url = [NSURL fileURLWithPath:path];
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
        _player = [AVPlayer playerWithPlayerItem:playerItem];
    }
    return _player;
}
#pragma mark -
#pragma mark - Play Action
- (void)playOrPause{
    [self.player play];
}

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
}

- (void)makeUI{
    [self.view addSubview:self.backView];
    [self.backView.layer addSublayer:self.playerLayer];
    [self.backView addSubview:self.playBtn];
    [self.backView addSubview:self.progressView];
}



@end
