//
//  ZQRegisteViewController.h
//  MicroMessage
//
//  Created by jky-group on 14-6-29.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQMyViewController.h"

#import "ASIFormDataRequest.h"

@interface ZQRegisteViewController : ZQMyViewController<ASIHTTPRequestDelegate>
{
    IBOutlet UITextField *userName;
    IBOutlet UITextField *userLoginID;
    IBOutlet UITextField *userPwd;
}

- (IBAction)registe:(UIButton *)sender;

@end
