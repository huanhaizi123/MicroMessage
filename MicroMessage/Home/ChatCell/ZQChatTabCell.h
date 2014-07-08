//
//  ZQChatTabCell.h
//  MicroMessage
//
//  Created by jky-group on 14-7-7.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQImageView.h"

@interface ZQChatTabCell : UITableViewCell

@property (weak, nonatomic) IBOutlet ZQImageView *userChatImage;

@property (weak, nonatomic) IBOutlet UIButton *userChatContents;

- (void)setContenDict:(NSDictionary *)indict;

@property (nonatomic,strong) NSString *myConten;
@property (nonatomic,assign) int type;

@end
