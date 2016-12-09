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

@interface MyTableViewController ()

@property (nonatomic,copy)NSArray *dataArray;

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"RootVC";
    _dataArray = @[@"base",@"update",@"remake",@"constant",@"martin",@"array",@"scroll",@"hide",@"emitter",@"video",@"custom Camra",@"custom AVPlayer"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:100];
    label.text = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *vc = (ViewController *)[storyBoard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        updataViewController *vc = [[updataViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        remakeViewController *vc = [[remakeViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        constantViewController *vc = [constantViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        marginViewController *vc = [marginViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 5){
        arrayViewController *vc = [arrayViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 6){
        scrollViewController *vc = [scrollViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 7){
        hideViewController *vc = [hideViewController new];
        vc.title = _dataArray[indexPath.row];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 8){
        emitterViewController *vc = [[emitterViewController alloc] init];
        vc.title = _dataArray[indexPath.row];
        vc.view.backgroundColor = [UIColor redColor];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 9){
        mainViewController *vc = [[mainViewController alloc] init];
        vc.title = _dataArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }else if(indexPath.row == 10){
        customCamraViewController *vc = [[customCamraViewController alloc] init];
        vc.title = _dataArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 11){
        customAVPlayerViewController *vc = [[customAVPlayerViewController alloc] init];
        vc.title = _dataArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
