//
//  ZQAddFriendTabCell.h
//  MicroMessage
//
//  Created by jky-group on 14-7-3.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"

@interface ZQAddFriendTabCell : UITableViewCell<ASIHTTPRequestDelegate>

@property (weak, nonatomic) IBOutlet UILabel *adduserNameTextF;

@property (weak, nonatomic) IBOutlet UILabel *addtimeTextF;

@property (weak, nonatomic) IBOutlet UIImageView *adduserImgView;

@property (nonatomic,strong) NSDictionary *friendDict;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;


- (IBAction)addFriend:(UIButton *)sender;

@end
