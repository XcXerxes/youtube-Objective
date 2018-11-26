//
//  SlideViewController.h
//  youtube-Objective
//
//  Created by Antony x on 2018/11/26.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideTabBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface SlideViewController : UIViewController
@property (nonatomic, strong) UICollectionView  *collectionView;
@property (nonatomic, strong) SlideTabBar *slideTabBar;
@end

NS_ASSUME_NONNULL_END
