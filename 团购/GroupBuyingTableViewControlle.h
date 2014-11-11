//
//  GroupBuyingTableViewControlle.h
//  Tuangou
//
//  Created by 6006 on 14-11-3.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupBuyingTableViewControlle : UITableViewController
{
    NSDictionary * _Receivedata;
    NSArray * _GroupBuyingData;
    NSMutableArray * _images;
}
-(void)refreshData;                                               //刷新数据
@property(nonatomic,strong)NSString * cityID;
@end
