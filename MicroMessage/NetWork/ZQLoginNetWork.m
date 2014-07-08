//
//  ZQLoginNetWork.m
//  MicroMessage
//
//  Created by jky-group on 14-6-30.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQLoginNetWork.h"

@implementation ZQLoginNetWork

- (void)startAsyLoginNetWork
{
    NSURLConnection *connect = nil;
    
    //    /**
    //     *  返回网络参数在他的回调函数里面
    //     */
    //    [NSURLConnection sendAsynchronousRequest:nil queue:nil completionHandler:nil];
    //
    //    /**
    //     *  直接返回网络参数(阻塞)
    //     */
    //    NSData *bascData = [NSURLConnection sendSynchronousRequest:nil returningResponse:nil error:nil];
    //
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    [request setURL:self.netURL];
    /**
     *  请求方式
     */
    request.HTTPMethod = self.method;
    
    /**
     *  设置网络的body 数据
     */
//    NSString *bodyStr = [NSString stringWithFormat:@"username=%@&password=%@",userName.text,userPwd.text];
    request.HTTPBody = self.postData;
    
    // 防止汉字乱码
  //  request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    
    connect = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
    if (!connect) {
        [self showAlert:@"请求失败"];
        NSLog(@"请求失败!");
    }
    else
    {
        if (!netData) {
            netData = [NSMutableData data];
        }
    }
}


#pragma mark － netWork
#pragma mark 网络head的回调
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *mutlResponse = (NSHTTPURLResponse *)response;
    NSDictionary *dict = [mutlResponse allHeaderFields];
    
    NSLog(@"LoginNetWork---headerField;%@",dict);
}

#pragma mark 接受数据的回调
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // 初始化数据
    if (!netData) {
        netData = [NSMutableData data];
    }
    
    [netData appendData:data];
}
#pragma mark 网络下载数据完成的回调
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:netData options:NSJSONReadingMutableLeaves error:nil];
    
    if ([dict objectForKey:@"id"]) {
        
        NSLog(@"登录成功");
        /**
         *  通知登录界面 登录成功 写一个通知NSNotification
         *发送通知
         */
        [[NSNotificationCenter defaultCenter] postNotificationName:@"login" object:dict];
        
        // [self loginSuccess:dict];
    }
    else
    {
        [self showAlert:@"LoginNetWork登录失败"];
        
        NSLog(@"LoginNetWork登录失败！");
    }
}

#pragma mark 网络失败的回调
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self showAlert:@"LoginNetWork网络连接失败"];
    
    NSLog(@"LoginNetWork网络连接失败");
}

- (void)showAlert:(NSString *)infoStr
{
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:infoStr delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [alert show];
}

@end
