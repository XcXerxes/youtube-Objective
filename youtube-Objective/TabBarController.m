//
//  TabBarController.m
//  youtube-Objective
//
//  Created by xiacan on 2018/11/27.
//  Copyright © 2018 Antony x. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "HomeViewController.h"
#import "TrendingViewController.h"
#import "SubscriptionsViewController.h"
#import "AccountViewController.h"
#import "Constants.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 初始化 主页视图
    [self initTabBarWithViewController:[HomeViewController new] title:@"" image:@"home" selectedImage:@"homeSelected"];
    // 初始化 热门视图
    [self initTabBarWithViewController:[TrendingViewController new] title:@"" image:@"trending" selectedImage:@"trendingSelected"];
    // 初始化 订阅视图
    [self initTabBarWithViewController:[SubscriptionsViewController new] title:@"" image:@"subscriptions" selectedImage:@"subscriptionsSelected"];
    // 初始化 个人中心视图
    [self initTabBarWithViewController:[AccountViewController new] title:@"" image:@"account" selectedImage:@"accountSelected"];
}
+ (void)initialize
{
    // [[UITabBar appearance] setTintColor:ColorThemeRed];
    // 设置被选中时的颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:ColorThemeRed, NSForegroundColorAttributeName, [UIFont systemFontOfSize:14], NSFontAttributeName, nil] forState:UIControlStateSelected];
}

// 初始化 tabbar
-(void) initTabBarWithViewController: (UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    // 设置背景色
    [self.tabBar setBarTintColor:ColorThemeRed];
    // 设置当前tabbar 为空
    childController.tabBarItem.title = title;
    // 设置被选中时的图片和 默认的图片
    // imageWithRenderingMode ： 设置图片颜色 防止被系统颜色覆盖
    [childController.tabBarItem setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //imageWithRenderingMode ： 设置图片颜色 被系统颜色覆盖
    [childController.tabBarItem setSelectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    // 将tabbar 添加到根视图
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:childController];
    // 设置背景色为不透明
    self.tabBar.translucent = NO;
    // 这个设置貌似没用
    // childController.tabBarController.tabBar.translucent = NO;
    [self addChildViewController:nav];
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
