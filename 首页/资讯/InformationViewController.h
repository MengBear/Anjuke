//
//  InformationViewController.h
//  Aujuke
//
//  Created by 8025 on 14/11/7.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSString *     cityID;                 //城市ID
@property(nonatomic,strong)NSMutableArray * dataSource;             //数据源
@property(nonatomic,strong)NSString *     cityName;               //城市名字
@property(nonatomic,strong)UITableView *  tableView;
@end
