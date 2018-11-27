//
//  BaseViewController.m
//  youtube-Objective
//
//  Created by xiacan on 2018/11/27.
//  Copyright © 2018 Antony x. All rights reserved.
//

#import "BaseViewController.h"
#import "Constants.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNavigationBarTransparent];
    [self setNavigationBarBackgroundColor: ColorThemeRed];
}
// 设置背景不透明
- (void)setNavigationBarTransparent {
    self.navigationController.navigationBar.translucent = NO;
}

// 设置背景色
-(void) setNavigationBarBackgroundColor:(UIColor *)color {
    self.navigationController.navigationBar.barTintColor = color;
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
