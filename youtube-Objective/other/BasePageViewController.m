//
//  BasePageViewController.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/27.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "BasePageViewController.h"
#import "HomeViewController.h"
#import "Constants.h"
#import "SlideTabBar.h"

@interface BasePageViewController ()
<
UIPageViewControllerDelegate,
UIPageViewControllerDataSource,
SlideTabBarDelegate
>
@property (nonatomic, strong) SlideTabBar *slideTabBar;
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) UIBarButtonItem *leftLabelBtn;
@end

@implementation BasePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    [self initSlideTabBar];
    // Do any additional setup after loading the view.
    [self setupMainView];
}

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


-(void)setupMainView {
    self.view.backgroundColor = [UIColor clearColor];
    NSDictionary * options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin] forKey:UIPageViewControllerOptionSpineLocationKey];
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    _pageViewController.delegate = self;
    _pageViewController.dataSource = self;
    
    HomeViewController *initView = [self viewCintrollerAtIndex:0];
    // HomeViewController *endView = [self viewCintrollerAtIndex:1];
    NSLog(@"================12");
    NSArray *viewControllers = [NSArray arrayWithObjects:initView,nil];
    [_pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [_pageViewController didMoveToParentViewController:self];
    _pageViewController.view.bounds = CGRectMake(0, 55, ScreenWidth, 200);

}
//返回一个视图
- (HomeViewController *)viewCintrollerAtIndex:(NSUInteger)index
{
    NSLog(@"=====%d", self.pageContent.count);
    if ([self.pageContent count] == 0 || (index >= [self.pageContent count]))
    {
        return nil;
    }
    
    HomeViewController * dataViewController = [[HomeViewController alloc] init];
    
    //如果去掉这个if-else 照片无法正常显示,原因暂不明确
    if (index == 0 || index == self.pageContent.count - 1)
    {
 // warning 如果不需要显示第一页和最后一页,就将第一页的背景色与viewController一致,或者隐藏掉,这样才会有看到书的封面和封底的效果
        dataViewController.view.backgroundColor = [UIColor greenColor];
    }
    else
    {
 //warning 其他页的一些设置,即使不需要设置什么,也要随机设置个背景色或者其他属性,否则会显示不正常
        dataViewController.view.backgroundColor = [UIColor purpleColor];
    }
    
 //warning -- 配置数据源
    // dataViewController.LQQ_imageView.image = [self.pageContent objectAtIndex:index];
    
    //这句必须有,且只能这么写
    // dataViewController.LQQ_dataObject = [self.pageContent objectAtIndex:index];
    
    return dataViewController;
}

-(void) initSlideTabBar {
    _slideTabBar = [SlideTabBar new];
    _slideTabBar.frame = CGRectMake(0, 88, ScreenWidth, 55);
    _slideTabBar.delegate = self;
    [self.view addSubview:_slideTabBar];
    [_slideTabBar setImageNames:@[@"Home", @"Trending", @"Subscriptions", @"Account"] tabIndex:0];
}

// slidetabBar delegate
- (void)slideTabBar:(NSInteger)tabIndex WithTitle:(NSString *)title {
    //[_leftLabelBtn setTitle:title];
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
