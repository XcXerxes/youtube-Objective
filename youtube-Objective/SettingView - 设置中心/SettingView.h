//
//  SettingView.h
//  youtube-Objective
//
//  Created by Antony x on 2018/11/28.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingView : UIView
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIView *bgView;
@property (nonatomic, copy) NSLayoutConstraint *tableViewBottomConstraint;
@end

NS_ASSUME_NONNULL_END
