//
//  SubscriptionsCell.m
//  youtube-Objective
//
//  Created by xiacan on 2018/12/1.
//  Copyright © 2018 Antony x. All rights reserved.
//

#import "SubscriptionsCell.h"
#import "Constants.h"

@interface SubscriptionsCell()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>
@end

@implementation SubscriptionsCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCell];
    }
    return self;
    
}
-(void) initCell {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 4;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc] initWithFrame:self.contentView.bounds collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.contentView addSubview:_collectionView];
    self.collectionView.backgroundColor = ColorWhite;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    _avatarImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"channel1"]];
    _avatarImageView.frame = CGRectMake(15, 10, 60, 60);
    _avatarImageView.layer.cornerRadius = 30;
    _avatarImageView.layer.masksToBounds = YES;
    [cell addSubview:_avatarImageView];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(60, 80);
}

@end
