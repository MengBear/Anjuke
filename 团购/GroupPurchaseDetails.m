//
//  GroupPurchaseDetails.m
//  Tuangou
//
//  Created by 6006 on 14-11-3.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "GroupPurchaseDetails.h"
#import "UIImageView+WebCache.h"
#import "Createtool.h"

#define ViewWidth self.view.frame.size.width
@interface GroupPurchaseDetails ()
@end

@implementation GroupPurchaseDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [Createtool createBack:self];
    
    self.ImagesData = self.ReceiveData[@"images"];
    
    [self HeadView];
}
-(void)HeadView
{
    UIScrollView *scroview2 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,ViewWidth, 180)];
    scroview2.contentSize = CGSizeMake(self.ImagesData.count * ViewWidth, 180);
    self.tableView.tableHeaderView = scroview2;
    
    for (int i = 0; i < self.ImagesData.count; i++) {
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake((ViewWidth * i),0,ViewWidth, 180)];
        
        [imageview sd_setImageWithURL:self.ImagesData[i] placeholderImage:[UIImage imageNamed:@"aifang_46.png"]];
        [scroview2 addSubview:imageview];
        
    }
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 30;
    self.tableView.tableHeaderView = scroview2;
}
-(void)back:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}
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
    switch (indexPath.row)
    {
        case 0:
        {
            UIView *view0 = [[UIView alloc]initWithFrame:CGRectMake(5, 0,ViewWidth-10,90)];
            view0.layer.borderWidth = 5;
            view0.layer.borderColor = [UIColor whiteColor].CGColor;
            view0.layer.cornerRadius = 8;
            UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5,0,ViewWidth-10,30)];
            NSString * str = [NSString stringWithFormat:@"%@【%@】",self.ReceiveData[@"loupan_name"],self.ReceiveData[@"act_rebate"]];
            lable.text = str;
            lable.font = [UIFont systemFontOfSize:18];
            
            UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(10,30,ViewWidth-20,40)];
            lable2.text = self.ReceiveData[@"mb_sale"];
            lable2.font = [UIFont systemFontOfSize:15];
            lable2.numberOfLines = 0;
            [view0 addSubview:lable];
            [view0 addSubview:lable2];
            [cell.contentView addSubview:view0];
        }
            break;
        case 1:
        {
            UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(5,0,ViewWidth-10,90)];
            view1.layer.borderWidth = 5;
            view1.layer.cornerRadius = 8;
            view1.layer.borderColor = [UIColor whiteColor].CGColor;
            
            UILabel *labletitle = [[UILabel alloc]initWithFrame:CGRectMake(10,10,ViewWidth-10,15)];
            labletitle.text = @"楼盘信息:";
            labletitle.adjustsFontSizeToFitWidth = YES;
            
            NSString * str2 = [NSString stringWithFormat:@"%@ %@",self.ReceiveData[@"region_name"],self.ReceiveData[@"sub_region_name"]];
            NSString * str1 = [NSString stringWithFormat:@" 楼盘名称:%@\n 楼盘售价:%@\n 区域板块:%@",self.ReceiveData[@"loupan_name"],self.ReceiveData[@"avg_price"],str2];
          
            UILabel *lable3 = [[UILabel alloc]initWithFrame:CGRectMake(5,25,ViewWidth-10,60)];
            lable3.text = str1;
            lable3.numberOfLines = 0;
            lable3.adjustsFontSizeToFitWidth = YES;
            lable3.font = [UIFont systemFontOfSize:15];
            [view1 addSubview:lable3];
            [view1 addSubview:labletitle];
            [cell.contentView addSubview:view1];
        }
            break;
        case 2:
        {
            cell.textLabel.text = @"查看楼盘详情";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
        case 3:
        {
            UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(5,0, ViewWidth-10, 190)];
            view2.layer.borderWidth = 5;
            view2.layer.borderColor = [UIColor whiteColor].CGColor;
            view2.layer.cornerRadius = 8;
            UILabel *lable31 = [[UILabel alloc]initWithFrame:CGRectMake(5,5,ViewWidth-15,30)];
            NSString * str3 = [NSString stringWithFormat:@"地址:%@",self.ReceiveData[@"address"]];
            lable31.text = str3;
            lable31.adjustsFontSizeToFitWidth = YES;
            lable31.numberOfLines = 0;
            lable31.font = [UIFont systemFontOfSize:15];
            [view2 addSubview:lable31];
            [cell.contentView addSubview:view2];
        }
            break;
        case 4:
        {
            cell.textLabel.text = @"查看路线";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
        default:
            break;
    }
    cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 10);
    return cell;
}
//根据情况返回每个cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            return 95;
        }
            break;
        case 1:
        {
            return 90;
        }
            break;
        case 2:
        {
            return 40;
        }
            break;
        case 3:
        {
            return 190;
        }
            break;
        default:
            break;
    }
    return 40;
}
//选中某个cell触发的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 2)
    {
        NSLog(@"push 楼盘详细页面");
    }
    else if(indexPath.row == 4)
    {
        NSLog(@"push 地图");
    }
}

-(void)map
{
    _mapview = [[MKMapView alloc]initWithFrame:CGRectMake(0,30,self.tableView.frame.size.width-20, 140)];
    
    BOOL isEnable = [CLLocationManager locationServicesEnabled];
    if (isEnable)
    {
        //定位服务
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        //8.0后需求
        [_locationManager requestAlwaysAuthorization];
        //定位的属性设置
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;//定位的精准度
        _locationManager.distanceFilter = 100;//单位是米
        _locationManager.activityType =  CLActivityTypeAutomotiveNavigation;//导航类型
        //开启导航
        [_locationManager startUpdatingLocation];
        //开启方向导航
        [_locationManager startUpdatingHeading];
        
        _mapview.mapType =  MKMapTypeStandard;
        _mapview.showsBuildings = YES;
        _mapview.showsPointsOfInterest = YES;
        _mapview.showsUserLocation = YES;
        
        _mapview.zoomEnabled = YES;
        _mapview.scrollEnabled = YES;
        //跟踪模式：无，跟踪位置，跟踪位置和方向角
        [_mapview setUserTrackingMode:MKUserTrackingModeFollowWithHeading animated:YES];
        
        _mapview.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(+[self.ReceiveData[@"baidu_lat"] intValue], +[self.ReceiveData[@"baidu_lng"] intValue]), MKCoordinateSpanMake(0.5, 0.5));
        _mapview.delegate = self;
    }
    else
    {
        UIAlertView * al = [[UIAlertView alloc]initWithTitle:@"提示" message:@"定位服务不可用" delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [al show];
    }
}
@end
