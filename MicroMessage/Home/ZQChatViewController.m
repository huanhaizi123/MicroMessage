//
//  ZQChatViewController.m
//  MicroMessage
//
//  Created by jky-group on 14-7-1.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQChatViewController.h"

@interface ZQChatViewController ()

@end

@implementation ZQChatViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.visibleViewController.title = @"聊天";
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
