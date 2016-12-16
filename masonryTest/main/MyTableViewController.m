//
//  MyTableViewController.m
//  masonryTest
//
//  Created by ches on 15/11/4.
//  Copyright © 2015年 ches. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>

#import "MyTableViewController.h"
#import "ViewController.h"
#import "updataViewController.h"
#import "remakeViewController.h"
#import "constantViewController.h"
#import "marginViewController.h"
#import "arrayViewController.h"
#import "scrollViewController.h"
#import "hideViewController.h"
#import "emitterViewController.h"
#import "mainViewController.h"
#import "customCamraViewController.h"
#import "customAVPlayerViewController.h"

#import "SonViewController.h"

@interface MyTableViewController ()

@property (nonatomic,copy)NSArray *dataArray;

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"RootVC";
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    _dataArray = [NSArray arrayWithContentsOfFile:plistPath];
    self.tableView.tableFooterView = ({
        UIView *view = [[UIView alloc] init];
        view;
    });
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSDictionary *dic = _dataArray[indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"totalName"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dic = _dataArray[indexPath.row];
    SonViewController *vc = [[SonViewController alloc] init];
    vc.title = [dic objectForKey:@"totalName"];
    vc.dicArray = [dic objectForKey:@"array"];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
