//
//  MineTableViewController.m
//  AnJuKe
//
//  Created by 8025 on 14/11/2.
//  Copyright (c) 2014年 liang. All rights reserved.
//

#import "MineTableViewController.h"
#import "CustomSeparator.h"
#import "Cache.h"
#import "AboutUsViewController.h"
#import "AboutUsView.h"
#define SectionHeightDown      60          //下区高度
#define SectionHeightRight     50          //右区高度
@interface MineTableViewController ()
{
    UITableViewCell *cell;
    BOOL  ScrollSuo;
    UIScrollView * scrllV;
    NSDictionary * textDic;
    int textH;
    UILabel * CellTextLabel;
}
@end

@implementation MineTableViewController

#pragma mark - 自定义标题NavigationItem
-(void)titleNavigationItem
{
    UILabel * titleView = [CustomNavigationName titleNavigationItem:@"我的"];
    self.navigationItem.titleView = titleView;
}

#pragma mark - 自定义分割线
-(void)Separator:(NSInteger)Interval Integer:(NSInteger)Integer //间隔
{

    UIView * separator = [[UIView alloc]initWithFrame:CGRectMake(10,Interval * (Integer+ 1), ScreenWidth - 25, 1)];
    separator.backgroundColor = [UIColor grayColor];
    separator.alpha = 0.1;
    [self.tableView addSubview:separator];
}


#pragma mark - 获得字体数据源
-(void)GetDatasource
{
    NSString * path = [[NSBundle mainBundle]pathForResource:@"HtmlData" ofType:@"plist"];
    textDic = [[NSDictionary alloc]initWithContentsOfFile:path];
    //self.textDataSource = textDic[@"about"];
}


#pragma mark - 获取数据
-(void)GetData
{
    self.MineDataArray = @[@"我的收藏",@"我的团购",@"检查更新",@"清除缓存",@"我要反馈",@"关于我们"];//我的页面的数据
    self.ImageArray = @[@"comm_my_icon13@2x",@"comm_my_icon4@2x",@"comm_my_icon9@2x",@"comm_me_icon_daikan@2x",@"comm_my_icon5@2x",@"comm_my_contact@2x"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //定义导航栏背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"anjuke61price_home5@2x"]forBarMetrics:UIBarMetricsDefault];
    ScrollSuo = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self titleNavigationItem];//自定义标题NavigationItem
    [self GetData];//获取数据
    [self GetDatasource];
    self.tableView.delegate = self;
    
    scrllV = [[UIScrollView alloc]init];
    scrllV.backgroundColor = [UIColor redColor];
    scrllV.frame = CGRectMake(0, 300, ScreenWidth , 0);
    //scrllV.alpha = 0;
    [self.view addSubview:scrllV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return self.MineDataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * duilie = @"duilie1";
    cell = [tableView dequeueReusableCellWithIdentifier:duilie];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:duilie];
    }
    switch (indexPath.section) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 5:
        {
            CGSize se = CGSizeMake(ScreenWidth - 20, 1000);
            NSString * string = self.textDataSource[0][@"text"];
            NSDictionary *attrbute = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
            CGSize size = [string boundingRectWithSize:se options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrbute context:nil].size;
            CellTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, size.height)];
            CellTextLabel.text = string;
            CellTextLabel.numberOfLines = 0;
            [cell.contentView addSubview:CellTextLabel];
        }
            
            break;
            
        default:
            break;
    }
    return cell;
}

#pragma mark - 每个区的布局
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    UIView * view = [[UIView alloc]init];
    UIImage * img = [UIImage imageNamed:self.ImageArray[section]];
    UIImageView * imageView = [[UIImageView alloc]init];
    UILabel * textLabel = [[UILabel alloc]init];
    UIImageView * con = [[UIImageView alloc]init];
    
    view.tag = section + 30;
    con.alpha = 0.5;
    imageView.image = img;
    textLabel.text = self.MineDataArray[section];
    
    CGFloat num = self.MineDataArray.count;
    if (section == 0 || section == 1 || section == num - 1)
    {
        imageView.frame = CGRectMake(10, (SectionHeightDown - img.size.height) / 2, img.size.width, img.size.height);
        textLabel.frame = CGRectMake(20 + CGRectGetWidth(imageView.frame), 0, 300, SectionHeightDown);
        con.frame = CGRectMake(ScreenWidth - 15 - 13, (SectionHeightDown - 8) / 2 , 13, 8);
        con.image = [UIImage imageNamed:@"details_arrow_xia"];
    }
    else
    {
        imageView.frame = CGRectMake(10, (SectionHeightRight - img.size.height) / 2, img.size.width, img.size.height);
        textLabel.frame = CGRectMake(20 + CGRectGetWidth(imageView.frame), 0, 300, SectionHeightRight);
        con.frame = CGRectMake(ScreenWidth - 15 - 9, (SectionHeightRight - 13) / 2 , 9, 13);
        con.image = [UIImage imageNamed:@"details_arrow_you"];
    }
 
    [view addSubview:con];
    [view addSubview:textLabel];
    [view addSubview:imageView];
    
    //单击手势
    UITapGestureRecognizer * danji = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
    danji.numberOfTapsRequired = 1;
    [view addGestureRecognizer:danji];
    return view;
}

