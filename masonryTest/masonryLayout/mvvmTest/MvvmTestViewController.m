//
//  MvvmTestViewController.m
//  masonryTest
//
//  Created by gong on 17/2/9.
//  Copyright © 2017年 ches. All rights reserved.
//

#import "MvvmTestViewController.h"
#import "MvvmViewModel.h"
#import "WeiboCell.h"

@interface MvvmTestViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSArray *dataArr;

@property (nonatomic,strong) WeiboCell *tmpCell;
@end

@implementation MvvmTestViewController

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height - 64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"MVVM";
    self.tmpCell = [WeiboCell new];
    [self.view addSubview:self.tableView];
    [self getRequest];
}

- (void)getRequest{
    
    MvvmViewModel *viewModel = [[MvvmViewModel alloc] init];
    [viewModel setBlockWithSuccessBlock:^(id returnValue) {
        
        self.dataArr = returnValue;
        [self.tableView reloadData];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } failureBlock:^(id returnValue) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } netBlock:^(id netState) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [viewModel getWeiboList];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WeiboCell *cell = [WeiboCell cellWithTableView:tableView];
    [cell refreshCellWithData:self.dataArr[indexPath.row]];
    return cell;
}











@end
