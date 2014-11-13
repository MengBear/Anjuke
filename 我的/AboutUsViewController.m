//
//  AboutUsViewController.m
//  Aujuke
//
//  Created by 8025 on 14/11/6.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GetDatasource];
    [self CreateTableView];
   
    // Do any additional setup after loading the view.
}


#pragma mark - 获得数据源
-(void)GetDatasource
{
    NSString * path = [[NSBundle mainBundle]pathForResource:@"HtmlData" ofType:@"plist"];
    NSDictionary * dic = [[NSDictionary alloc]initWithContentsOfFile:path];
    self.dataSource = dic[@"about"];
    NSLog(@"%@",self.dataSource[0][@"text"]);
}

#pragma mark - 创建tableView
-(void)CreateTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, ScreenWidth - 20, 200) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * duilie = @"duilie1";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:duilie];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:duilie];
    }
    cell.textLabel.text = self.dataSource[indexPath.row][@"text"];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize se = CGSizeMake(ScreenWidth - 20, 1000);
    NSString * string = self.dataSource[indexPath.row][@"text"];
    NSDictionary *attrbute = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    CGSize size = [string boundingRectWithSize:se options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrbute context:nil].size;
    return size.height;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
