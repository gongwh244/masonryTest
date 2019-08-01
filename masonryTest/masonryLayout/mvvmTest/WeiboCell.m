//
//  WeiboCell.m
//  masonryTest
//
//  Created by gong on 17/2/10.
//  Copyright © 2017年 ches. All rights reserved.
//

#import "WeiboCell.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
@interface WeiboCell ()

@property (nonatomic,strong)UILabel *myLabel;
@property (nonatomic,strong) UIImageView *imgV;
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
        _myLabel = [[UILabel alloc] init];
        _myLabel.backgroundColor = [UIColor yellowColor];
        _myLabel.font = [UIFont systemFontOfSize:12];
        _myLabel.numberOfLines = 0;
    }
    return _myLabel;
}

- (UIImageView *)imgV{
    if (!_imgV) {
        _imgV = [UIImageView new];
    }
    return _imgV;
}

- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        [self.contentView addSubview:self.myLabel];
        [self.contentView addSubview:self.imgV];
        
        
        [self.myLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.equalTo(self.imgV.mas_left);
            make.bottom.mas_equalTo(-10);
        }];
        
        [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(100);
        }];
    }
    return self;
}

- (void)refreshCellWithData:(WeiBoModel *)model{
    self.myLabel.text = [NSString stringWithFormat:@"userId = %@;weiboId = %@;userName = %@;imageUrl = %@;date = %@;text = %@;",model.userId,model.weiboId,model.userName,model.imageUrl,model.date,model.text];
    
//    [self.imgV sd_setImageWithURL:model.imageUrl];
    [self.imgV sd_setImageWithURL:model.imageUrl completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"hei = %lf",image.size.width);
        
        [self.myLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.equalTo(self.imgV.mas_left);
            make.bottom.mas_equalTo(-10);
        }];
        
        [self.imgV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(image.size.width * 3);
            make.height.mas_equalTo(image.size.height * 3);
        }];
        [self layoutIfNeeded];
        if (self.myBlock) {
            self.myBlock();
        }
    }];
}

- (CGFloat)cellHeightWithModel:(WeiBoModel *)model{
    [self refreshCellWithData:model];
    [self layoutIfNeeded];
    return [self.contentView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize].height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
