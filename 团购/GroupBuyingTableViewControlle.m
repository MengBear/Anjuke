//
//  GroupBuyingTableViewControlle.m
//  Tuangou
//
//  Created by 6006 on 14-11-3.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "GroupBuyingTableViewControlle.h"
#import "GainDataSource.h"
#import "GroupPurchaseDetails.h"
#define Width self.view.frame.size.width //Imagevie上面lable的宽度
#define ViewWidth view.frame.size.width //view的宽度
#define ImageviewWidth imageview.frame.size.width //imageview的宽度
@interface GroupBuyingTableViewControlle ()
{
    GroupPurchaseDetails * vc;
}
@end

@implementation GroupBuyingTableViewControlle
#pragma mark - 自定义标题NavigationItem
-(void)titleNavigationItem
{
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.text = @"团购";
    titleLabel.font = [UIFont italicSystemFontOfSize:20];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self titleNavigationItem];//刷新数据
//    //定义导航栏背景
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"anjuke61price_home3@2x"]forBarMetrics:UIBarMetricsDefault];
    if (!self.cityID)
    {
        self.cityID = @"12";
    }
    [self refreshData];
}

#pragma mark - 刷新数据
-(void)refreshData
{
    //接收数据
    _Receivedata = [GainDataSource shuJuYuan:GroupBuying(self.cityID, self.cityID)];
    _GroupBuyingData = _Receivedata[@"result"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return _GroupBuyingData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * Indexqueue = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Indexqueue];
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
    NSDictionary * dic = _GroupBuyingData[indexPath.section];
    NSString * str = [NSString stringWithFormat:@"【%@】%@",dic[@"loupan_name"],dic[@"mb_sale"]];
   
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(5,0,Width-10,270)];
    view.layer.borderColor = [UIColor whiteColor].CGColor;
    view.layer.cornerRadius = 8;
    view.layer.borderWidth = 5;
    
    
    UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(5,0,ViewWidth-10,50)];
    lable.numberOfLines = 0;
    lable.adjustsFontSizeToFitWidth = YES;
    lable.text = str;
    UIImage * image = [UIImage imageNamed:@"aifang_46.png"];
    UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(5,50,ViewWidth-10, 150)];
    imageview.image = image;
   
    [imageview sd_setImageWithURL:dic[@"cover_image"] placeholderImage:image];
    
    UILabel * lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0,130,ImageviewWidth/2,20)];
    NSString * str1 = [NSString stringWithFormat:@"均价:%@",dic[@"avg_price"]];
    lable1.text = str1;
    lable1.adjustsFontSizeToFitWidth = YES;
    lable1.backgroundColor = [UIColor grayColor];
    lable1.alpha = 0.8;
    
    UILabel * lable2 = [[UILabel alloc]initWithFrame:CGRectMake(ImageviewWidth/2,130,ImageviewWidth/2,20)];
    NSString * str2 = [NSString stringWithFormat:@"区域:%@",dic[@"region_name"]];
    lable2.text = str2;
    lable2.adjustsFontSizeToFitWidth = YES;
    lable2.textAlignment = NSTextAlignmentRight;
    lable2.backgroundColor = [UIColor grayColor];
    lable2.alpha = 0.8;
    
    
 
    
    UILabel * lable3 = [[UILabel alloc]initWithFrame:CGRectMake(5,200,ViewWidth/2,25)];
    NSString * str3 = [NSString stringWithFormat:@"%@人已报名",dic[@"join_num"]];
    lable3.text = str3;
    lable3.adjustsFontSizeToFitWidth = YES;
    lable3.font = [UIFont systemFontOfSize:13];
 
    UILabel * lable4 = [[UILabel alloc]initWithFrame:CGRectMake(5,225,ViewWidth,25)];
    NSString * str4 = [NSString stringWithFormat:@"结束时间:%@",dic[@"date_end"]];
    lable4.text = str4;
    lable4.adjustsFontSizeToFitWidth = YES;
    lable4.font = [UIFont systemFontOfSize:13];
    
    UILabel * lable5 = [[UILabel alloc]initWithFrame:CGRectMake(ViewWidth/2,200,ViewWidth/2,50)];
    NSString * str5 = [NSString stringWithFormat:@"%@",dic[@"act_rebate"]];
    lable5.text = str5;
    lable5.numberOfLines = 0;
    lable5.adjustsFontSizeToFitWidth = YES;
    lable5.textColor = [UIColor redColor];
    lable5.textAlignment = NSTextAlignmentCenter;
    lable5.font = [UIFont systemFontOfSize:20];
   
    [view addSubview:lable];
    [view addSubview:lable3];
    [view addSubview:lable4];
    [view addSubview:lable5];
    [view addSubview:imageview];
    [imageview addSubview:lable1];
    [imageview addSubview:lable2];
    [cell.contentView addSubview:view];
    
    
    cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return cell;
}
-(void)updateCell:(NSIndexPath *)sender
{
    UITableView * tableView = (UITableView *)[self.view viewWithTag:20];
    NSArray * array = [tableView indexPathsForVisibleRows];
//    NSLog(@"array = %@",array);
    for (NSIndexPath * indexPath in array)
    {
        if (indexPath.row == sender.row)
        {
            [tableView reloadRowsAtIndexPaths:@[sender] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        }
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 270;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"%ld",(long)indexPath.section);
    vc = [GroupPurchaseDetails new];
//    vc.Receivesectiokkn = indexPath.section;
    vc.ReceiveData = _GroupBuyingData[indexPath.section];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
