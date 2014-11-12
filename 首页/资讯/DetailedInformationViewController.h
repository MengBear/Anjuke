//
//  DetailedInformationViewController.h
//  Anjuke
//
//  Created by 8025 on 14/11/11.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedInformationViewController : UIViewController<UIWebViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIWebView * _webView;
    UITableView *  _tableView;
}
@property(nonatomic,strong)NSString * informID;
@property(nonatomic,strong)NSDictionary * dataSource;             //数据源
@end
