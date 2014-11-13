//
//  RexommendViewController.m
//  Aujuke
//
//  Created by 8025 on 14/11/8.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//
/*
 //10.查看城市推荐的楼盘 1个参数 <城市ID>
 #define RecommendHouses(cityID) [NSString stringWithFormat:@"http://api.aifang.com/m/android/1.3/loupan/list/?city_id=%@&page=1&page_size=10",cityID]
 */

#import "RecommendViewController.h"

@interface RecommendViewController ()

@end

@implementation RecommendViewController

#pragma mark - 获取数据
-(void)GetDataSource
{
    self.dataSource = [GainDataSource shuJuYuan:RecommendHouses(self.cityID)][@"result"][@"rows"];
    NSLog(@"%@",self.dataSource);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GetDataSource];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)addWaterFollow:(UIButton*)btn
{
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
