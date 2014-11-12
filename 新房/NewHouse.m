//
//  NewHouse.m
//  Aujuke
//
//  Created by 6006 on 14-11-5.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "NewHouse.h"
#import "PopoverView.h"
#import "UIImageView+WebCache.h"
#import "NewHouseDetail.h"
#import "Createtool.h"
#import "HomePageTableViewController.h"
#define ViewWidth self.view.frame.size.width
@interface NewHouse ()
{
    NSMutableArray *first1;
    NSMutableArray *first2;
    NSArray        *first3;
    NSMutableArray *senderarr;
    CGFloat flag;
}
@end

@implementation NewHouse

- (void)viewDidLoad {
    [super viewDidLoad];
    //显示导航栏
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem = [Createtool createBack:self];
    
    //接收数据
    _NHReceivedata = [GainDataSource shuJuYuan:InBridalChamberSearchHouse(@"12",1,20)];
    //摘取数据源
    _NewhouseData = _NHReceivedata[@"result"][@"rows"];
//    NSLog(@"%@",_NewhouseData);
    
    //表头按钮设置
    NSString *path1 = [[NSBundle mainBundle]pathForResource:@"region" ofType:@"plist"];
    NSString *path2 = [[NSBundle mainBundle]pathForResource:@"priceRange" ofType:@"plist"];
    
    first1 = [NSMutableArray new];
    first2 = [NSMutableArray new];
    
    NSDictionary *dic1 = [[NSDictionary alloc]initWithContentsOfFile:path1];
    NSDictionary *dic2 = [[NSDictionary alloc]initWithContentsOfFile:path2];
    
    for (int i = 0; i < [dic1[@"12"]count]; i++)
    {
        [first1 addObject:dic1[@"12"][i][@"region_name"] ];
    }
    for (int i = 0; i < [dic2[@"12"]count]; i++)
    {
        [first2 addObject:dic2[@"12"][i][@"title"]];
    }
    
    first3 = @[@"一室",@"二室",@"三室",@"四室",@"五室以上"];
  
    senderarr = [[NSMutableArray alloc]initWithObjects:@"区域",@"价格",@"户型",nil];

    
    //self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.tableHeaderView = [self CreateChoosebut];
    
    
    
    
    
    
}
-(void)CreateAllData
{

}
-(void)back:(id)sender
{
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark - 表头设置
-(UIView *)CreateChoosebut
{
  
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,ViewWidth,30)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    for (int i = 0; i < 3; i++) {
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.frame = CGRectMake(i*(ViewWidth/3)+5,0,ViewWidth/3-10, 30);
        but.tag = 100 + i;
        [but setImage:[UIImage imageNamed:@"NH_but_zhixiang@2x"] forState:UIControlStateNormal];
        but.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
        [but addTarget:self action:@selector(cilckbut:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *chooselable = [[UILabel alloc]initWithFrame:CGRectMake(i*(ViewWidth/3),0,ViewWidth/3, 30)];
        chooselable.font = [UIFont systemFontOfSize:15];
        chooselable.adjustsFontSizeToFitWidth = YES;
        chooselable.text = senderarr[i];
        chooselable.tag = 200+i;
        chooselable.textAlignment = NSTextAlignmentCenter;
        
        [view addSubview:chooselable];
        [view addSubview:but];
    }
    return view;
}
int num;
#pragma mark - 区头选择按钮设置
-(void)cilckbut:(UIButton *)sender
{
    CGPoint point = CGPointMake(sender.frame.origin.x -100  + sender.frame.size.width/2, sender.frame.origin.y + sender.frame.size.height);
    NSArray *titles = [NSArray new];
    if (sender.tag == 100)
    {
        titles = first1;
    }
    else if(sender.tag == 101)
    {
        titles = first2;
    }
    else
    {
        titles = first3;
    }
    PopoverView *pop = [[PopoverView alloc] initWithPoint:point titles:titles images:nil];
    switch (sender.tag)
    {
        case 100:
        {
            pop.X = 0;
        }
            break;
        case 101:
        {
            pop.X = ViewWidth/3;
        }
            break;
            case 102:
        {
            pop.X = (ViewWidth/3) *2;
        }
            break;
        default:
            break;
    }
    pop.selectRowAtIndex = ^(NSInteger index){
        UILabel *la = (UILabel *)[self.view viewWithTag:sender.tag + 100];
        
        la.text = titles[index];
        
        if (sender.tag == 100)
        {
            num = 0;
        }
        else if(sender.tag == 101)
        {
            num = 1;
        }
        else
        {
            num = 2;
        }
        [senderarr replaceObjectAtIndex:num withObject:titles[index]];

    };
    [pop show];
 
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _NewhouseData.count;
}

#pragma mark - cell的设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Indexqueue = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Indexqueue];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Indexqueue];
    }
    else
    {
        for(UIView *subview in cell.contentView.subviews)
        {
            [subview removeFromSuperview];
        }
    }
    NSDictionary * dic = _NewhouseData[indexPath.row];
    NSString *str = [NSString stringWithFormat:@"%@ %@",dic[@"region_title"],dic[@"loupan_name"]];
    NSInteger m = [dic[@"prop_area"] integerValue];
    NSString *str1 = [NSString stringWithFormat:@"%@ %ld平米",dic[@"room_alias"],m];
    NSString *str2 = [NSString stringWithFormat:@"Top:%@万",dic[@"prop_max_price"]];
  
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(125, 0, ViewWidth -130, 30)];
    UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(125, 30,ViewWidth -130, 30)];
    UILabel *lable3 = [[UILabel alloc]initWithFrame:CGRectMake(125, 60,(ViewWidth -230), 30)];
    UILabel *lable4 = [[UILabel alloc]initWithFrame:CGRectMake((ViewWidth-230)+125,60,(ViewWidth -230),30)];
    lable1.font = [UIFont boldSystemFontOfSize:16];
    lable2.font = [UIFont systemFontOfSize:13];
    lable3.font = [UIFont systemFontOfSize:13];
    lable4.font = [UIFont systemFontOfSize:16];
    lable2.textColor = [UIColor grayColor];
    lable3.textColor = [UIColor grayColor];
    lable4.textColor = [UIColor redColor];
    lable3.adjustsFontSizeToFitWidth = YES;
    lable4.adjustsFontSizeToFitWidth = YES;
    
    lable1.text = dic[@"prop_title"];
    lable2.text = str;
    lable3.text = str1;
    lable4.text = str2;
    [cell.contentView addSubview:lable1];
    [cell.contentView addSubview:lable2];
    [cell.contentView addSubview:lable3];
    [cell.contentView addSubview:lable4];
    
    //图片下载
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(5,5, 115, 85)];
    [cell.contentView addSubview:imageview];
 
    [imageview sd_setImageWithURL:[NSURL URLWithString:dic[@"prop_url"]]placeholderImage:nil];
    
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 5);
    return cell;
}
#pragma mark - cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewHouseDetail *newde = [NewHouseDetail new];
    newde.PROPOID = _NewhouseData[indexPath.row][@"prop_id"];
    [self.navigationController pushViewController:newde animated:YES];
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
