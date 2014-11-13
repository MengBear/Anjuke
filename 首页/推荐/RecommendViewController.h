//
//  RexommendViewController.h
//  Aujuke
//
//  Created by 8025 on 14/11/8.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RecommendViewController : UIViewController
@property(nonatomic,strong)NSString* cityID;                 //城市ID
@property(nonatomic,strong)NSArray * dataSource;             //数据源
@property(nonatomic,strong)NSString* cityName;               //城市名字


@end
