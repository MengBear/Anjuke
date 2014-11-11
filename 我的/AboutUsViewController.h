//
//  AboutUsViewController.h
//  Aujuke
//
//  Created by 8025 on 14/11/6.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutUsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray * dataSource;   //数据源
@property(nonatomic,strong)UITableView * tableView;
- (void)viewDidLoad;
@end
