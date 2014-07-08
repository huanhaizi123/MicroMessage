//
//  ZQRegisteViewController.m
//  MicroMessage
//
//  Created by jky-group on 14-6-29.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQRegisteViewController.h"
#import "ZQNetWork.h"

@interface ZQRegisteViewController ()<ZQNetWorkDelegate,UITextFieldDelegate>

@end

@implementation ZQRegisteViewController

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
    userPwd.delegate = self;
    userName.delegate =self;
    userLoginID.delegate = self;
    
    [super viewDidLoad];
    
    [self addBuffer];
    [self setActiveTitle:@"正在注册..."];
    
    self.title = @"注册";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(login)];
    
}

- (void)login
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 注册
/**
 *  注册
 *
 */
- (IBAction)registe:(UIButton *)sender
{
    // 开启缓冲
    [self startActive];
    
    ZQNetWork *netWork = [[ZQNetWork alloc] init];
    // 网络代理
    netWork.delegate = self;
    // 网络地址
    netWork.netURL = [NSURL URLWithString:[kIP stringByAppendingString:@"regist.htm"]];
    // 网络请求的方式
    netWork.method = @"POST";
    // 传输数据给网络
    NSString *contentStr = [NSString stringWithFormat:@"username=%@&password=%@",userName.text,userPwd.text];
    // 将数据以UTF8的形式显示
    netWork.postData = [contentStr dataUsingEncoding:NSUTF8StringEncoding];
    // 开启网络同步请求
    [netWork startAsyNetWork];
    
    return ;
    /**
     *  一个网络需要 一个URL地址 GET方式 POST方式
     */
    
    ASIFormDataRequest *asiRequest = [[ASIFormDataRequest alloc] initWithURL:netWork.netURL];
    
    [asiRequest setPostValue:userName.text forKey:@"userName"];
    [asiRequest setPostValue:userLoginID.text forKey:@"userLoginID"];
    [asiRequest setPostValue:userPwd.text forKey:@"userPwd"];
    
    asiRequest.delegate = self;
    
    /**
     *第三方类库
     *  启动网络
     */
    [asiRequest startAsynchronous];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ASI delegate
/**
 *网络完成成功 通过这个方法来通知
 *network success get though 
 */
- (void)netWork:(ZQNetWork *)netWork requestFinished:(NSData *)backData
{
    [self stopActive];
    
     NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:backData options:NSJSONReadingMutableContainers error:nil];
    
    NSLog(@"finish -- %@",dict);
    if ([dict objectForKey:@"success"])
    {
        NSLog(@"success!");
        [self showAlert:@"success"];
    }else
    {
        NSLog(@" net errorí");
        [self showAlert:@"network error"];
    }
   
}

#pragma mark Network fail
- (void)netWork:(ZQNetWork *)netWork requestFailed:(NSError *)error
{
     [self stopActive];
    NSString *fail = error.localizedDescription;
     [self showAlert:fail];
    NSLog(@"regist %@",fail);
}

#pragma mark textField delegate
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
