//
//  MyTableViewController.m
//  masonryTest
//
//  Created by ches on 15/11/4.
//  Copyright © 2015年 ches. All rights reserved.
//

#import "MyTableViewController.h"
#import "ViewController.h"
#import "updataViewController.h"
#import "remakeViewController.h"
#import "constantViewController.h"
#import "marginViewController.h"
#import "arrayViewController.h"

@interface MyTableViewController ()

@property (nonatomic,copy)NSArray *dataArray;

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"RootVC";
    _dataArray = @[@"base",@"update",@"remake",@"constant",@"martin",@"array"];
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
    }
}


@end
