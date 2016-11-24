//
//  customCamraViewController.m
//  masonryTest
//
//  Created by gong on 16/11/24.
//  Copyright © 2016年 ches. All rights reserved.
//

#import "customCamraViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>


@interface customCamraViewController ()

@property (nonatomic,strong)AVCaptureSession *session;
@property (nonatomic,strong)AVCaptureDeviceInput *sessionInput;
@property (nonatomic,strong)AVCaptureStillImageOutput *sessionOutput;
@property (nonatomic,strong)AVCaptureVideoPreviewLayer *sessionPreviewLayer;

@end

@implementation customCamraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initAVCaptureSession];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.session) {
        [self.session startRunning];
    }
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if (self.session) {
        [self.session stopRunning];
    }
}

- (void)initAVCaptureSession{
    
    self.session = [[AVCaptureSession alloc] init];
    NSError *error;
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    [device lockForConfiguration:nil];
    [device setFlashMode:AVCaptureFlashModeAuto];
    [device unlockForConfiguration];
    
    self.sessionInput = [[AVCaptureDeviceInput alloc] initWithDevice:device error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
    self.sessionOutput = [[AVCaptureStillImageOutput alloc] init];
    self.sessionOutput.outputSettings = @{AVVideoCodecKey:AVVideoCodecJPEG};
    
    if ([self.session canAddInput:self.sessionInput]) {
        [self.session addInput:self.sessionInput];
    }
    if ([self.session canAddOutput:self.sessionOutput]) {
        [self.session addOutput:self.sessionOutput];
    }
    
    self.sessionPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
    self.sessionPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    self.sessionPreviewLayer.frame = CGRectMake(0, 30, Screen_width, Screen_height - 64 - 30);
    self.view.layer.masksToBounds = YES;
    [self.view.layer addSublayer:self.sessionPreviewLayer];
}

- (AVCaptureVideoOrientation)avOrientationFromDeviceOrientation:(UIDeviceOrientation)deviceOri{
    
    AVCaptureVideoOrientation result = (AVCaptureVideoOrientation)deviceOri;
    if (deviceOri == UIDeviceOrientationLandscapeLeft) {
        result = AVCaptureVideoOrientationLandscapeRight;
    }else if (deviceOri == UIDeviceOrientationLandscapeRight){
        result = AVCaptureVideoOrientationLandscapeLeft;
    }
    return result;
}

- (IBAction)caputureAction:(id)sender {
    
    AVCaptureConnection *connection = [self.sessionOutput connectionWithMediaType:AVMediaTypeVideo];
    AVCaptureVideoOrientation avOri = [self avOrientationFromDeviceOrientation:[[UIDevice currentDevice] orientation]];
    connection.videoOrientation = avOri;
    connection.videoScaleAndCropFactor = 1;
    [self.sessionOutput captureStillImageAsynchronouslyFromConnection:connection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        NSData *jpegData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        CFDictionaryRef attachments = CMCopyDictionaryOfAttachments(kCFAllocatorDefault, imageDataSampleBuffer, kCMAttachmentMode_ShouldPropagate);
        ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
        if (author == ALAuthorizationStatusRestricted || author == ALAuthorizationStatusDenied) {
            return ;
        }
        ALAssetsLibrary *lib = [[ALAssetsLibrary alloc] init];
        [lib writeImageDataToSavedPhotosAlbum:jpegData metadata:(__bridge id)attachments completionBlock:^(NSURL *assetURL, NSError *error) {
            NSLog(@"write successful !!");
        }];
    }];
}

- (IBAction)saveAction:(id)sender {
}
- (IBAction)lightChangeAction:(id)sender {
}
- (IBAction)backAndFrontAction:(id)sender {
}


@end
