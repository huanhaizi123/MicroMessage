//
//  ZQChatViewCtr.h
//  MicroMessage
//
//  Created by jky-group on 14-7-7.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQMyViewController.h"
#import "ASIFormDataRequest.h"

@interface ZQChatViewCtr : ZQMyViewController<ASIHTTPRequestDelegate>
{
    IBOutlet UIView *chatView;
    IBOutlet UITableView *chatTabView;
    IBOutlet UITextView *chatTextF;
    
    NSMutableArray *myDataMArr;
}


@property (nonatomic ,strong)NSDictionary *friendDict;

- (IBAction)SendMessage;

@end
