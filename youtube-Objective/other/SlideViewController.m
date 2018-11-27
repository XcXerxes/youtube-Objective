//
//  SlideViewController.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/26.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "SlideViewController.h"
#import "Constants.h"
#import "NavHeaderView.h"
#import "HoverViewFlowLayout.h"

@interface SlideViewController ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
UIScrollViewDelegate,
SlideTabBarDelegate
>
@property (nonatomic, strong) UIBarButtonItem *leftLabelBtn;
@end

@implementation SlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置导航的背景
    [self initNav];
    // 初始化slide
    // [self initSlideTabBar];
    // 初始化collectionView
    [self initCollectionView];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.collectionView.delegate = self;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.collectionView.delegate = nil;
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

-(void) initCollectionView {
    HoverViewFlowLayout *layout = [[HoverViewFlowLayout alloc] initWithTopHeight:55.0];;
    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 0;
    _collectionView = [[UICollectionView alloc] initWithFrame: CGRectMake(0, 0, ScreenWidth, self.view.bounds.size.height) collectionViewLayout:layout];
    _collectionView.alwaysBounceVertical = NO;
    // 适配 ios11 出现UI bug
    if (@available(iOS 11.0, *)) {
        _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    // 点击状态栏会触发滚动视图， 隐藏到slideTabBar 的事件
    _collectionView.scrollsToTop = NO;
    [_collectionView registerClass:[NavHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headId"];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
     [self.view addSubview:_collectionView];
}

-(void) initSlideTabBar {
    _slideTabBar = [SlideTabBar new];
    _slideTabBar.frame = CGRectMake(0, 0, ScreenWidth, 55);
    _slideTabBar.delegate = self;
    [self.view addSubview:_slideTabBar];
    [_slideTabBar setImageNames:@[@"Home", @"Trending", @"Subscriptions", @"Account"] tabIndex:0];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
// 返回 collection 头部
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    NavHeaderView *reusbaleView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headId" forIndexPath:indexPath];
    reusbaleView.slideTabBar.delegate = self;
    return reusbaleView;
}
// 组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
// 个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}
// 单元格的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(ScreenWidth, 200);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

// 设置头部的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(ScreenWidth, 55);
}

// 滚动时的delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 15) {
        [UIView animateWithDuration:.2 animations:^{
            [self.collectionView setFrame:CGRectMake(0, 40, ScreenWidth, ScreenHeight)];
          // [self.slideTabBar setFrame:CGRectMake(0, 15, ScreenWidth, 55)];
            [self.navigationController setNavigationBarHidden:YES];
        } completion:^(BOOL finished) {
        }];
    } else if (offsetY < 15) {
        [UIView animateWithDuration:.2 animations:^{
            [self.collectionView setFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
            [self.navigationController setNavigationBarHidden:NO];
        } completion:^(BOOL finished) {
        }];
    }
}

// slidetabBar delegate
- (void)slideTabBar:(NSInteger)tabIndex WithTitle:(NSString *)title {
    [_leftLabelBtn setTitle:title];
}

@end