#pragma mark - 返回每个区的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0 || section == 1)
    {
        [self Separator:60 Integer:section];
        return SectionHeightDown;
    }
    if (section == self.MineDataArray.count - 1)
    {
        [self Separator:2 * SectionHeightDown + 3 * SectionHeightRight Integer:0];
        [self Separator:3 * SectionHeightDown + 3 * SectionHeightRight Integer:0];
        return SectionHeightDown;
    }
    return SectionHeightRight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
  
    if (indexPath.section == self.MineDataArray.count - 1)
    {
  
            CGSize se = CGSizeMake(ScreenWidth - 20, 1000);
            NSString * string = self.textDataSource[0][@"text"];
            NSDictionary *attrbute = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
            CGSize size = [string boundingRectWithSize:se options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrbute context:nil].size;
            textH = size.height;
        
        return textH;
    }
    return 0;
}

-(void)click:(UITapGestureRecognizer*)sender
{
    NSLog(@"%ld",(long)sender.view.tag);
    
    switch (sender.view.tag)
    {
        case 30:
            
            break;
        case 31:
            
            break;
        case 32:
        {
            UIAlertView * alertV =  [[UIAlertView alloc]initWithTitle:@"软件更新" message:@"\n当前已经是最新版本!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertV show];
        }
            break;
        case 33:
        {
            Cache * cach = [[Cache alloc]initWithTitle:@"清理缓存" message:@"是否要清除您的缓存?" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消",nil];
            [cach show];
            
        }
            break;
        case 34:
            //[self feedback];
            break;
        case 35:
        {
            [self SetScrollView];
            [self.tableView reloadData];
        }
            break;
            
        default:
            break;
    }

}


-(void)SetScrollView
{

    if (ScrollSuo)
    {
        
        [UIView animateWithDuration:1 animations:^{
            self.textDataSource = textDic[@"about"];
            CellTextLabel.text = @"";
        } completion:^(BOOL finished) {
            ScrollSuo = NO;
        }];
        
    }
    else
    {
        [UIView animateWithDuration:1 animations:^{
            self.textDataSource = nil;
            CellTextLabel.text = self.textDataSource[0][@"text"];
        }];
        ScrollSuo = YES;
    }
    
}


#pragma mark - 意见反馈
-(void)feedback
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController * mailCC = [MFMailComposeViewController new];
        [mailCC setSubject:@"意见反馈"];//主题
        [mailCC setToRecipients:@[@"584004409@qq.com"]];
        NSString * str = [[NSString alloc]initWithFormat:@"%@\n%@",@"请将您的意见或建议告诉我们,我们会尽力改进！",@"感谢您宝贵的意见!" ];
        [mailCC setMessageBody:str isHTML:NO];
        
        //邮件发送附件
        NSString * path = [[NSBundle mainBundle]pathForResource:@"555" ofType:@"png"];
        UIImage * image = [[UIImage alloc]initWithContentsOfFile:path];
        NSData * data = UIImageJPEGRepresentation(image, 1);
        [mailCC addAttachmentData:data mimeType:@"image/png" fileName:@"555.png"];
        mailCC.mailComposeDelegate = self;
        [self presentViewController:mailCC animated:YES completion:nil];
    }
}

#pragma mark - 内部邮箱代理方法
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    NSLog(@"%u",result);
    NSString * state = nil;
    switch (result) {
        case MFMailComposeResultCancelled:
            state = @"邮件已取消";
            break;
        case MFMailComposeResultSent:
            state = @"邮件已发送";
            break;
        case MFMailComposeResultFailed:
            state = @"邮件发送失败";
            break;
        case MFMailComposeResultSaved:
            state = @"邮箱已保存";
            break;
        default:
            break;
    }
    
    UIAlertView * alertV = [[UIAlertView alloc]initWithTitle:state message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertV show];
    [controller dismissViewControllerAnimated:YES completion:nil];
}


@end
