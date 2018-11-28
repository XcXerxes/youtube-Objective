//
//  HomeTableViewCell.h
//  youtube-Objective
//
//  Created by Antony x on 2018/11/28.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeTableViewCell : UITableViewCell
-(void) initData: (Video *)videoInfo;
@end

NS_ASSUME_NONNULL_END
