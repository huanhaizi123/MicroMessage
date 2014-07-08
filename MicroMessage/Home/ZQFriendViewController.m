//
//  ZQFriendViewController.m
//  MicroMessage
//
//  Created by jky-group on 14-7-1.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQFriendViewController.h"
#import "ZQFriendTabVCell.h"
#import "ZQAddFriendViewController.h"
#import "ZQChatViewCtr.h"

@interface ZQFriendViewController ()<ASIHTTPRequestDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZQFriendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.visibleViewController.title = @"好友列表";
    [friendTableView reloadData];
    [super viewWillAppear:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"11111");
    myData = [NSMutableArray array];
    
    self.navigationController.visibleViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(findFriend)];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addFriend:) name:@"addFriend" object:nil];
    
    [self netWork];
  
}

- (void)findFriend
{
    ZQAddFriendViewController *addFriend = [[ZQAddFriendViewController alloc] init];
    
    [self.navigationController pushViewController:addFriend animated:YES];
}

- (void)addFriend:(NSNotification *)notification
{
    NSDictionary *backDict = [notification userInfo];
    [myData addObject:backDict];
}

#pragma mark network delegate
- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSArray *backArr = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableLeaves error:nil];
    
    NSLog(@"%@",backArr);
    
    if ([backArr isKindOfClass:[NSArray class]]) {
        [myData removeAllObjects];
        [myData addObjectsFromArray:backArr];
        [friendTableView reloadData];
    }
    else
        NSLog(@"json error");
}

#pragma mark - tableView delegate

#pragma mark show line in tabview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return myData.count;
}

#pragma mark show content in tableview
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZQFriendTabVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellF"];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZQFriendTabVCell" owner:nil options:nil] lastObject];
    }
    
    NSDictionary *friendDict = [myData objectAtIndex:indexPath.row];
    
    cell.userNameTextF.text = [friendDict objectForKey:@"username"];
    cell.timeTextF.text = [friendDict objectForKey:@"createTime"];
    [cell.userImgView setURLStr:[friendDict objectForKey:@"userIconUrl"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZQChatViewCtr *chat = [[ZQChatViewCtr alloc] init];
    chat.friendDict = [myData objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:chat animated:YES];
}

#pragma mark set height in tabview
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

/**
 *  网络交互的接口
 */
- (void)netWork
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:[kIP stringByAppendingString:@"get_friends.htm"]]];
    
    request.delegate = self;
    request.requestMethod = @"POST";
    
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"id"];
    
    [request setPostValue:userId forKey:@"userId"];
    
    [request startAsynchronous];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
