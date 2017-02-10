//
//  WeiboCell.m
//  masonryTest
//
//  Created by gong on 17/2/10.
//  Copyright © 2017年 ches. All rights reserved.
//

#import "WeiboCell.h"
#import "WeiBoModel.h"

@interface WeiboCell ()

@property (nonatomic,strong)UILabel *myLabel;

@end

@implementation WeiboCell

+ (WeiboCell *)cellWithTableView:(UITableView *)tableView{
    
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (nil == cell) {
        cell = [[WeiboCell alloc] init];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UILabel *)myLabel{
    if (!_myLabel) {
        _myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Screen_width, 144)];
        _myLabel.backgroundColor = [UIColor yellowColor];
        _myLabel.font = [UIFont systemFontOfSize:14];
        _myLabel.numberOfLines = 0;
    }
    return _myLabel;
}

- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        [self addSubview:self.myLabel];
    }
    return self;
}

- (void)refreshCellWithData:(WeiBoModel *)model{
    self.myLabel.text = [NSString stringWithFormat:@"userId = %@;weiboId = %@;userName = %@;imageUrl = %@;date = %@;text = %@;",model.userId,model.weiboId,model.userName,model.imageUrl,model.date,model.text];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
