//
//  WeiboCell.h
//  masonryTest
//
//  Created by gong on 17/2/10.
//  Copyright © 2017年 ches. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WeiBoModel;
@interface WeiboCell : UITableViewCell

+ (WeiboCell *)cellWithTableView:(UITableView *)tableView;

- (void)refreshCellWithData:(WeiBoModel *)model;

@end
