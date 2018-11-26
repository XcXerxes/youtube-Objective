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
@property (nonatomic, copy) NSMutableArray<UIButton *> *btns;
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
        _btns = [NSMutableArray array];
    }
    return self;
}

- (void)layoutSubviews {
    // 调用父类的 更新 子视图方法
    [super layoutSubviews];
    NSLog(@"self=====%@", self);

    // 如果
    if(_imageNames.count == 0) {
        return;
    }
    // 一次性删除所有的子视图
    [[self subviews] enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"11");
        [obj removeFromSuperview];
    }];
    // 清空数组
    [_btns removeAllObjects];
    NSLog(@"222");
    CGFloat itemWidth = _itemWidth = ScreenWidth/_imageNames.count;
    NSLog(@"====itemWidth-=====%lf", itemWidth);
    __weak typeof(self) wself = self;
    
    [_imageNames enumerateObjectsUsingBlock:^(__kindof NSString * _Nonnull imageName, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [UIImage imageNamed:imageName];
        [btn setImage:image forState:UIControlStateNormal];
        btn.frame = CGRectMake(idx*itemWidth, 0, itemWidth, wself.bounds.size.height);
        btn.tag = idx;
        // UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        // imageView.frame = CGRectMake(idx*itemWidth, 0, itemWidth, wself.bounds.size.height);
        // imageView.tag = idx;
        // imageView.userInteractionEnabled = YES;
        // [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapAction:)]];
        [btn addTarget:self action:@selector(onTapAction:) forControlEvents:UIControlEventTouchUpInside];
        [wself.btns addObject:btn];
        [wself addSubview:btn];
    }];
    // 设置选中时图片的样式
    UIImage *selectedImage = [UIImage imageNamed: [NSString stringWithFormat:@"%@Selected", _imageNames[_tableIndex]]];
    [_btns[_tableIndex] setImage:selectedImage forState:UIControlStateNormal];
    // 定义下划线的样式
    _slideLineView = [UIView new];
    _slideLineView.frame = CGRectMake(wself.tableIndex * itemWidth + 15, wself.bounds.size.height - 2, itemWidth - 30, 2);
    _slideLineView.backgroundColor = ColorWhite;
    self.backgroundColor = ColorThemeRed;
    [self addSubview:_slideLineView];
    
}


// 初始化设置 slideBar 的样式
- (void)setImageNames:(NSArray<NSString *> *)imageNames tabIndex:(NSInteger)tabIndex {
    [_imageNames removeAllObjects];
    [_imageNames addObjectsFromArray:imageNames];
    _tableIndex = tabIndex;
}

-(void)onTapAction:(UIButton *)btn {
    NSInteger index = btn.tag;
    __weak typeof(self) wself = self;
    // 切换时的动画实现
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        // 获取下划线的位置
        CGRect frame = wself.slideLineView.frame;
        // 将新的位置赋值给 y 坐标
        frame.origin.x = wself.itemWidth * index + 15;
        // 设置新的位置坐标
        [wself.slideLineView setFrame:frame];
        
        // 设置选中时的图片
        [wself.btns enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIImage *image = [UIImage imageNamed: [NSString stringWithFormat:@"%@", wself.imageNames[idx]]];
            if (idx == index) {
                UIImage *selectedImage = [UIImage imageNamed: [NSString stringWithFormat:@"%@Selected", wself.imageNames[idx]]];
                [obj setImage:selectedImage forState:UIControlStateNormal];
            } else {
                [obj setImage:image forState:UIControlStateNormal];
            }
        }];
    } completion:^(BOOL finished) {
        
    }];
}

@end
