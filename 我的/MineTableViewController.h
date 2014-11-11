//
//  MineTableViewController.h
//  AnJuKe
//
//  Created by 8025 on 14/11/2.
//  Copyright (c) 2014年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface MineTableViewController : UITableViewController<UIAlertViewDelegate,MFMailComposeViewControllerDelegate>
@property(nonatomic,strong)NSArray *  MineDataArray;      //我的页面的数据
@property(nonatomic,strong)NSArray * ImageArray;          //图片数组
@property(nonatomic,strong)NSMutableArray * textDataSource;   //数据源
@end
