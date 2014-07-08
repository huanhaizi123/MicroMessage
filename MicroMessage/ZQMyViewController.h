//
//  ZQMyViewController.h
//  MicroMessage
//
//  Created by jky-group on 14-6-28.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kIP @"http://192.168.2.34:8080/gchat/"

@interface ZQMyViewController : UIViewController
{
    UIView *bufferView;
    UILabel *label;
}

 // 添加缓冲器
- (void)addBuffer;

// 开启缓冲器
- (void)startActive;

// 关闭缓冲器
- (void)stopActive;

// 设置缓冲器的提示语
- (void)setActiveTitle:(NSString *)title;

// 异常显示
- (void)showAlert:(NSString *)infoStr;

@end
