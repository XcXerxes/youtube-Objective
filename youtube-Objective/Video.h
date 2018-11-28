//
//  Video.h
//  youtube-Objective
//
//  Created by Antony x on 2018/11/28.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
// 自定义 视频发布者头像的类
@class Channel;
@interface Video : NSObject
// 视频标题
@property(nonatomic, copy) NSString *title;
// 视频缩略图的地址
@property(nonatomic, copy) NSString *thumbnailName;
// 观看数量
@property(nonatomic, assign) NSInteger views_int;
// 类
@property (nonatomic, strong) Channel *channel;
// 视频长度
@property (nonatomic, assign) NSInteger duration;
// 视频链接
@property (nonatomic, copy) NSString *videoUrl;

@end

@interface Channel : NSObject
// 定义名称
@property (nonatomic, copy) NSString *name;
// 定义图片地址
@property (nonatomic, copy) NSString *imageName;
// 订阅的数量
@property (nonatomic, assign) NSInteger subscribers;
@end

NS_ASSUME_NONNULL_END
