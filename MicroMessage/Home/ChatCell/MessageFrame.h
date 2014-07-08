//
//  MessageFrame.h
//  MyQQ
//
//  Created by jky-group on 14-5-13.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import <Foundation/Foundation.h>

// 时间字体
#define kTimeFont [UIFont systemFontOfSize:13]

// 内容字体
#define kContentFont [UIFont systemFontOfSize:16]

// 按钮左右的间距
#define kContentMargin 25

// 按钮上下的间距
#define kContentWidth 10

@class Message;

@interface MessageFrame : NSObject

@property (nonatomic,assign,readonly) CGRect iconF; // 头像的frame

@property (nonatomic,assign,readonly) CGRect contentF; // 内容的frame

@property (nonatomic,assign,readonly) CGRect timeF; // 时间

@property (nonatomic,assign,readonly) CGFloat cellHeight; // cell的高度

@property (nonatomic, assign) BOOL showTime;// 是否要隐藏时间控件

@property (nonatomic,strong) Message *message;

- (void)setMessage:(Message *)message showTime:(BOOL)showTime;

@end
