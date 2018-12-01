//
//  PlayerView.h
//  youtube-Objective
//
//  Created by Antony x on 2018/11/29.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMPlayer.h"
NS_ASSUME_NONNULL_BEGIN
@class WMPlayer;
@interface PlayerView : UIView
@property WMPlayer *wmPlayer;
@end

NS_ASSUME_NONNULL_END
