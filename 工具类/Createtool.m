//
//  Createtool.m
//  食材简谱
//
//  Created by 6006 on 14-10-16.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "Createtool.h"
#import "NewHouse.h"
@implementation Createtool
+(UIBarButtonItem *)createBack:(UIViewController *)vc
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 15, 25);
    [btn setImage:[UIImage imageNamed:@"details_arrow_left.png"] forState:UIControlStateNormal];
      [btn addTarget:vc action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * bar = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return bar;
}
@end
