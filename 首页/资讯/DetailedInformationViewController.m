//
//  DetailedInformationViewController.m
//  Anjuke
//
//  Created by 8025 on 14/11/11.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "DetailedInformationViewController.h"

@interface DetailedInformationViewController ()
{
    UIApplication * _application ;//网络活动指示器
}
@end

@implementation DetailedInformationViewController

#pragma mark - 获取数据源
-(void)GetDataSource
{
    NSArray * cateIDArr = @[@"1219",@"1220",@"1221",@"1222"];
    for (int i = 0; i < cateIDArr.count; i++)
    {
        self.dataSource = [GainDataSource shuJuYuan:AccessToInformationDetails(cateIDArr[i],self.informID)][@"result"];
        NSLog(@"%@",self.dataSource);
        if (![self.dataSource[@"content"] isEqualToString:@"10000"] && ![self.dataSource[@"content"] isEqualToString:@""] )
        {
            return;
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GetDataSource];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];

//    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, ScreenHeight)];
//    _webView.delegate = self;
//    [_webView loadRequest:[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.dataSource[@"origin_url"]]]];
//    [self.view addSubview:_webView];
    
//    //网络活动指示器
//    _application = [UIApplication sharedApplication];
//    _application.networkActivityIndicatorVisible =YES;
}

//-(void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    _application.networkActivityIndicatorVisible = NO;
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * duilie = @"duilie";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:duilie];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:duilie];
    }
    cell.textLabel.numberOfLines = 0;
    NSLog(@"self.dataSource[content] = %@",self.dataSource[@"content"]);
    UILabel * label = [[UILabel alloc]initWithFrame:self.view.bounds];
    label.numberOfLines = 0;
    label.text  = self.dataSource[@"content"];
    [cell.contentView addSubview:label];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 480;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
