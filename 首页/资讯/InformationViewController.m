//
//  InformationViewController.m
//  Aujuke
//
//  Created by 8025 on 14/11/7.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "InformationViewController.h"
#import "DetailedInformationViewController.h"
@interface InformationViewController ()


@end

@implementation InformationViewController

#pragma mark - 获取数据源
-(void)GetDataSource
{
    self.dataSource = [NSMutableArray new];
    for (int i = 20;; i = i + 20)
    {
        NSArray * arr = [GainDataSource shuJuYuan:ForMoreInformation(self.cityID, i)][@"result"][@"rows"];
        for (int y = i - 20; y < i; y++)
        {
            if (![arr[y][@"summary"] isEqualToString:@""] && ![arr[y][@"thumb_image"] isEqualToString:@""])
            {
                if (self.dataSource.count < 20)
                {
                    [self.dataSource addObject:arr[y]];
                }
                else
                {
                    return;
                }
            }
        }
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;//显示导航
    self.navigationItem.hidesBackButton = YES;//隐藏系统返回Bar
    self.navigationItem.leftBarButtonItem = [Createtool createBack:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GetDataSource];
    self.navigationItem.titleView = [CustomNavigationName titleNavigationItem:@"资讯"];
    self.navigationController.navigationBarHidden = NO;
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
    //_tableView.separatorInset = UIEdgeInsetsZero;
    [self.view addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * duilie = @"duilie1";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:duilie];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:duilie];
    }
    else
    {
        for(UIView *subview in cell.contentView.subviews)
        {
            [subview removeFromSuperview];
        }

    }

    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 30, 80, 60)];
    [imageView sd_setImageWithURL:self.dataSource[indexPath.row][@"thumb_image"] placeholderImage:[UIImage imageNamed:@"aifang_46.png"]];
    [cell.contentView addSubview:imageView];
    
    UILabel * OneText = [[UILabel alloc]initWithFrame:CGRectMake(10, 3, ScreenWidth - 30, 20)];
    OneText.text = self.dataSource[indexPath.row][@"title"];
    OneText.font = [UIFont boldSystemFontOfSize:15];
    [cell.contentView addSubview:OneText];
    
    UILabel * XiangText = [[UILabel alloc]initWithFrame:CGRectMake(10 + CGRectGetWidth(imageView.frame), 0, ScreenWidth - imageView.frame.origin.x - CGRectGetWidth(imageView.frame) - 10, CGRectGetHeight(imageView.frame))];
    XiangText.text = self.dataSource[indexPath.row][@"summary"];
    XiangText.textColor = [UIColor grayColor];
    XiangText.font = [UIFont systemFontOfSize:13];
    XiangText.numberOfLines = 0;
    [imageView addSubview:XiangText];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailedInformationViewController * detailedInformation = [DetailedInformationViewController new];
    detailedInformation.informID = self.dataSource[indexPath.row][@"id"];
    [self.navigationController pushViewController:detailedInformation animated:YES];
    
}

-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
