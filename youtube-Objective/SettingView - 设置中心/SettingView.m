//
//  SettingView.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/28.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "SettingView.h"
#import "Constants.h"

@interface SettingView ()
<
UITableViewDelegate,
UITableViewDataSource
>
@end

@implementation SettingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initBgView];
    }
    return self;
}

-(void) initBgView {
    NSLog(@"======");
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    _bgView.backgroundColor = ColorBlack;
    [self addSubview:_bgView];
}

-(void) initTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 288, ScreenWidth, 288) style:UITableViewStyleGrouped];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.textLabel.text = @"Team & privacy policy";
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
