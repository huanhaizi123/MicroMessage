//
//  ZQNetWork.h
//  MicroMessage
//
//  Created by jky-group on 14-6-29.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZQNetWork;

@protocol ZQNetWorkDelegate <NSObject>

/**
 *  网络完成时，通过这个方法通知
 */ 
- (void)netWork:(ZQNetWork *)netWork requestFinished:(NSData *)backData;

/**
 *  网络连接失败
 */
- (void)netWork:(ZQNetWork *)netWork requestFailed:(NSError *)error;

@end

@interface ZQNetWork : NSObject

@property (nonatomic,strong)NSURL *netURL;

@property (nonatomic,copy)NSString *method;

@property (nonatomic,strong)NSData *postData;

/**
 *  异步处理，实现代理
 */
@property (nonatomic,strong)id<ZQNetWorkDelegate> delegate;

/**
 *  启动异步
 */
- (void)startAsyNetWork;

/**
 *  启动同步
 */
- (void)startSyNetWork;

@end
