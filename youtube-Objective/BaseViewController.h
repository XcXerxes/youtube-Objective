//
//  BaseViewController.h
//  youtube-Objective
//
//  Created by xiacan on 2018/11/27.
//  Copyright © 2018 Antony x. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

// 设置导航背景是否透明
-(void) setNavigationBarTransparent;
// 设置导航背景色
-(void) setNavigationBarBackgroundColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
