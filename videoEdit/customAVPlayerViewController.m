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
@property (nonatomic,strong) UISlider *progressView;

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
        _playerLayer.backgroundColor = [UIColor blackColor].CGColor;
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

- (UISlider *)progressView{
    if (!_progressView) {
        _progressView = [[UISlider alloc] initWithFrame:CGRectMake(0.25 * Screen_width, 0.75 * Screen_width, 0.75 * Screen_width, 0.25 * Screen_width)];
        _progressView.backgroundColor = [UIColor blueColor];
        [_progressView addTarget:self action:@selector(sliderAction) forControlEvents:UIControlEventTouchDragInside | UIControlEventTouchUpInside];
    }
    return _progressView;
}

- (AVPlayer *)player{
    if (!_player) {
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:[NSURL fileURLWithPath:
                                                                    [[NSBundle mainBundle] pathForResource:@"WeChatSight" ofType:@"mp4"]]];
        _player = [AVPlayer playerWithPlayerItem:playerItem];
        [self addProgressObserver];
        
    }
    return _player;
}

- (void)addProgressObserver{
    AVPlayerItem *item = self.player.currentItem;
    UISlider *pro = self.progressView;
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 1.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        float current = CMTimeGetSeconds(time);
        float total = CMTimeGetSeconds(item.duration);
        NSLog(@"当前已经播放%.2fs.",current);
        if (current) {
            [pro setValue:(current/total) animated:YES];
        }
    }];
}

- (void)sliderAction{
    [self.player pause];
    [self.player seekToTime:CMTimeMake(self.progressView.value * CMTimeGetSeconds(self.player.currentItem.duration), 1.0) completionHandler:^(BOOL finished) {
        
    }];
}

#pragma mark -
#pragma mark - Play Action
- (void)playOrPause{
    
    self.playBtn.selected = !self.playBtn.selected;
    if (self.playBtn.selected) {
        [self.player play];
    }else{
        [self.player pause];
    }
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
