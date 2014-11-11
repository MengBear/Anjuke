//
//  CustomNavigationName.m
//  Aujuke
//
//  Created by 8025 on 14/11/10.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "CustomNavigationName.h"

@implementation CustomNavigationName
+(UILabel *)titleNavigationItem:(NSString *)titleName
{
    //UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];

    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 44)];
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.text = titleName;
    titleLabel.font = [UIFont italicSystemFontOfSize:20];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    //[view addSubview:titleLabel];
    return titleLabel;
}
@end
