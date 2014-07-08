//
//  MessageTableViewCell.m
//  MyQQ
//
//  Created by jky-group on 14-5-12.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "Message.h"
#import "MessageFrame.h"
#import "ChatViewController.h"

@interface MessageTableViewCell()
{
    // 时间
    UIButton *_timeBtn;
    
    // 头像
    UIImageView *_iconView;
    
    // 内容
    UIButton *_contentBtn;
}
@end

@implementation MessageTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 时间
        _timeBtn = [[UIButton alloc]init];
        [_timeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _timeBtn.titleLabel.font =kTimeFont;

        // 设置时间背景
        [_timeBtn setBackgroundImage:[UIImage imageNamed:@"chat_timeline_bg.png"] forState:UIControlStateNormal];
        
        [self.contentView addSubview:_timeBtn];
        
        // 头像
        _iconView = [[UIImageView alloc]init];
        [self.contentView addSubview:_iconView];
        
        //内容
        _contentBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        _contentBtn.titleLabel.numberOfLines = 0;
        _contentBtn.titleLabel.font=kContentFont;
        _contentBtn.contentEdgeInsets = UIEdgeInsetsMake(kContentWidth, kContentMargin, kContentWidth, kContentMargin);
        [_contentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_contentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [self.contentView addSubview:_contentBtn];
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

#pragma mark 传递了模型数据和frame数据
- (void)setMessageFrame:(MessageFrame *)messageFrame
{
    
    _messageFrame = messageFrame;
    
    Message *msg = messageFrame.message;
    
    // 时间
    if (messageFrame.showTime) {
        _timeBtn.hidden = NO;
         _timeBtn.frame=messageFrame.timeF;
        [_timeBtn setTitle:msg.time forState:UIControlStateNormal];
    }
    else
    {
        _timeBtn.hidden = YES;
    }
   
    // 头像
    _iconView.frame = messageFrame.iconF;
    _iconView.image = [UIImage imageNamed:msg.icon];
    
    // 内容
    _contentBtn.frame = messageFrame.contentF;
    [_contentBtn setTitle:msg.content forState:UIControlStateNormal];
    
    NSString *nomal = nil, *focus = nil;
    
    if (msg.type == messageTypeMe) {
        nomal =@"chatto_bg_normal.png";
        
        focus =@"chatto_bg_focused.png";
    }
    else
    {
        nomal =@"chatfrom_bg_normal.png";
        
        focus =@"chatfrom_bg_focused.png";
    }
    
    [_contentBtn setBackgroundImage:[self resizedImage:nomal leftScale:0.5 topScale:0.7] forState:UIControlStateNormal];
    
    [_contentBtn setBackgroundImage:[self resizedImage:focus leftScale:0.5 topScale:0.7] forState:UIControlStateHighlighted];
}

- (UIImage *)resizedImage:(NSString *)name leftScale:(CGFloat)leftScale topScale:(CGFloat)topScale
{
    // 加载图片
    UIImage *image =[UIImage imageNamed:name];
    
    // 左边需要保护的内容
    CGFloat left = image.size.width * leftScale;
    
    // 右边需要保护的内容
    CGFloat top = image.size.height * topScale;
    
    // 拉伸中间部分1＊1的部分
    image = [image stretchableImageWithLeftCapWidth:left topCapHeight:top];
    
    return image;
}

@end
