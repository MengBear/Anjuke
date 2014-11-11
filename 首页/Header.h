//
//  Header.h
//  Anjuke
//
//  Created by 8025 on 14/11/3.
//  Copyright (c) 2014年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Header : UIView<UIScrollViewDelegate>
{
    UISearchBar * _searchbar;                             //搜索框
    int n;
    UIButton * but;
    UIScrollView * scrollV;
}
@property(nonatomic,strong)UIButton * regionBut;         //选择地区按钮

@property(nonatomic,strong)UINavigationController * Navi;
@property(nonatomic,strong)NSString * cityID;
-(id)init:(NSString *)cityName cityID:(NSString *)cityID vc:(UINavigationController *)vc;
@end
