//
//  SlideTabBar.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/26.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "SlideTabBar.h"
#import "Constants.h"
@interface SlideTabBar ()
@property (nonatomic, strong) UIView *slideLineView;
@property (nonatomic, copy) NSMutableArray<NSString *>   *imageNames;
@property (nonatomic, copy) NSMutableArray<UIImageView *> *imageViews;
@property (nonatomic, assign) NSInteger tableIndex;
@property (nonatomic, assign) CGFloat itemWidth;
@end
@implementation SlideTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageNames = [NSMutableArray array];
        _imageViews = [NSMutableArray array];
    }
    return self;
}

- (void)layoutSubviews {
    // 调用父类的 更新 子视图方法
    [super layoutSubviews];
    // 如果
    if(_imageNames.count == 0) {
        return;
    }
    // 一次性删除所有的子视图
    [[self subviews] enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    // 清空数组
    [_imageNames removeAllObjects];
    CGFloat itemWidth = _itemWidth = ScreenWidth / _imageNames.count;
    __weak typeof(self) wself = self;
    
    [_imageNames enumerateObjectsUsingBlock:^(__kindof NSString * _Nonnull imageName, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(idx * itemWidth, 0, itemWidth, wself.bounds.size.height);
        imageView.tag = idx;
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapAction:)]];
        [wself.imageViews addObject:imageView];
        [wself addSubview:imageView];
    }];
    // 定义下划线的样式
    wself.slideLineView = [UIView new];
    wself.slideLineView.frame = CGRectMake(wself.tableIndex * itemWidth, wself.bounds.size.height - 2, itemWidth - 30, 2);
    wself.slideLineView.backgroundColor = ColorWhite;
}

// 初始化设置 slideBar 的样式
- (void)setImageNames:(NSArray<NSString *> *)imageNames tabIndex:(NSInteger)tabIndex {
    [_imageNames removeAllObjects];
    [_imageNames addObjectsFromArray:imageNames];
    _tableIndex = tabIndex;
}

-(void)onTapAction:(UITapGestureRecognizer *)tap {
    
}

@end
