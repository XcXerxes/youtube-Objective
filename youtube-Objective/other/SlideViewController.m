//
//  SlideViewController.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/26.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "SlideViewController.h"
#import "Constants.h"

@interface SlideViewController ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
UIScrollViewDelegate
>
@end

@implementation SlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置导航的背景
    [self initNav];
    // 初始化slide
    [self initSlideTabBar];
    // 初始化collectionView
    [self initCollectionView];
}

// initNav
-(void) initNav {
    self.navigationController.navigationBar.translucent = NO;
    // 设置导航控制器的背景颜色
    self.navigationController.navigationBar.barTintColor = ColorThemeRed;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self setStatusBarBackgroundColor: ColorThemeRed];
    // 去掉导航控制器的下边框
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

-(void) initCollectionView {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 0;
    _collectionView = [[UICollectionView alloc] initWithFrame: CGRectMake(0, self.slideTabBar.frame.size.height, ScreenWidth, self.view.bounds.size.height - self.slideTabBar.frame.size.height) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;   
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
     [self.view addSubview:_collectionView];
}

-(void) initSlideTabBar {
    _slideTabBar = [SlideTabBar new];
    _slideTabBar.frame = CGRectMake(0, 0, ScreenWidth, 55);
    [self.view addSubview:_slideTabBar];
    [_slideTabBar setImageNames:@[@"home", @"trending", @"subscriptions", @"account"] tabIndex:0];
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
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    NavHeaderView *reusbaleView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headId" forIndexPath:indexPath];
//
//    return reusbaleView;
//}
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

// 设置头部的高度
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    return CGSizeMake(ScreenWidth, 55);
//}

// 滚动时的delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0) {
        [UIView animateWithDuration:.2 animations:^{
            [self.collectionView setFrame:CGRectMake(0, 40.0+55.0, ScreenWidth, ScreenHeight - 55.0-40.0)];
            [self.slideTabBar setFrame:CGRectMake(0, 40, ScreenWidth, 55)];
            
            //self.view.frame = CGRectMake(0, 64, ScreenWidth, ScreenHeight);
        } completion:^(BOOL finished) {
            [self.navigationController setNavigationBarHidden:YES animated:YES];
            [self.navigationController setHidesBarsOnTap:YES];
            
        }];
    } else {
        [UIView animateWithDuration:.2 animations:^{
            [self.slideTabBar setFrame:CGRectMake(0, 0, ScreenWidth, 55)];
            [self.collectionView setFrame:CGRectMake(0, 55.0, ScreenWidth, ScreenHeight - 55.0)];
        } completion:^(BOOL finished) {
            [self.navigationController setNavigationBarHidden:NO animated:YES];
            
        }];
    }
}

@end
