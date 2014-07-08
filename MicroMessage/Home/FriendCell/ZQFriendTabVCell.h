//
//  ZQFriendTabVCell.h
//  MicroMessage
//
//  Created by jky-group on 14-7-3.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQImageView.h"

@interface ZQFriendTabVCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *userNameTextF;

@property (weak, nonatomic) IBOutlet UILabel *timeTextF;

@property (weak, nonatomic) IBOutlet ZQImageView *userImgView;

@end
