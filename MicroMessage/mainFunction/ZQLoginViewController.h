//
//  ZQLoginViewController.h
//  MicroMessage
//
//  Created by jky-group on 14-6-28.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQMyViewController.h"
#import "ZQImageView.h"

#import "ASIFormDataRequest.h"


@interface ZQLoginViewController : ZQMyViewController<ASIHTTPRequestDelegate,NSURLConnectionDataDelegate>
{
    IBOutlet UITextField *userName;
    IBOutlet UITextField *userPwd;
    IBOutlet UIButton *loginBtn;
  //  IBOutlet UIImageView *imageView;
    
    IBOutlet UIButton *rempwd;
    IBOutlet UIButton *autoLogin;
    
    IBOutlet  ZQImageView *userImage;
    IBOutlet UILabel *userNameLb;
    
    NSMutableData *netData;
}

- (IBAction)login:(UIButton *)sender;

- (IBAction)remPwd:(UIButton *)sender;

- (IBAction)autoLogin:(UIButton *)sender;

@end
