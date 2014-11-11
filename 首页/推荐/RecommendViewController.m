//
//  RexommendViewController.m
//  Aujuke
//
//  Created by 8025 on 14/11/8.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//
/*
 //1.热门新楼盘数据请求  3个参数 <城市ID> <请求的页数> <一次请求可以获取的数据数目> (城市ID存在一个城市信息的plost文件)    在这可以获取楼盘ID号
 #define HotHouses(cityID,pages,amount) [NSString stringWithFormat:@"http://api.aifang.com/m/android/1.3/loupan/list/?api_key=androidkey&city_id=%@&order=rank&page=%d&page_size=%d&sig=aab3cae369360edadd93c87e84be46ee&i=a00000361d1846&m=Android-HUAWEI+C8812&o=C8812-user+4.0.3+GRJ90+C92B950+r0elease-keys&cv=4.2&v=4.0.3&cid=-1&app=a-xinfang&pm=b22&macid=f3cbcd5a6d8df823c6bd667499513de0,",cityID,pages,amount]
 */

#import "RecommendViewController.h"

@interface RecommendViewController ()

@end

@implementation RecommendViewController

#pragma mark - 获取数据
-(void)GetDataSource
{
    self.dataSource = [GainDataSource shuJuYuan:HotHouses(self.cityID, 1, 20)];
    //NSLog(@"%@",self.dataSource);
    NSDictionary * dic = [GainDataSource shuJuYuan:DetailedHouses(@"239315")];
    NSLog(@"%@",dic);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GetDataSource];
    // Do any additional setup after loading the view.
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
