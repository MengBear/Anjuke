//
//  NewHouseDetail.h
//  Aujuke
//
//  Created by 6006 on 14-11-5.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewHouseDetail : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSString *PROPOID;
@property (nonatomic,strong)NSDictionary *DetailData;
@property (nonatomic,strong)NSArray *Imagedata;
@end
