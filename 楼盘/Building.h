//
//  Building.h
//  Aujuke
//
//  Created by 6006 on 14-11-10.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "ViewController.h"

@interface Building : ViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property(nonatomic ,strong)NSArray *BulidData;
@end
