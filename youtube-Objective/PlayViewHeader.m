//
//  PlayViewHeader.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/29.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "PlayViewHeader.h"
#import "Constants.h"
#import "Masonry.h"

@implementation PlayViewHeader
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _containerView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:_containerView];
        [self initVideoView];
        [self initSubscriptionView];
    }
    return self;
}
-(void) initVideoView {
    // 标题
    _titleLabel = [UILabel new];
    _titleLabel.text = @"Big Buck Bunny";
    _titleLabel.textColor = ColorBlack;
    _titleLabel.font = [UIFont systemFontOfSize:20];
    [_containerView addSubview:_titleLabel];
    __weak typeof(self) wself = self;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(wself.containerView).inset(20);
        make.left.right.equalTo(wself.containerView).inset(20);
    }];
    // 观看次数
    _showLabel = [UILabel new];
    _showLabel.text = @"365629 views";
    _showLabel.textColor = ColorThemeGray;
    _showLabel.font = [UIFont systemFontOfSize:14];
    [_containerView addSubview:_showLabel];
    [_showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wself.titleLabel.mas_bottom).offset(10);
        make.left.right.equalTo(wself.titleLabel);
    }];
    
    // 点赞
    _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_likeBtn setImage:[UIImage imageNamed:@"thumbUp"] forState:UIControlStateNormal];
    [_likeBtn setTitle:@"746" forState:UIControlStateNormal];
    [_likeBtn setTitleColor:ColorThemeGray forState:UIControlStateNormal];
    [_likeBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 8/2, 0, 0)];
    [_likeBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -30/2, 0, 8/2)];
    [_containerView addSubview:_likeBtn];
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wself.showLabel.mas_bottom).offset(10);
        make.left.equalTo(wself.showLabel);
        make.width.mas_offset(80);
    }];
    // 吐槽
    _dislikeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_dislikeBtn setImage:[UIImage imageNamed:@"thumbDown"] forState:UIControlStateNormal];
    [_dislikeBtn setTitle:@"120" forState:UIControlStateNormal];
    [_dislikeBtn setTitleColor:ColorThemeGray forState:UIControlStateNormal];
    [_dislikeBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 8/2, 0, 0)];
    [_dislikeBtn setImageEdgeInsets:UIEdgeInsetsMake(2, -8/2, 0, 8/2)];
    [_containerView addSubview:_dislikeBtn];
    [_dislikeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(wself.likeBtn);
        make.left.mas_equalTo(wself.likeBtn.mas_right).offset(10);
        make.width.mas_offset(80);
    }];
    // 分割线
    _spliteView = [UIView new];
    _spliteView.backgroundColor = ColorThemeGray;
    _spliteView.alpha = .2;
    [_containerView addSubview:_spliteView];
    [_spliteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(wself.containerView);
        make.top.mas_equalTo(wself.dislikeBtn.mas_bottom).offset(15);
        make.height.mas_offset(.5);
        make.width.equalTo(wself.containerView);
    }];
}

-(void) initSubscriptionView {
    __weak typeof(self) wself = self;
    _subImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Blender Foundation"]];
    [_containerView addSubview:_subImageView];
    [_subImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wself.spliteView).offset(20);
        make.left.equalTo(wself.containerView).offset(15);
        make.width.height.mas_offset(40);
    }];
    _subLabel = [UILabel new];
    _subLabel.text = @"Blender Foundation";
    _subLabel.textColor = ColorBlack;
    _subscribersNumLabel.font = [UIFont systemFontOfSize:17];
    [_containerView addSubview:_subLabel];
    [_subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(wself.subImageView);
        make.left.mas_equalTo(wself.subImageView.mas_right).offset(10);
    }];
    
    _subscribersNumLabel = [UILabel new];
    _subscribersNumLabel.text = @"0 subscribers";
    _subscribersNumLabel.textColor = ColorThemeGray;
    _subscribersNumLabel.font = [UIFont systemFontOfSize:14];
    [_containerView addSubview:_subscribersNumLabel];
    [_subscribersNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wself.subLabel);
        make.bottom.equalTo(wself.subImageView);
    }];
}
@end
