//
//  AboutUsView.m
//  Aujuke
//
//  Created by 8025 on 14/11/7.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "AboutUsView.h"

@implementation AboutUsView

-(id)init
{
//    self = [super init];
//    if (self)
//    {
//        [self GetDatasource];
//        [self viewLayout];
//    }
    return self;
}
//
//#pragma mark - 获得数据源
//-(void)GetDatasource
//{
//    NSString * path = [[NSBundle mainBundle]pathForResource:@"HtmlData" ofType:@"plist"];
//    NSDictionary * dic = [[NSDictionary alloc]initWithContentsOfFile:path];
//    self.dataSource = dic[@"about"];
//    NSLog(@"%@",self.dataSource[0][@"text"]);
//}
//
//-(void)viewLayout
//{
//    self.frame = CGRectMake(0, 0, ScreenWidth, 500);
//    UILabel * textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 500)];
//    textLabel.text = self.dataSource[0][@"text"];
//    textLabel.numberOfLines = 0;
//    [self addSubview:textLabel];
//}

@end
