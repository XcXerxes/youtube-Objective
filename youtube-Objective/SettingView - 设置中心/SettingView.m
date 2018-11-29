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
UITableViewDataSource,
UIGestureRecognizerDelegate
>
@property (nonatomic, copy) NSMutableArray *tableArray;
@end

@implementation SettingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _tableArray = [NSMutableArray array];
        [self setHidden:YES];
        [self initBgView];
        [self initTableView];
    }
    return self;
}

-(void) initBgView {
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    _bgView.backgroundColor = ColorBlack;
    _bgView.alpha = 0;
    [self addSubview:_bgView];
    _bgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapSetting:)];
    tap.numberOfTouchesRequired = 1;
    [_bgView addGestureRecognizer:tap];
    
}
-(void) TapSetting:(UITapGestureRecognizer *)tap {
    [self hiddenSetting];
}

-(void)hiddenSetting {
    __weak typeof(self) wself = self;
    [UIView animateWithDuration:.4 animations:^{
        wself.bgView.alpha = 0;
        wself.tableView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 288);
    } completion:^(BOOL finished) {
        [self setHidden:YES];
    }];
}

-(void) initTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 288) style:UITableViewStylePlain];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = nil;
    _tableView.backgroundColor = ColorWhite;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:_tableView];
    _tableArray = [NSMutableArray arrayWithArray: [self loadData]];
}

-(NSArray *) loadData {
    NSArray *array = @[@{@"title": @"Settings", @"content": @[@"Terms & privacy policy", @"Send Feedback"]}, @{@"title": @"Help", @"content": @[@"Switch Account"]}];
    return array;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _tableArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = [_tableArray[section] objectForKey:@"content"];
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellId"];
    }
    NSArray *arr = [_tableArray[indexPath.section] objectForKey:@"content"];
    cell.textLabel.text = arr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageView.image = [UIImage imageNamed:arr[indexPath.row]];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* customView = [[UIView alloc] init];
    
    // create the button object
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.opaque = NO;
    headerLabel.textColor = ColorBlack;
    headerLabel.font = [UIFont boldSystemFontOfSize:15];
    headerLabel.frame = CGRectMake(17.0, 0.0, ScreenWidth, 46.0);
    headerLabel.text = [_tableArray[section] objectForKey:@"title"];
    [customView addSubview:headerLabel];
    return customView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self hiddenSetting];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 46.0;
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
