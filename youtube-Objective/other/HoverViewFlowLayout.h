//
//  HoverViewFlowLayout.h
//  youtube-Objective
//
//  Created by Antony x on 2018/11/27.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HoverViewFlowLayout : UICollectionViewFlowLayout
@property (nonatomic, assign) CGFloat topHeight;
// 重写 top 的高度
- (instancetype)initWithTopHeight:(CGFloat)height;
@end

NS_ASSUME_NONNULL_END
