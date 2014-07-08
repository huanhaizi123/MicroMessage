//
//  ZQAddFriendTabCell.m
//  MicroMessage
//
//  Created by jky-group on 14-7-3.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQAddFriendTabCell.h"

#define kIPA @"http://192.168.2.34:8080/gchat/"


@implementation ZQAddFriendTabCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addFriend:(UIButton *)sender
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:[kIPA stringByAppendingString:@"add_friend.htm"]]];
    request.delegate = self;
    request.requestMethod = @"POST";
    request.friendD = self.friendDict;
    
    [request setPostValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"id"] forKey:@"userId"] ;
    [request setPostValue:[self.friendDict objectForKey:@"id"] forKey:@"friendId"];
    
    [request startAsynchronous];
    
}


- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSDictionary *backDict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableLeaves error:nil];
    ZQLog(@"%@",backDict);
    
    if ([[backDict objectForKey:@"success"] intValue] == 1) {
        ZQLog(@"添加成功");
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"addFriend" object:nil userInfo:request.friendD];
        [self.addBtn setTitle:@"已添加" forState:UIControlStateNormal];
        NSMutableDictionary *dict = (NSMutableDictionary *)self.friendDict;
        
        [dict setObject:@"已添加" forKey:@"status"];
    }
    else
    {
        ZQLog(@"添加失败");
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    ZQLog(@"添加好友失败");
}

@end
