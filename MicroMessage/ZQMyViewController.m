//
//  ZQMyViewController.m
//  MicroMessage
//
//  Created by jky-group on 14-6-28.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//


#import "ZQMyViewController.h"

@interface ZQMyViewController ()

@end

@implementation ZQMyViewController

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
    
    [self addBuffer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addBuffer
{
    bufferView = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,480)];
    
    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(110, 200, 100, 100)];
    blackView.backgroundColor = [UIColor grayColor];
    blackView.layer.cornerRadius = 10;
    blackView.alpha = 0.7;
    [bufferView addSubview:blackView];
    
    UIActivityIndicatorView *actiView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [actiView setCenter:CGPointMake(50, 35)];
    [actiView startAnimating];
    
    [blackView addSubview:actiView];

    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, 100, 40)];
    label.text = @"正在加载....";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    [blackView addSubview:label];
}

/**
 *  设置缓冲器的提示语
 */
- (void)setActiveTitle:(NSString *)title
{
    label.text = title;
}

/**
 *  开启缓冲器
 */
- (void)startActive
{
    if (![bufferView superview]) {
        [self.view addSubview:bufferView];
    }
}

/**
 *  关闭缓冲器
 */
-(void)stopActive
{
    [bufferView removeFromSuperview];
}

/**
 *  异常显示
 */
- (void)showAlert:(NSString *)infoStr
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:infoStr delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [alert show];
}

@end
