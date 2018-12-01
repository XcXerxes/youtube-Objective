//
//  PlayerView.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/29.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "PlayerView.h"
#import "Masonry.h"

@interface PlayerView()

@end

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
    _wmPlayer = [[WMPlayer alloc] initPlayerModel:playerModel];
        [_wmPlayer setBackBtnStyle:BackBtnStylePop];
    [self addSubview:_wmPlayer];
    [_wmPlayer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.equalTo(self);
        make.height.mas_equalTo(self.wmPlayer.mas_width).multipliedBy(9.0/16);
    }];
    [_wmPlayer play];
}

-(void) play {
    
}
@end
