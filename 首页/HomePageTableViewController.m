//
//  HomePageTableViewController.m
//  Anjuke
//
//  Created by 8025 on 14/11/3.
//  Copyright (c) 2014年 liang. All rights reserved.
//

#import "HomePageTableViewController.h"
#import "Header.h"


#define NameImgViewWidth   80                              //标题名字图片宽度
#define NameImgViewHeight  20                              //标题名字图片高度
#define RegionButWidth     50                              //地区按钮宽度
#define RegionButHeight    15                              //地区按钮高度
#define HeaderViewHeight   
@interface HomePageTableViewController ()
{
    Header * h;
}
@end

@implementation HomePageTableViewController

#pragma mark - 表头
-(void)header
{
    h = [[Header alloc]init:self.cityName cityID:self.cityID vc:self.navigationController];
    self.tableView.tableHeaderView = h;
}

#pragma mark - 获取数据源
-(void)GetDataSource
{
    self.cityID = [JudgeCity judgeCity:self.cityName];
    self.dataSource = [GainDataSource shuJuYuan:ForMoreInformation(self.cityID, 5)];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    if (!self.cityName)
    {
        self.cityName = @"广州";
        self.cityID = @"12";
    }
    [self refreshData];
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.navigationController.navigationBarHidden = YES;
}
#pragma mark - 刷新数据
-(void)refreshData
{
    [self GetDataSource];
    [self header];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.dataSource[@"result"][@"rows"] count] + 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * duilie1 = @"duilie1";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:duilie1];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:duilie1];
    }
    if (indexPath.row < [self.dataSource[@"result"][@"rows"] count])
    {
        cell.textLabel.text = self.dataSource[@"result"][@"rows"][indexPath.row][@"title"];
    }
    else
    {
        cell.textLabel.text = @"查看更多";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
   
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}


-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString * sectionName = @"房市资讯";
    return sectionName;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
