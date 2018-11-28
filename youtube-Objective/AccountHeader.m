//
//  AccountHeader.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/28.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "AccountHeader.h"
#import "Masonry.h"
#import "Constants.h"

@implementation AccountHeader
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}
-(void) initSubViews {
    // 背景图
    _bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banner"]];
    [self addSubview:_bgImageView];
    __weak typeof(self) wself = self;
    [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(wself);
    }];
    // 头像
    _avatarImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"profilePic"]];
    _avatarImageView.layer.cornerRadius = 25;
    _avatarImageView.layer.masksToBounds = YES;
    [self addSubview:_avatarImageView];
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(wself.bgImageView);
        make.left.equalTo(wself.bgImageView).inset(15);
        make.height.width.mas_offset(50);
    }];
    // 用户名
    _userNameLabel = [UILabel new];
    _userNameLabel.text = @"Haik Aslanyan";
    _userNameLabel.textColor = ColorWhite;
    [self addSubview:_userNameLabel];
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wself.avatarImageView);
        make.top.mas_equalTo(wself.avatarImageView.mas_bottom).offset(8);
    }];
}
@end
