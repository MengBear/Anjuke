//
//  InformationViewController.m
//  Aujuke
//
//  Created by 8025 on 14/11/7.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()


@end

@implementation InformationViewController

#pragma mark - 获取数据源
-(void)GetDataSource
{
    NSArray * cateIDArr = @[@"0",@"1219",@"1220",@"1221",@"1222"];    
    self.dataSource = [GainDataSource shuJuYuan:ForMoreInformation(self.cityID, 20)][@"result"][@"rows"];
    NSDictionary * dic = [GainDataSource shuJuYuan:AccessToInformationDetails(cateIDArr[4], @"94293")];
    //NSLog(@"%@",dic);
    //NSLog(@"dic = %@",self.dataSource);
    NSLog(@"%@",dic[@"result"][@"content"]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GetDataSource];
    self.navigationController.navigationBarHidden = NO;
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
    //_tableView.separatorInset = UIEdgeInsetsZero;
    [self.view addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%lu",(unsigned long)self.dataSource.count);
    return self.dataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * duilie = @"duilie1";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:duilie];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:duilie];
    }
    else
    {
        for(UIView *subview in cell.contentView.subviews)
        {
            [subview removeFromSuperview];
        }

    }

    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (![self.dataSource[indexPath.row][@"summary"] isEqualToString:@""] && ![self.dataSource[indexPath.row][@"thumb_image"] isEqualToString:@""])
    {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 30, 70, 40)];
        imageView.image = [UIImage imageNamed:@"aifang_46.png"];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSURL * url = [NSURL URLWithString:self.dataSource[indexPath.row][@"thumb_image"]];
            NSData * data = [[NSData alloc]initWithContentsOfURL:url];
            UIImage *img = [[UIImage alloc]initWithData:data];
            imageView.image = img;
        });
        [imageView sd_setImageWithURL:self.dataSource[indexPath.row][@"thumb_image"] placeholderImage:[UIImage imageNamed:@"aifang_46.png"]];
        [cell.contentView addSubview:imageView];
    }
    UILabel * OneText = [[UILabel alloc]initWithFrame:CGRectMake(10, 3, ScreenWidth - 30, 20)];
    OneText.text = self.dataSource[indexPath.row][@"title"];
    OneText.font = [UIFont systemFontOfSize:15];
    [cell.contentView addSubview:OneText];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![self.dataSource[indexPath.row][@"summary"] isEqualToString:@""] && ![self.dataSource[indexPath.row][@"thumb_image"] isEqualToString:@""])
    {
        return 80;
    }
    return 40;
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
