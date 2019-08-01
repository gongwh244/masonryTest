//
//  WeiboCell.h
//  masonryTest
//
//  Created by gong on 17/2/10.
//  Copyright © 2017年 ches. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiBoModel.h"
typedef void (^ReloadDataBlock)(void);

@interface WeiboCell : UITableViewCell

+ (WeiboCell *)cellWithTableView:(UITableView *)tableView;

- (void)refreshCellWithData:(WeiBoModel *)model;

- (CGFloat)cellHeightWithModel:(WeiBoModel *)model;

@property (nonatomic,copy) ReloadDataBlock myBlock;

@end
