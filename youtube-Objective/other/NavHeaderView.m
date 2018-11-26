//
//  NavHeaderView.m
//  youtube-Objective
//
//  Created by xiacan on 2018/11/26.
//  Copyright © 2018 Antony x. All rights reserved.
//

#import "NavHeaderView.h"

@implementation NavHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
    }
    return self;
}
-(void)initSubView {
    _slideTabBar = [SlideTabBar new];
    [self addSubview: _slideTabBar];
    NSLog(@"=====%@lf", self.bounds.size.width);
    _slideTabBar.frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, 55);
    [_slideTabBar setImageNames:@[@"home", @"trending", @"subscriptions", @"account"] tabIndex:0];
}
@end
