//
//  AccountHeader.h
//  youtube-Objective
//
//  Created by Antony x on 2018/11/28.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountHeader : UICollectionReusableView
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@end

NS_ASSUME_NONNULL_END
