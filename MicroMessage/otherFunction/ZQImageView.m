//
//  ZQImageView.m
//  MicroMessage
//
//  Created by jky-group on 14-7-1.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQImageView.h"

@implementation ZQImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setURLStr:(NSString *)URLStr
{
    if (!activeView) {
        activeView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [activeView setCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)];
        [activeView startAnimating];
        [self addSubview:activeView];
    }
    else
        [self addSubview:activeView];
    
    [self netRequest:URLStr];
    
}


- (id)initWithURL:(NSString *)URLStr
{
    self = [super init];
    if(self)
    {
        [self netRequest:URLStr];
    }
    
    return self;
}

- (void)netRequest:(NSString *)URLStr
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    request.URL = [NSURL URLWithString:URLStr];
    request.HTTPMethod = @"GET";
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (!connection) {
        NSLog(@"图片请求失败");
    }
    else
    {
        /**
         *  给图片申请内存
         */
        imgData = [NSMutableData data];
    }
}


/**
 *  接受数据的回调
 */
#pragma mark 接受数据的回调
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [imgData appendData:data];
}

/**
 *  网络数据下载完成的回调
 */
#pragma mark 网络数据下载完成的回调
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    ZQLog(@"图片下载完成");
    self.image = [UIImage imageWithData:imgData];
    
    // 释放
    [activeView removeFromSuperview];
}

/**
 *  图片下载失败时的回调
 */
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    ZQLog(@"图片下载失败");
    [activeView removeFromSuperview];
}

@end
