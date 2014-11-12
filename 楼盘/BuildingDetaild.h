//
//  BuildingDetaild.h
//  Aujuke
//
//  Created by 6006 on 14-11-10.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "ViewController.h"

@interface BuildingDetaild : ViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSDictionary *BuildingDetaildData;
@property(nonatomic,strong)NSString *HousesID;
@property(nonatomic,strong)UITableView *TableView;
@end
