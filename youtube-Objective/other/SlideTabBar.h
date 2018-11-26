//
//  SlideTabBar.h
//  youtube-Objective
//
//  Created by Antony x on 2018/11/26.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SlideTabBar : UIView
-(void) setImageNames:(NSArray<NSString *> *)imageNames tabIndex:(NSInteger)tabIndex;
@end

NS_ASSUME_NONNULL_END
