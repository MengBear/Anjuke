//
//  CityViewController.h
//  Aujuke
//
//  Created by 8025 on 14/11/10.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
}
@property(nonatomic,strong)NSMutableArray * dataSourch;
@end
