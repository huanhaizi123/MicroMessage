//
//  ZQLoginNetWork.h
//  MicroMessage
//
//  Created by jky-group on 14-6-30.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZQLoginNetWorkDelegate <NSObject>

- (void)requestFinished:(NSData *)backData;

- (void)requestFailed:(NSData *)error;

@end

@interface ZQLoginNetWork : NSObject<NSURLConnectionDataDelegate>
{
    NSMutableData *netData;
}

@property (nonatomic,strong)NSURL *netURL;

@property (nonatomic,copy)NSString *method;

@property (nonatomic,strong)NSData *postData;


/**
 *  异步处理，实现代理
 */
@property (nonatomic,strong)id<ZQLoginNetWorkDelegate
> delegate;

/**
 *  启动异步
 */
- (void)startAsyLoginNetWork;

/**
 *  启动同步
 */
// - (void)startSyLoginNetWork;

@end
