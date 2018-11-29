//
//  HomeViewController.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/27.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "Constants.h"
#import "Video.h"
#import "PlayViewController.h"

@interface HomeViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTableView];
}



// 初始化tableView
-(void) initTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    _tableView.alwaysBounceVertical = NO;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    // _tableView.estimatedRowHeight = 300;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:_tableView];
}

// 返回行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell initData:[Video new]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 280;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"======selected");
    PlayViewController *playView = [PlayViewController new];
    [self.navigationController pushViewController:playView animated:YES];
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
