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
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    _dataArray = [NSArray arrayWithContentsOfFile:plistPath];
    self.tableView.tableFooterView = ({
        UIView *view = [[UIView alloc] init];
        view;
    });
    
    
    [self timeTest];
}



- (void)timeTest{
    
    NSString *time1 = @"2016-12-22 22:30:00";
    NSString *time2 = @"2016-12-21 22:30:30";
    
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *toDate = [dateFormatter dateFromString:time1];
//    NSDate *fromDate = [NSDate date];
    NSDate *fromDate = [dateFormatter dateFromString:time2];
    
    
    
    
    NSDateComponents *secondComp = [gregorian components:NSCalendarUnitSecond fromDate:fromDate toDate:toDate options:0];
    NSDateComponents *minuteComp = [gregorian components:NSCalendarUnitMinute fromDate:fromDate toDate:toDate options:0];
    NSDateComponents *hourComp = [gregorian components:NSCalendarUnitHour fromDate:fromDate toDate:toDate options:0];
    
    NSLog(@"second = %ld",secondComp.second);
    NSLog(@"minute = %ld",minuteComp.minute);
    NSLog(@"hour = %ld",hourComp.hour);
    
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
