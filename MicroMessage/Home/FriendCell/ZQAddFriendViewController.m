//
//  ZQAddFriendViewController.m
//  MicroMessage
//
//  Created by jky-group on 14-7-3.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQAddFriendViewController.h"
#import "ZQAddFriendTabCell.h"

@interface ZQAddFriendViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZQAddFriendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.visibleViewController.title = @"添加好友";
    
    addsearchBar.delegate = self;
    myAddFriendData = [NSMutableArray array];
    
    // 改变UI
    for (UIView *view in [addsearchBar subviews]) {
        for (UIView *sview in [view subviews]) {
            if ([sview isKindOfClass:[UIButton class]]) {
                UIButton *btn = (UIButton *)sview;
                [btn setTitle:@"搜索" forState:UIControlStateNormal];
            }
        }
    }
    
    myTableView.tableHeaderView = addsearchBar;
    
    // 设置表格的高度
    myTableView.rowHeight = 60;

}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSArray *backArr = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableLeaves error:nil];
    
    ZQLog(@"%@",backArr);
    
    if ([backArr isKindOfClass:[NSArray class]])
    {
        [myAddFriendData removeAllObjects];
     //   [myAddFriendData addObjectsFromArray:backArr];
        for (int i =0; i < backArr.count; i++) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:[backArr objectAtIndex:i]];
            [dict setObject:@"添加" forKey:@"status"];
            [myAddFriendData addObject:dict];
        }
        
        [myTableView reloadData];
    }
    else
    {
        [self showAlert:@"json error"];
        ZQLog(@"json error");
    }
    
    [self stopActive];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [self showAlert:@"网络请求失败"];
    [self stopActive];
    ZQLog(@"网络请求失败");
}

#pragma mark 网络交互
/**
 *  网络交互
 */
- (void)netWork:(NSString *)searchText
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL: [NSURL URLWithString:[kIP stringByAppendingString:@"queryusers.htm"]]];
    
    request.delegate = self;
    request.requestMethod = @"POST";
    [request setPostValue:searchText forKey:@"username"];
    
    [request startAsynchronous];
}

#pragma mark - tableview delegate
#pragma mark 显示行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return myAddFriendData.count;
}

#pragma mark 显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZQAddFriendTabCell *cellAF = [tableView dequeueReusableCellWithIdentifier:@"cellAF"];
    
    if (!cellAF) {
        cellAF = [[[NSBundle mainBundle] loadNibNamed:@"ZQAddFriendTabCell" owner:nil options:nil] lastObject];
    }
    
    NSDictionary *backDict = [myAddFriendData objectAtIndex:indexPath.row];
    
    cellAF.adduserNameTextF.text = [backDict objectForKey:@"username"];
    cellAF.addtimeTextF.text = [backDict objectForKey:@"createTime"];
    cellAF.friendDict = backDict;
    
    NSString *urlStr = [NSString stringWithFormat:@"01%d.jpg",arc4random() % 5];
    
    cellAF.adduserImgView.image = [UIImage imageNamed:urlStr];
    [cellAF.addBtn setTitle:[backDict objectForKey:@"status"] forState:UIControlStateNormal];
    
    return cellAF;
}

#pragma mark 搜索框的取消按钮点击事件
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar endEditing:YES];
    [self netWork:addsearchBar.text];
    [self startActive];
    [self setTitle:@"正在搜索..."];
}

#pragma mark 搜索框的搜索按钮点击事件
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self startActive];
    [self netWork:addsearchBar.text];
    [searchBar endEditing:YES];
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
