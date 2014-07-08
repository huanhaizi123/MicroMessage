//
//  ZQNetWork.m
//  MicroMessage
//
//  Created by jky-group on 14-6-29.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQNetWork.h"

@implementation ZQNetWork

/**
 *  同步网络请求
 */
- (void)startAsyNetWork
{
    [NSThread detachNewThreadSelector:@selector(netStart) toTarget:self withObject:nil];
}

- (void)netStart
{
    NSError *error;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:self.netURL];
    request.HTTPBody = self.postData;
    request.HTTPMethod = self.method;
    
    // 网络请求用同步
    
    NSData *backData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    if (backData) {
        [self performSelector:@selector(performMain:) onThread:[NSThread mainThread] withObject:backData waitUntilDone:NO];
    }
    else if (error)
    {
        [self performSelector:@selector(performError:) onThread:[NSThread mainThread] withObject:error waitUntilDone:NO];
    }
    
    
}

- (void)performMain:(NSData *)backData
{
    if ([_delegate respondsToSelector:@selector(netWork:requestFinished:)]) {
        [_delegate netWork:self requestFinished:backData];
    }
}

- (void)performError:(NSError *)error
{
    if ([_delegate respondsToSelector:@selector(netWork:requestFailed:)]) {
        [_delegate netWork:self requestFailed:error];
    }
}


/**
 *  异步网络请求
 */
- (void)startSyNetWork
{
    
}


@end
