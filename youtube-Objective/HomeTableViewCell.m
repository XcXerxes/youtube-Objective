//
//  HomeTableViewCell.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/28.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "Constants.h"
#import "Masonry.h"

@interface HomeTableViewCell ()
@property (nonatomic, strong) UIImageView *thumbImageView;
@property (nonatomic, strong) UILabel *durationLabel;
@property (nonatomic, strong) UIImageView *channelImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *channelLabel;
@property (nonatomic, strong) UILabel *showViewLabel;
@property (nonatomic, strong) UIView *containerView;
@end

@implementation HomeTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self initSubViews];
}

-(void) initSubViews {
    _containerView = [[UIView alloc] initWithFrame:self.bounds];
    [self.contentView addSubview:_containerView];
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.contentView);
    }];
    // 初始化缩略图
    [self initThumbView];
    // 初始化信息数据
    [self initInfoView];
}
- (void) initThumbView {
    // 缩略图
    _thumbImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Neural Network that Changes Everything - Computerphile"]];
    [_containerView addSubview:_thumbImageView];
    __weak typeof(self) wself = self;
    [_thumbImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(wself.containerView).inset(15);
        make.top.equalTo(wself.containerView).offset(15);
        make.width.mas_equalTo(wself.bounds.size.width - 30);
        make.height.mas_equalTo(193);
    }];
    // 视频时间
    _durationLabel = [UILabel new];
    _durationLabel.text = @"03:50";
    _durationLabel.textColor = ColorWhite;
    _durationLabel.font = [UIFont systemFontOfSize:12.0];
    _durationLabel.backgroundColor = ColorWhiteAlpha60;
    [_containerView addSubview:_durationLabel];
    [_durationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(wself.thumbImageView.mas_bottom).inset(10);
        make.right.mas_equalTo(wself.thumbImageView.mas_right).inset(10);
    }];
}
- (void) initInfoView {
    // 设置发布者头像
    _channelImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"channel2"]];
    [_containerView addSubview:_channelImageView];
    // 设置圆角图片
    _channelImageView.layer.cornerRadius = 24;
    _channelImageView.layer.masksToBounds = YES;
    // 设置位置大小
    __weak typeof(self) wself = self;
    [_channelImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wself.thumbImageView.mas_bottom).offset(15);
        make.left.equalTo(wself.thumbImageView);
        make.width.height.mas_equalTo(48);
    }];
    
    // 设置标题
    _titleLabel = [UILabel new];
    _titleLabel.text = @"What Does Jared Kushner Believe";
    _titleLabel.textColor = ColorBlack;
    _titleLabel.font = [UIFont systemFontOfSize:17];
    _titleLabel.numberOfLines = 0;
    [_containerView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wself.channelImageView.mas_top).inset(2);
        make.left.mas_equalTo(wself.channelImageView.mas_right).offset(6);
        make.right.mas_equalTo(wself.thumbImageView.mas_right);
    }];
    
    // 设置订阅者名称
    _channelLabel = [UILabel new];
    _channelLabel.text = @"Nerdwriter1";
    _channelLabel.textColor = ColorThemeGray;
    _channelLabel.font = [UIFont systemFontOfSize:13];
    [_containerView addSubview:_channelLabel];
    [_channelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(wself.channelImageView).inset(2);
        make.left.equalTo(wself.titleLabel);
    }];
    
    // 观看次数
    _showViewLabel = [UILabel new];
    _showViewLabel.text = @"229558";
    _showViewLabel.textColor = ColorThemeGray;
    _showViewLabel.font = [UIFont systemFontOfSize:13];
    [_containerView addSubview:_showViewLabel];
    [_showViewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(wself.channelLabel);
        make.left.mas_equalTo(wself.channelLabel.mas_right).offset(10);
    }];
}
- (void)initData:(Video *)videoInfo {
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
