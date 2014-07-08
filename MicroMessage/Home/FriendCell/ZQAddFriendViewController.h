//
//  ZQAddFriendViewController.h
//  MicroMessage
//
//  Created by jky-group on 14-7-3.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQMyViewController.h"
#import "ASIFormDataRequest.h"

@interface ZQAddFriendViewController : ZQMyViewController<ASIHTTPRequestDelegate>
{
    IBOutlet  UISearchBar *addsearchBar;
    IBOutlet UITableView *myTableView;
    
    NSMutableArray *myAddFriendData;
}

@end
