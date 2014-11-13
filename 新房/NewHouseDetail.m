//
//  NewHouseDetail.m
//  Aujuke
//
//  Created by 6006 on 14-11-5.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "NewHouseDetail.h"
#import "UIImageView+WebCache.h"
#import "Createtool.h"
#define ViewWidth self.view.frame.size.width
@interface NewHouseDetail ()

@end

@implementation NewHouseDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [Createtool createBack:self];
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //接收数据
    self.DetailData = [GainDataSource shuJuYuan:GainHousesParameter(self.PROPOID)];
    
    //表头图片的数据
    self.Imagedata = self.DetailData[@"result"][@"yangbanjian"];
    
    [self Headview];
}
-(void)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 表头
-(void)Headview
{
    UIScrollView *scroview2 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,ViewWidth, 180)];
    scroview2.pagingEnabled = YES;
    scroview2.contentSize = CGSizeMake(self.Imagedata.count * ViewWidth, 180);
    self.tableView.tableHeaderView = scroview2;
    
    for (int i = 0; i < self.Imagedata.count; i++) {
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake((ViewWidth * i),0,ViewWidth, 180)];
        
        [imageview sd_setImageWithURL:self.Imagedata[i][@"model_url"] placeholderImage:nil];
        [scroview2 addSubview:imageview];

    }
}
#pragma mark - 返回区和行
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 9;
}
#pragma mark - cell的设置

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *indexqueue = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indexqueue];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:indexqueue];
    }
    else
    {
        for(UIView *subview in cell.contentView.subviews)
        {
            [subview removeFromSuperview];
        }
    }
    switch (indexPath.row)
    {
        case 0:
        {
            UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 0,ViewWidth -20, 50)];
            UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 50,ViewWidth -20, 30)];
            NSString *str1 = [NSString stringWithFormat:@"总价:%@万",self.DetailData[@"result"][@"prop_max_price"]];
            
            lable1.text = self.DetailData[@"result"][@"prop_title"];
            lable1.numberOfLines = 0;
            lable1.adjustsFontSizeToFitWidth = YES;
            lable1.font = [UIFont systemFontOfSize:20];
            
            lable2.text = str1;
            lable2.textColor = [UIColor redColor];
            lable2.font = [UIFont systemFontOfSize:15];
            lable2.adjustsFontSizeToFitWidth = YES;
            [cell.contentView addSubview:lable2];
            [cell.contentView addSubview:lable1];
        }
            break;
        case 1:
        {
            [cell.contentView addSubview:[self CreatCell2Uiview]];
        }
            break;
        case 2:
        {
            UILabel *lable10 = [[UILabel alloc]initWithFrame:CGRectMake(10, 0,(ViewWidth -20)/2, 30)];
            NSString *str9 = [NSString stringWithFormat:@"楼盘:%@",self.DetailData[@"result"][@"loupan_name"]];
            lable10.text = str9;
            lable10.adjustsFontSizeToFitWidth = YES;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            [cell.contentView addSubview:lable10];
        }
            break;
        case 3:
        {
            UILabel *lable11 = [[UILabel alloc]initWithFrame:CGRectMake(10, 0,(ViewWidth -20)/2, 30)];
            NSString *str10 = [NSString stringWithFormat:@"地址:%@",self.DetailData[@"result"][@"address"]];
            lable11.text = str10;
            lable11.adjustsFontSizeToFitWidth = YES;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            [cell.contentView addSubview:lable11];
        }
            break;
        case 4:
        {
            UILabel *lable12 = [[UILabel alloc]initWithFrame:CGRectMake(10, 0,(ViewWidth -20)/2, 30)];
            lable12.text = @"查看本楼盘全部房源";
            lable12.adjustsFontSizeToFitWidth = YES;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
            [cell.contentView addSubview:lable12];
        }
            break;
        case 5:
        {
            UILabel *lable13 = [[UILabel alloc]initWithFrame:CGRectMake(10, 0,(ViewWidth -20),90)];
            NSString *str11 = [NSString stringWithFormat:@"新房详情:\n%@",self.DetailData[@"result"][@"prop_desc"]];
            lable13.text = str11;
            lable13.numberOfLines = 0;
            lable13.adjustsFontSizeToFitWidth = YES;
            [cell.contentView addSubview:lable13];
        }
            break;
        case 6:
        {
            [cell.contentView addSubview:[self CreateCell67Uiimageview:self.DetailData[@"result"][@"huxing"][0][@"huxing_url"] Name:@"楼盘户型图:" viewheight:210]];
        }
            break;
        case 7:
        {
            [cell.contentView addSubview:[self CreateCell67Uiimageview:self.DetailData[@"result"][@"buildingsplan"][0][@"url"] Name:@"房源位置图:" viewheight:210]];
        }
            break;
        case 8:
        {
            [cell.contentView addSubview:[self CreateCell67Uiimageview:self.DetailData[@"result"][@"proppos"][0][@"url"] Name:@"楼层位置图:" viewheight:120]];
        }
            break;
        default:
            break;
    }
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 10);
    return cell;
}
#pragma mark - row的高度设置
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            return 90;
        }
            break;
        case 1:
        {
            return 120;
        }
            break;
        case 5:
        {
            return 90;
        }
            break;
        case 6:
        {
            return 215;
        }
            break;
        case 7:
        {
            return 215;
        }
            break;
        case 8:
        {
            return 125;
        }
            break;
        default:
            break;
    }
    return 40;
}
#pragma mark - row2的设置
-(UIView *)CreatCell2Uiview
{
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(5,0, ViewWidth-10, 120)];
    
    UILabel *lable3 = [[UILabel alloc]initWithFrame:CGRectMake(5, 0,(ViewWidth -10)/2, 30)];
    NSString *str2 = [NSString stringWithFormat:@"房型:%@",self.DetailData[@"result"][@"rooms_string"]];
    lable3.text = str2;
    lable3.adjustsFontSizeToFitWidth = YES;
    
    UILabel *lable4 = [[UILabel alloc]initWithFrame:CGRectMake(5+(ViewWidth -10)/2, 0,(ViewWidth -10)/2, 30)];
    NSString *str3 = [NSString stringWithFormat:@"面积:%@平米",self.DetailData[@"result"][@"prop_area"]];
    lable4.text = str3;
    lable4.adjustsFontSizeToFitWidth = YES;
    
    UILabel *lable5 = [[UILabel alloc]initWithFrame:CGRectMake(5,30,(ViewWidth -10)/2, 30)];
    NSString *str4 = [NSString stringWithFormat:@"楼号:%@",self.DetailData[@"result"][@"prop_num"]];
    lable5.text = str4;
    lable5.adjustsFontSizeToFitWidth = YES;
    
    UILabel *lable6 = [[UILabel alloc]initWithFrame:CGRectMake(5+(ViewWidth -10)/2, 30,(ViewWidth -10)/2, 30)];
    NSString *str5 = [NSString stringWithFormat:@"装修:%@",self.DetailData[@"result"][@"prop_fitment"]];
    lable6.text = str5;
    lable6.adjustsFontSizeToFitWidth = YES;
    
    UILabel *lable7 = [[UILabel alloc]initWithFrame:CGRectMake(5, 60,(ViewWidth -10)/2, 30)];
    lable7.adjustsFontSizeToFitWidth = YES;
    if ([self.DetailData[@"result"][@"kaipan_date"] isEqualToString:@""])
    {
        lable7.text = @"开盘:待定";
    }
    else
    {
        NSString *str6 = [NSString stringWithFormat:@"开盘:%@",self.DetailData[@"result"][@"kaipan_date"]];
        lable7.text = str6;
    }

    UILabel *lable8 = [[UILabel alloc]initWithFrame:CGRectMake(5+(ViewWidth -10)/2, 60,(ViewWidth -10)/2, 30)];
    NSString *str7 = [NSString stringWithFormat:@"入住:%@",self.DetailData[@"result"][@"jiaofang_date"]];
    lable8.text =str7;
    lable8.adjustsFontSizeToFitWidth = YES;
  
    UILabel *lable9 = [[UILabel alloc]initWithFrame:CGRectMake(5,90,ViewWidth -10, 30)];
    NSString *str8 = [NSString stringWithFormat:@"楼层:总共%@层",self.DetailData[@"result"][@"prop_total_floor"]];
    lable9.text = str8;
    lable9.adjustsFontSizeToFitWidth = YES;
    
    [view1 addSubview:lable3];
    [view1 addSubview:lable4];
    [view1 addSubview:lable5];
    [view1 addSubview:lable6];
    [view1 addSubview:lable7];
    [view1 addSubview:lable8];
    [view1 addSubview:lable9];
    
    return view1;
}
#pragma mark - row6,7的设置
-(UIView *)CreateCell67Uiimageview:(NSString *)url Name:(NSString *)name viewheight:(CGFloat)viewheight
{
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(5, 0, ViewWidth-10,viewheight)];
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(5,30,ViewWidth -20,viewheight-30)];
    imageview.backgroundColor = [UIColor blackColor];
    imageview.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TouchImageView:)];
    tap.numberOfTapsRequired = 1;
    [imageview addGestureRecognizer:tap];
    
    UILabel *lable14 = [[UILabel alloc]initWithFrame:CGRectMake(5,0,(ViewWidth -10),30)];
    lable14.text = name;
    
    [imageview  sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed: @"aifang_46.png"]];
