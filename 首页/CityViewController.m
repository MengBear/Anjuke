//
//  CityViewController.m
//  Aujuke
//
//  Created by 8025 on 14/11/10.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "CityViewController.h"
#import "HomePageTableViewController.h"
@interface CityViewController ()

@end

@implementation CityViewController

#pragma mark - 获取数据源
-(void)GetDataSource
{
    NSString * patn = [[NSBundle mainBundle]pathForResource:@"城市信息" ofType:@"plist"];
    NSDictionary * dic  = [[NSDictionary alloc]initWithContentsOfFile:patn];
    self.dataSourch = [NSMutableArray new];
    for (NSString * key  in dic)
    {
        [self.dataSourch addObject:dic[key]];
    }
}

#pragma mark - 头View布局
-(void)HeadViewLayout
{
    //模拟区布局
    UIView * TouView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 70)];
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth,30)];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, ScreenWidth, 30)];
    UILabel * textLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 30, ScreenWidth,40)];
    TouView.backgroundColor = [UIColor whiteColor];
    img.image = [UIImage imageNamed:@"anjuke61price_home4@2x"];
    label.text = @"已选择城市";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:18];
    textLabel.text = @"广州";
    textLabel.font = [UIFont systemFontOfSize:16];
    [img addSubview:label];
    [TouView addSubview:img];
    [TouView addSubview:textLabel];
    [self.view addSubview:TouView];
}

#pragma mark - 自定义返回Bar
-(void)customRetumBar
{
    UIBarButtonItem * bar = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"details_arrow_left.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    bar.tintColor = [UIColor grayColor];
    self.navigationItem.leftBarButtonItem = bar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;//显示导航
    self.navigationItem.hidesBackButton = NO;//隐藏系统返回Bar
    self.navigationItem.titleView = [CustomNavigationName titleNavigationItem:@"切换城市"];//自定义标题
    [self GetDataSource];//获取数据源
    [self HeadViewLayout];//模拟区布局
    [self customRetumBar];
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 134, ScreenWidth, ScreenHeight - 134) style:UITableViewStylePlain];
    _tableView.bounces = NO;//边缘不允许弹跳
    _tableView.showsVerticalScrollIndicator = NO;//隐藏滚动条
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourch.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * duilie = @"duilie";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:duilie];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:duilie];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.text = self.dataSourch[indexPath.row][@"city_name"];
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [UIView new];
    UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth,30)];
    img.image = [UIImage imageNamed:@"anjuke61price_home4@2x"];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, ScreenWidth, 30)];
    label.text = @"所有城市";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:18];
    [img addSubview:label];
    [view addSubview:img];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = @{@"city":self.dataSourch[indexPath.row][@"city_name"]};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SelectCity" object:self userInfo:dic];
  
//    UITabBarController * tabBC = (UITabBarController*)self.view.window.rootViewController;
//    UINavigationController * nv = (UINavigationController*)tabBC.viewControllers[0];
//    HomePageTableViewController * ho = nv.viewControllers[0];
//    [self.navigationController pushViewController:ho animated:YES];
    //HomePageTableViewController * home =
    [self back];
}


-(void)back
{
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController popViewControllerAnimated:YES];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
