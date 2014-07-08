//
//  MessageFrame.m
//  MyQQ
//
//  Created by jky-group on 14-5-13.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "MessageFrame.h"
#import "Message.h"

#define kCellBorderW 10

#define kIconWH 40

#define kContentMaxW 200

@implementation MessageFrame

- (void)setMessage:(Message *)message showTime:(BOOL)showTime
{
    _showTime = showTime;
    
    self.message = message;
}

- (void)setMessage:(Message *)message
{
    _message=message;
    
    // 获取屏幕宽度
    CGFloat screenW=[UIScreen mainScreen].bounds.size.width;
    
    // 时间
    if(_showTime)// 不隐藏时间
    {
        CGFloat timeY=kCellBorderW;
        CGSize timeSize= [message.time sizeWithFont:kTimeFont constrainedToSize:CGSizeMake(kContentMaxW, MAXFLOAT)];
        CGFloat timeW=timeSize.width + 20;
        CGFloat timeH=timeSize.height + 10;
    
        CGFloat timeX=(screenW - timeW) *0.5;
    
        _timeF = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    // 头像
    CGFloat iconX=kCellBorderW;
    
    // 自己发的显示在右边
    if(message.type == messageTypeMe)
    {
        iconX = screenW - kIconWH - kCellBorderW;
    }
    
    CGFloat iconY= CGRectGetMaxY(_timeF) + kCellBorderW;
    
    _iconF = CGRectMake(iconX, iconY, kIconWH, kIconWH);
    
    // 内容
    CGFloat contentX= CGRectGetMidX(_iconF) + kCellBorderW + 20;
    
    CGFloat contentY=iconY;
    
    CGSize contentSize = [message.content sizeWithFont:kContentFont constrainedToSize:CGSizeMake(kContentMaxW, MAXFLOAT)];
    
    CGFloat contentW=contentSize.width + (kContentMargin*2);
    CGFloat contentH = contentSize.height + (kContentWidth*2);
    
    // 自己发的内容显示在头像的左边
    if(message.type == messageTypeMe)
    {
        contentX  = _iconF.origin.x - kCellBorderW - contentW;
    }
    
    _contentF = CGRectMake(contentX, contentY, contentW, contentH);
    
    // cell的高度
    CGFloat max = MAX(CGRectGetMaxY(_iconF), CGRectGetMaxY(_contentF));
    
    _cellHeight = max +kCellBorderW;
    
}

@end
