//
//  Building.m
//  Aujuke
//
//  Created by 6006 on 14-11-10.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "Building.h"
#import "UIImageView+WebCache.h"
#import "Createtool.h"
#import "BuildingDetaild.h"
#define ViewWidth self.view.frame.size.width
@interface Building ()

@end

@implementation Building

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.leftBarButtonItem = [Createtool createBack:self];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
 
    
    self.BulidData = [GainDataSource shuJuYuan:HotHouses((@"12"),1,20)][@"result"][@"rows"];
    
}
-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = YES;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"!!!!%lu",(unsigned long)self.BulidData.count);
    return self.BulidData.count;
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
    NSDictionary * dic = self.BulidData[indexPath.row];
    NSString *str = [NSString stringWithFormat:@"%@  %@",dic[@"region_title"],dic[@"address"]];
//    NSString *str1 = [NSString stringWithFormat:@"%@%@平米",dic[@"room_alias"],dic[@"prop_area"]];
    NSString *str2 = [NSString stringWithFormat:@"%@元/平",dic[@"price"]];
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(125, 0, ViewWidth -130, 30)];
    UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(125, 30,ViewWidth -130, 30)];
    UILabel *lable3 = [[UILabel alloc]initWithFrame:CGRectMake(125, 60,(ViewWidth -230), 30)];
    UILabel *lable4 = [[UILabel alloc]initWithFrame:CGRectMake((ViewWidth-230)+125,60,(ViewWidth -230),30)];
    lable2.font = [UIFont systemFontOfSize:15];
    lable4.textColor = [UIColor redColor];
    lable3.adjustsFontSizeToFitWidth = YES;
    lable4.adjustsFontSizeToFitWidth = YES;
    
    lable1.text = dic[@"loupan_name"];
    if ([str2 isEqualToString:@"0元/平"])
    {
      lable4.text = @"售价待定";
    }
    else
    {
        lable4.text = str2;
    }
    lable2.text = str;
    lable3.text = dic[@""];
    
    [cell.contentView addSubview:lable1];
    [cell.contentView addSubview:lable2];
    [cell.contentView addSubview:lable3];
    [cell.contentView addSubview:lable4];
    
    //图片下载
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(5,5, 115, 85)];
    [cell.contentView addSubview:imageview];
    
    [imageview sd_setImageWithURL:[NSURL URLWithString:dic[@"default_image"]]placeholderImage:[UIImage imageNamed:@"aufang_46.png"]];
    
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 5);
    return cell;
}
#pragma mark -返回cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BuildingDetaild *BD = [BuildingDetaild new];
    BD.HousesID = self.BulidData[indexPath.row][@"loupan_id"];
    [self.navigationController pushViewController:BD animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
