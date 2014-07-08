//
//  ZQLoginViewController.m
//  MicroMessage
//
//  Created by jky-group on 14-6-28.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQLoginViewController.h"
#import "ZQRegisteViewController.h"
#import "ZQLoginNetWork.h"
#import "ZQMenuTabBar.h"

@interface ZQLoginViewController ()<UITextFieldDelegate>

@end

@implementation ZQLoginViewController

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
    [self setActiveTitle:@"正在登录..."];


    userName.delegate = self;
    userPwd.delegate = self;
    
    self.title = @"登录";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStyleBordered target:self action:@selector(regist)];
    
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    
    NSString *userpwd = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    
    NSString *remPwd = [[NSUserDefaults standardUserDefaults] objectForKey:@"remmberCode"];
    
//    NSString *imageUrl = [[NSUserDefaults standardUserDefaults] objectForKey:@"userIconUrl"];
//    
//    NSLog(@"%@",imageUrl);
//    
//    [userImage setURLStr:@"013.jpg"];
    
    userNameLb.text = username;
    
    userName.text = username;
    
    if ([remPwd isEqual:@"1"]) {
        rempwd.selected = YES;
        userPwd.text = userpwd;
    }
    else
    {
        rempwd.selected = NO;
    }
 
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccess:) name:@"login" object:nil];
    
}

#pragma mark login fundation
- (void)login:(UIButton *)sender
{
    [self textFieldShouldReturn:userName];
    // 开启缓冲器
    [self startActive];
    
    // 初始化网络层，并启动
    ZQLoginNetWork *loginNetWork = [[ZQLoginNetWork alloc] init];
    
    loginNetWork.netURL = [NSURL URLWithString:[kIP stringByAppendingString:@"login.htm"]];
    
    NSString *postStr = [NSString stringWithFormat:@"username=%@&password=%@",userName.text,userPwd.text];
               
    loginNetWork.postData = [postStr dataUsingEncoding:NSUTF8StringEncoding];
    
    loginNetWork.method = @"POST";
    
    [loginNetWork startAsyLoginNetWork];
}

#pragma mark login success
- (void)loginSuccess:(NSNotification *)notification
{
    // 关闭缓冲
    [self stopActive];
    
    NSDictionary *backDict = [notification object];
    
    NSLog(@"%@",backDict);
    
    if (backDict == nil) {
        [self showAlert:@"链接服务器失败"];
        NSLog(@"login fail");
    }
    else
    {
        if ([backDict objectForKey:@"id"]) {
            
            [[NSUserDefaults standardUserDefaults] setObject:[backDict objectForKey:@"createTime"] forKey:@"createTime"];
            [[NSUserDefaults standardUserDefaults] setObject:[backDict objectForKey:@"id"] forKey:@"id"];
            [[NSUserDefaults standardUserDefaults] setObject:[backDict objectForKey:@"userIconUrl"] forKey:@"UserIconUrl"];
            [[NSUserDefaults standardUserDefaults] setObject:[backDict objectForKey:@"username"] forKey:@"username"];
            [[NSUserDefaults standardUserDefaults] setObject:userPwd.text forKey:@"password"];
            
            if (rempwd.selected == YES) {
                [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"remmberCode"];
            }
            else
            {
                [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"remmberCode"];
            }
            
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            ZQMenuTabBar *menu = [[ZQMenuTabBar alloc] init];
            [self.navigationController pushViewController:menu animated:YES];
        }
        else
        {
            //[self stopActive];
            [self showAlert:@"登录失败"];
        }
    }
    

}


- (void)regist
{
    ZQRegisteViewController *regist = [[ZQRegisteViewController alloc] init];
    
    [self.navigationController pushViewController:regist animated:YES];
}

 - (void)remPwd:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (rempwd.selected == NO) {
        autoLogin.selected = NO;
    }
}

- (void)autoLogin:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (autoLogin.selected == YES) {
        rempwd.selected = YES;
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
