//
//  PlayViewController.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/29.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "PlayViewController.h"
#import "PlayViewCell.h"
#import "PlayerView.h"
#import "PlayViewHeader.h"

#import "Constants.h"
#import "Masonry.h"

@interface PlayViewController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
WMPlayerDelegate
>
@end

@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initCollectionView];
    [self initPlayerView];
    
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    [UIApplication sharedApplication].statusBarHidden = YES;
    [super viewWillAppear: animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    [UIApplication sharedApplication].statusBarHidden = NO;
    [super viewWillDisappear: animated];
}
-(void) initPlayerView {
    PlayerView *playView = [[PlayerView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 211.0)];
    playView.wmPlayer.delegate = self;
    [self.view addSubview:playView];
}
-(void) initCollectionView {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 0;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 211.0, ScreenWidth, ScreenHeight - 211.0) collectionViewLayout:layout];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = ColorWhite;
    [_collectionView registerClass:[PlayViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [_collectionView registerClass:[PlayViewHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId"];
    [self.view addSubview:_collectionView];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    PlayViewHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerId" forIndexPath:indexPath];
    return header;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(ScreenWidth, 200);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PlayViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(ScreenWidth, 106);
}

// wmPlayer delegate
- (void)wmplayer:(WMPlayer *)wmplayer clickedCloseButton:(UIButton *)backBtn {
    [self.navigationController popViewControllerAnimated:YES];
    
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
