//
//  ZQMenuTabBar.m
//  MicroMessage
//
//  Created by jky-group on 14-7-1.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQMenuTabBar.h"
#import "ZQFriendViewController.h"
#import "ZQChatViewController.h"
#import "ZQOtherViewController.h"

@interface ZQMenuTabBar ()

@end

@implementation ZQMenuTabBar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    [self.navigationItem setHidesBackButton:YES];
        
    ZQChatViewController *chat = [[ZQChatViewController alloc] init];
        chat.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"聊天" image:[UIImage imageNamed:@"tab_recent_nor.png"] tag:0];
    
     ZQFriendViewController *friend = [[ZQFriendViewController alloc] init];
        friend.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"好友" image:[UIImage imageNamed:@"tab_buddy_nor.png"] tag:0];
    
    ZQOtherViewController *other = [[ZQOtherViewController alloc] init];
        other.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"个人" image:[UIImage imageNamed:@"tab_qworld_nor.png"] tag:0];
        
    self.viewControllers = [NSArray arrayWithObjects:chat,friend,other, nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
