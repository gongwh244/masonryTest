//
//  SonViewController.m
//  masonryTest
//
//  Created by gong on 16/12/16.
//  Copyright © 2016年 ches. All rights reserved.
//

#import "SonViewController.h"

@interface SonViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTable;

@end

@implementation SonViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self makeTable];
}

- (void)makeTable{
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    self.myTable.tableFooterView = ({
        UIView *view = [[UIView alloc] init];
        view;
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dicArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSDictionary *dic = self.dicArray[indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"titleName"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dic = self.dicArray[indexPath.row];
    NSLog(@"className = %@",[dic objectForKey:@"className"]);
    id myObj = [[NSClassFromString([dic objectForKey:@"className"]) alloc] init];
    
    [self.navigationController pushViewController:myObj animated:YES];
}


@end
