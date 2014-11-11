//
//  RootViewController.m
//  Anjuke
//
//  Created by 8025 on 14/11/3.
//  Copyright (c) 2014年 liang. All rights reserved.
//

#import "RootViewController.h"
#define Num 3
#define tabBarWidth  CGRectGetWidth(self.tabBar.frame)
#define tabBarHeight  CGRectGetHeight(self.tabBar.frame)
#define FontSize  10
@interface RootViewController ()
{
    NSArray * _images1;
    NSArray * _images2;
    NSArray * _string;
    UILabel * _label;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   /// [self location];
    
    NSLog(@"self.cityName = %@",self.cityName);
    _images1= @[[UIImage imageNamed:@"comm_hometab_icon_house@2x"],[UIImage imageNamed:@"comm_map_btn_shop@2x"],[UIImage imageNamed:@"comm_hometab_icon_my@2x"]];
    _images2 = @[[UIImage imageNamed:@"comm_hometab_icon_house_slt@2x"],[UIImage imageNamed:@"comm_map_btn_shop_slt@2x"],[UIImage imageNamed:@"comm_hometab_icon_my_slt@2x"]];
    
    _string = @[@"首页",@"团购",@"我的"];
    
    for (int i = 0; i < Num; i++)
    {
        //图片按钮
        UIButton * but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.frame = CGRectMake(i % Num * tabBarWidth / Num, 0, tabBarWidth / Num, tabBarHeight - 3);
        but.tag = i + 1;
        [but addTarget:self action:@selector(transform:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:but];
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(but.frame) / 2 - FontSize,CGRectGetHeight(but.frame) - FontSize - 2, tabBarWidth / Num, 15)];
        _label.text = _string[i];
        _label.tag = 11 + i;
        _label.font = [UIFont systemFontOfSize:FontSize];
        [but addSubview:_label];
        
        if (i == 0)
        {
            [but setImage:_images2[i] forState:UIControlStateNormal];
            _label.textColor = [UIColor colorWithRed:0/255.0 green:124/255.0 blue:30/255.0 alpha:1];
        }
        else
        {
            [but setImage:_images1[i] forState:UIControlStateNormal];
            _label.textColor = [UIColor grayColor];
        }
    }
}

#pragma marki - 定位
-(void)location
{
    BOOL isEnable = [CLLocationManager locationServicesEnabled];
    if (isEnable)
    {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        [_locationManager requestAlwaysAuthorization];
        _locationManager.distanceFilter = 100;//单位是米
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.activityType =  CLActivityTypeAutomotiveNavigation;//导航类型
        [_locationManager startUpdatingLocation];
        [_locationManager startUpdatingHeading];
    }
    else
    {
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"该设备定位功能不可用" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"不再提示",nil];
        [alertView show];
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@",locations);
}

-(void)locationManager:(CLLocationManager *)manager didFinishDeferredUpdatesWithError:(NSError *)error
{
    NSLog(@"定位失败,错误原因:%@",[error description]);
}
-(void)transform:(UIButton*)sender
{
    UIButton * but1 = (UIButton *)[self.view viewWithTag:1];
    UIButton * but2 = (UIButton *)[self.view viewWithTag:2];
    UIButton * but3 = (UIButton *)[self.view viewWithTag:3];
    UILabel  * lab11 = (UILabel*)[self.view viewWithTag:11];
    UILabel  * lab12 = (UILabel*)[self.view viewWithTag:12];
    UILabel  * lab13 = (UILabel*)[self.view viewWithTag:13];
    
    UILabel  * lab_d = (UILabel*)[self.view viewWithTag:sender.tag + 10];
    [sender setImage:_images2[sender.tag - 1] forState:UIControlStateNormal];
    lab_d.textColor = [UIColor colorWithRed:0/255.0 green:124/255.0 blue:30/255.0 alpha:1];

    switch (sender.tag)
    {
        case 1:
            [but2 setImage:_images1[but2.tag - 1] forState:UIControlStateNormal];
            [but3 setImage:_images1[but3.tag - 1] forState:UIControlStateNormal];
            lab12.textColor = [UIColor grayColor];
            lab13.textColor = [UIColor grayColor];
            break;
        case 2:
            [but1 setImage:_images1[but1.tag - 1] forState:UIControlStateNormal];
            [but3 setImage:_images1[but3.tag - 1] forState:UIControlStateNormal];
            lab11.textColor = [UIColor grayColor];
            lab13.textColor = [UIColor grayColor];
            break;
        case 3:
            [but2 setImage:_images1[but2.tag - 1] forState:UIControlStateNormal];
            [but1 setImage:_images1[but1.tag - 1] forState:UIControlStateNormal];
            lab12.textColor = [UIColor grayColor];
            lab11.textColor = [UIColor grayColor];
            break;
        default:
            break;
    }
    
    self.selectedIndex = sender.tag - 1;
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
