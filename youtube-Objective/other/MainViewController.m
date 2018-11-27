//
//  MainViewController.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/27.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "MainViewController.h"
#import "Constants.h"
#import "BasePageViewController.h"

@interface MainViewController ()
<
UIScrollViewDelegate,
SlideTabBarDelegate
>
@property (nonatomic, strong) UIBarButtonItem *leftLabelBtn;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    // [self initNav];
    // 初始化slide
    // [self initSlideTabBar];
    BasePageViewController *pageView = [BasePageViewController new];
    NSArray *data = [NSArray arrayWithObjects:@"11",@"222", @"333",@"4444",nil];
    pageView.pageContent = [NSMutableArray arrayWithArray:data];
    [self presentViewController:pageView animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// initNav
-(void) initNav {
    self.navigationController.navigationBar.translucent = NO;
    // 设置导航控制器的背景颜色
    self.navigationController.navigationBar.barTintColor = ColorThemeRed;
    //
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self setStatusBarBackgroundColor: ColorThemeRed];
    // 去掉导航控制器的下边框
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    //左边标题按钮
    _leftLabelBtn = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleDone target:self action:nil];
    [_leftLabelBtn setTintColor:ColorWhite];
    _leftLabelBtn.enabled = NO;
    [_leftLabelBtn setTitleTextAttributes:@{NSForegroundColorAttributeName: ColorWhite} forState:UIControlStateDisabled];
    self.navigationItem.leftBarButtonItem = _leftLabelBtn;
}
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

-(void) initSlideTabBar {
    _slideTabBar = [SlideTabBar new];
    _slideTabBar.frame = CGRectMake(0, 0, ScreenWidth, 55);
    _slideTabBar.delegate = self;
    [self.view addSubview:_slideTabBar];
    [_slideTabBar setImageNames:@[@"Home", @"Trending", @"Subscriptions", @"Account"] tabIndex:0];
}

// slidetabBar delegate
- (void)slideTabBar:(NSInteger)tabIndex WithTitle:(NSString *)title {
    [_leftLabelBtn setTitle:title];
}


@end
