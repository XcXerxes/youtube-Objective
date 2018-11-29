//
//  PlayerView.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/29.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "PlayerView.h"
#import "WMPlayer.h"
#import "Masonry.h"

@implementation PlayerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"=====play");
        [self initPresentMovie];
    }
    return self;
}

-(void)initPresentMovie {
    WMPlayerModel *playerModel = [WMPlayerModel new];
    playerModel.videoURL = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    WMPlayer *wmPlayer = [[WMPlayer alloc] initPlayerModel:playerModel];
    [self addSubview:wmPlayer];
    [wmPlayer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.equalTo(self);
        make.height.mas_equalTo(wmPlayer.mas_width).multipliedBy(9.0/16);
    }];
    [wmPlayer play];
}

-(void) play {
    
}

@end