//    NSLog(@"%lf",imageview.image.size.width);
    
    [view2 addSubview:lable14];
    [view2 addSubview:imageview];
    return view2;
}
#pragma mark - row6,7单击手势触发的方法
-(void)TouchImageView:(UIGestureRecognizer *)sender
{
//    NSLog(@"sender==%@",sender);

    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 180)];
    imageView = (UIImageView *)sender.view;
    imageView.center = CGPointMake(ScreenWidth/2, ScreenHeight/2);
    
//    NSLog(@"imagevie===%@",imageView);
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TouchImageView2:)];
    tap1.numberOfTapsRequired = 1;
    //捏合手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    
    [imageView addGestureRecognizer:pinch];
    [imageView addGestureRecognizer:tap1];
    
    

    UIScrollView *scroview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    scroview.backgroundColor = [UIColor blackColor];
    scroview.tag = 1;
    [scroview addSubview:imageView];
    [self.view addSubview:scroview];

}
#pragma mark - 单击图片后给图片的一个单击方法
-(void)TouchImageView2:(UIGestureRecognizer *)sender
{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
//    UIScrollView *sc = (UIScrollView *)[self.view viewWithTag:1];
//    [sc removeFromSuperview];
//    [self viewDidLoad];
    
    [self viewDidLoad];
}
#pragma mark - 捏合手势放大方法
-(void)pinch:(UIPinchGestureRecognizer *)sender
{
//    NSLog(@"捏合");
    UIImageView *imageview = (UIImageView *)sender.view;
    //放大
    imageview.transform = CGAffineTransformMakeScale(sender.scale, sender.scale);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
