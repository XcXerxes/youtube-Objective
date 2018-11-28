//
//  BaseViewController.m
//  youtube-Objective
//
//  Created by xiacan on 2018/11/27.
//  Copyright © 2018 Antony x. All rights reserved.
//

#import "BaseViewController.h"
#import "Constants.h"
#import "SettingView.h"

@interface BaseViewController ()
@property (nonatomic, strong) UIBarButtonItem *leftLabelBtn;
@property (nonatomic, copy) NSMutableArray<UIBarButtonItem *> *rightBtns;
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
    [self initNavigationBar];
    [self setLeftLabelTitle:@"Home"];
}
// 设置背景不透明
- (void)setNavigationBarTransparent {
    self.navigationController.navigationBar.translucent = NO;
}

// 设置背景色
-(void) setNavigationBarBackgroundColor:(UIColor *)color {
    self.navigationController.navigationBar.barTintColor = color;
}
-(void) initNavigationBar {
    //左边标题按钮
    _leftLabelBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:self action:nil];
    [_leftLabelBtn setTintColor:ColorWhite];
    _leftLabelBtn.enabled = NO;
    [_leftLabelBtn setTitleTextAttributes:@{NSForegroundColorAttributeName: ColorWhite} forState:UIControlStateDisabled];
    self.navigationItem.leftBarButtonItem = _leftLabelBtn;
    
    // 设置右边的按钮组
    NSArray *images = @[@"navSettings", @"navSearch"];
    __weak typeof(self) wself = self;
    _rightBtns = [NSMutableArray array];
    [images enumerateObjectsUsingBlock:^(NSString *imageName, NSUInteger idx, BOOL * _Nonnull stop) {
        UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStyleDone target:wself action:@selector(pressRightBtn:)];
        [btn setTintColor: ColorWhite];
        btn.tag = 100 + idx;
        [wself.rightBtns addObject:btn];
    }];
    self.navigationItem.rightBarButtonItems = _rightBtns;
    
}
- (void)setLeftLabelTitle:(NSString *)title {
    [_leftLabelBtn setTitle:title];
}

// 导航控制器 按钮被点击
-(void) pressRightBtn:(UIBarButtonItem *)barBtn {
    NSInteger tag = barBtn.tag;
    if (tag == 100) {
        NSLog(@"setting");
        SettingView *settingView = [SettingView new];
        [settingView setHidden:NO];
    }
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
