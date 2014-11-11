//
//  HomePageTableViewController.h
//  Anjuke
//
//  Created by 8025 on 14/11/3.
//  Copyright (c) 2014年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageTableViewController : UITableViewController
-(void)refreshData;                                               //刷新数据
@property(nonatomic,strong)UIButton *     regionBut;              //选择地区按钮
@property(nonatomic,strong)NSString *     cityID;                 //城市ID
@property(nonatomic,strong)NSString *     cityName;               //城市名字
@property(nonatomic,strong)NSDictionary * dataSource;             //数据源
@end
