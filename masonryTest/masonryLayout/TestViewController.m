//
//  TestViewController.m
//  masonryTest
//
//  Created by gong on 16/12/23.
//  Copyright © 2016年 ches. All rights reserved.
//

#import "TestViewController.h"
#import "GoodsFormSelectViewController.h"
#import <WebKit/WebKit.h>
#import "FormSelectSheet.h"

@interface TestViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic,strong) NSURLRequest *request;
@property (weak, nonatomic) IBOutlet UIWebView *myWeb;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    self.myWeb.delegate = self;
}
- (IBAction)click:(id)sender {
    NSLog(@"load");
//    self.request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.1.253:8513/"]];
    
    [self addWindows];
    
    
    
    /*
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height - 64)];
    [self.view addSubview:webView];
    webView.delegate = self;
    [webView loadRequest:self.request];
    */
}

- (void)addWindows{
    
    FormSelectSheet *sheet = [[FormSelectSheet alloc] init];
    [sheet showSheet];
    
}

#pragma mark - WebView Delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *reqString = [[[request URL] absoluteString] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    if ([reqString containsString:@"weixin://"]) {//拦截url，截取参数，
        NSArray *arr = [reqString componentsSeparatedByString:@"?"];
        NSString*valStr = arr[1];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?%@",arr[0],[self urlEncode:valStr]]]];// 对参数进行urlencode，拼接上scheme。
    }
    return YES;
}

- (NSString *)urlEncode:(NSString *)url{
    return [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

- (IBAction)clear:(id)sender {
    self.textField.text = @"";
    NSLog(@"clear");
}




@end
