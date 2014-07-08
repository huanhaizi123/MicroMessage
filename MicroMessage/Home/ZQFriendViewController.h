//
//  ZQFriendViewController.h
//  MicroMessage
//
//  Created by jky-group on 14-7-1.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQMyViewController.h"
#import "ASIFormDataRequest.h"

@interface ZQFriendViewController : ZQMyViewController
{
    IBOutlet UITableView *friendTableView;
    NSMutableArray *myData;
}

@end
