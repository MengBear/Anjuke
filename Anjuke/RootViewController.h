//
//  RootViewController.h
//  Anjuke
//
//  Created by 8025 on 14/11/3.
//  Copyright (c) 2014年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>//定位
@interface RootViewController : UITabBarController<CLLocationManagerDelegate>
{
    CLLocationManager * _locationManager;
}
@property(nonatomic,strong)NSString *     cityName;               //城市名字
@end
