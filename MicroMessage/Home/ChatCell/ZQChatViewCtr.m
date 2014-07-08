//
//  ZQChatViewCtr.m
//  MicroMessage
//
//  Created by jky-group on 14-7-7.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import "ZQChatViewCtr.h"
#import "ZQChatTabCell.h"

@interface ZQChatViewCtr ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>

@end

@implementation ZQChatViewCtr

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
    chatTextF.delegate = self;
    
    self.navigationController.visibleViewController.title = [self.friendDict objectForKey:@"username"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getMessage:) name:@"message" object:nil];
    
    myDataMArr = [NSMutableArray array];
    chatView.layer.borderWidth = 1;
    chatView.layer.borderColor = [[UIColor whiteColor] CGColor];
    chatTextF.returnKeyType = UIReturnKeySend;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAppear:) name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDismiss:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *contentC = [myDataMArr objectAtIndex:indexPath.row];
    CGSize contentSize = [contentC sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(200, 100)];
    
    if (contentSize .height < 50)
        return 50;
   else
       return  contentSize.height + 10;
}

#pragma mark 表格显示的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return myDataMArr.count;
}

#pragma mark 表格显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZQChatTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellF"];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZQChatTabCell" owner:nil options:nil] lastObject];
    }
    
    cell.myConten = [myDataMArr objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark 通知键盘出现
- (void)keyboardAppear:(NSNotification *)notification
{
    // 1.动画的时间
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
     // 2.1.取出键盘的frame
    NSValue *rectValue = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [rectValue CGRectValue];
    
    // 2.2.让整个控制器的view往上挪动一个键盘的高度
    CGFloat ty = - keyboardRect.size.height;
    
    // 2.执行动画
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, ty);
    }];
}

#pragma mark 通知键盘消失
- (void)keyboardDismiss:(NSNotification *)notification
{
    // 1.动画的时间
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 2.执行动画
    [UIView animateWithDuration:duration animations:^{
        // 回到默认位置（清空所有的transform效果）
        self.view.transform = CGAffineTransformIdentity;
    }];
}

#pragma mark 发送消息
- (void)SendMessage
{
    [self sendTextMessageToServer:chatTextF.text];
    [chatTextF resignFirstResponder];
    chatTextF.text = @"";
    return ;
}

/**
 *  发送文字
 *  send ideography
 */
#pragma mark 发送文字
- (void)sendTextMessageToServer:(NSString *)contentC
{
    ASIFormDataRequest *requset = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:[kIP stringByAppendingString:@"send_message.htm"]]];
    
    requset.delegate = self;
    requset.requestMethod = @"POST";
    [requset setPostValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"id"] forKey:@"fromUserId"];
    [requset setPostValue:[self.friendDict objectForKey:@"id"] forKey:@"toUserId"];
    [requset setPostValue:@"0" forKey:@"messageType"];
    [requset setPostValue:contentC forKey:@"textMsg"];
    
    /**
     *  这个传送二进制文件(图片和音频)
     */
    [requset setData:[NSData data] forKey:@"binaryMsg"];
    [requset startAsynchronous];
    
    [myDataMArr addObject:contentC];
    [chatTabView reloadData];
}

#pragma mark 文本视图改变事件
- (void)textViewDidChange:(UITextView *)textView
{
    // 判断是否含有换行符
    if ([textView.text rangeOfString:@"\n"].location != NSNotFound) {
        ZQLog(@"send点击发送键");
        if (textView.text == nil)
            textView.text = @" ";
        
        [self sendTextMessageToServer:textView.text];
        [textView resignFirstResponder];
        textView.text = @"";
        
        return ;
    }
}

#pragma mark 网络请求结束
- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSDictionary *backDict = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableLeaves error:nil];
    
    if ([[backDict objectForKey:@"success"] intValue] == 1) {
        ZQLog(@"发送成功,数据添加至数据库");
    }
}

#pragma mark 消息接收器  先建立再关联起来
- (void)getMessage:(NSNotification *)noctification
{
    NSArray *array = [noctification object];
    
    if (array && array.count > 0) {
        NSDictionary *infoDict = [array objectAtIndex:0];
        
        if ([[infoDict objectForKey:@"senderId"] isEqualToString:[self.friendDict objectForKey:@"id"]]) {
            [myDataMArr addObject:[infoDict objectForKey:@"textMsg"]];
            [chatTabView reloadData];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
