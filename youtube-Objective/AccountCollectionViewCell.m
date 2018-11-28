//
//  AccountCollectionViewCell.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/28.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "AccountCollectionViewCell.h"
#import "Constants.h"
#import "Masonry.h"

@implementation AccountCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

-(void) initSubViews {
    _iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"History"]];
    [self.contentView addSubview:_iconView];
    __weak typeof(self) wself = self;
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(wself.contentView).inset(15);
        make.left.equalTo(wself.contentView).offset(10);
        make.width.height.mas_offset(21);
    }];
    
    // 标题
    _titleLabel = [UILabel new];
    _titleLabel.text = @"History";
    _titleLabel.textColor = ColorBlack;
    _titleLabel.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself.iconView.mas_right).offset(10);
        make.centerY.equalTo(wself.iconView);
        make.right.mas_equalTo(wself.contentView.mas_right).inset(10);
    }];
    // 下边框
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = ColorThemeGray;
    [self.contentView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(wself.contentView.mas_bottom);
        make.left.right.equalTo(wself.contentView).inset(5);
        make.height.mas_offset(.5);
        make.width.mas_offset(wself.contentView.bounds.size.width - 10);
    }];
}
- (void)initData:(NSDictionary *)info {
    
}
@end
