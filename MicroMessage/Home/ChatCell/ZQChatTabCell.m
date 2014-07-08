//
//  ZQChatTabCell.m
//  MicroMessage
//
//  Created by jky-group on 14-7-7.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQChatTabCell.h"

@implementation ZQChatTabCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setContenDict:(NSDictionary *)indict
{
    
}

- (void)setMyConten:(NSString *)myConten
{
    _myConten = myConten;
    
    CGSize cellSize = [myConten sizeWithFont:self.userChatContents.titleLabel.font constrainedToSize:CGSizeMake(self.userChatContents.frame.size.width, 100)];
    
    if (cellSize.height > 50) {
        [_userChatContents setFrame:CGRectMake(_userChatContents.frame.origin.x, _userChatContents.frame.origin.y,_userChatContents.frame.size.width,_userChatContents.frame.size.height)];
    }
    
    // 边缘设置
    [_userChatContents setContentEdgeInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
    [_userChatContents setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [_userChatContents setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    // 显示最大行数
    [_userChatContents.titleLabel setNumberOfLines:100];
    [_userChatContents setTitle:myConten forState:UIControlStateNormal];
}

- (void)setType:(int)type
{
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}

@end
