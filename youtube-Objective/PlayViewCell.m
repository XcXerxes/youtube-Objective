//
//  PlayViewCell.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/29.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "PlayViewCell.h"
#import "Constants.h"
#import "Masonry.h"

@interface PlayViewCell()
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@end

@implementation PlayViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

-(void) initSubViews {
    _leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"What Does Jared Kushner Believe"]];
    _leftImageView.layer.cornerRadius = 3;
    _leftImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_leftImageView];
    __weak typeof(self) wself = self;
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(wself.contentView).inset(18);
        make.left.equalTo(wself.contentView).offset(10);
        make.height.mas_equalTo(70);
        make.width.mas_equalTo(124);
    }];
    _titleLabel = [UILabel new];
    _titleLabel.text = @"WhatDoesJaredKushnerBelieve";
    _titleLabel.textColor = ColorBlack;
    _titleLabel.numberOfLines = 2;
    _titleLabel.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself.leftImageView.mas_right).offset(15);
        make.top.equalTo(wself.contentView).inset(18);
        make.right.mas_equalTo(wself.contentView.mas_right).inset(10);
    }];
    
    _subTitleLabel = [UILabel new];
    _subTitleLabel.text = @"Seeker";
    _subTitleLabel.textColor = ColorThemeGray;
    _subTitleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_subTitleLabel];
    [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(wself.titleLabel);
        make.top.mas_equalTo(wself.titleLabel.mas_bottom).offset(5);
    }];
    
    UIView *spliteView = [UIView new];
    spliteView.backgroundColor = ColorThemeGray;
    spliteView.alpha = .2;
    [self.contentView addSubview:spliteView];
    [spliteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(wself.contentView);
        make.height.mas_equalTo(.5);
        make.width.top.equalTo(wself.contentView);
    }];
}
@end
