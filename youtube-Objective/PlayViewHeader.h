//
//  PlayViewHeader.h
//  youtube-Objective
//
//  Created by Antony x on 2018/11/29.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlayViewHeader : UICollectionReusableView
// 视频标题
@property (nonatomic, strong) UILabel *titleLabel;
// 视频观看数量
@property (nonatomic, strong) UILabel *showLabel;
// 点赞
@property (nonatomic, strong) UIButton *likeBtn;
// 吐槽
@property (nonatomic, strong) UIButton *dislikeBtn;

// 视频发布者名称
@property (nonatomic, strong) UILabel *subLabel;
// 订阅数量
@property (nonatomic, strong) UILabel *subscribersNumLabel;
// 发布者头像
@property (nonatomic, strong) UIImageView *subImageView;

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UIView *spliteView;
@end

NS_ASSUME_NONNULL_END
