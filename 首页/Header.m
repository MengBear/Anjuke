//
//  Header.m
//  Anjuke
//
//  Created by 8025 on 14/11/3.
//  Copyright (c) 2014年 liang. All rights reserved.
//

#import "Header.h"
#import "NewHouse.h"
#import "Building.h"
#import "CityViewController.h"
#define NameImgViewWidth   80                              //标题名字图片宽度
#define NameImgViewHeight  20                              //标题名字图片高度
#define RegionButWidth     50                              //地区按钮宽度
#define RegionButHeight    15                              //地区按钮高度
#define Num                4                               //按钮个数
#define Amount             9                               //一次请求可以获取的数据数目
@implementation Header
-(id)init:(NSString *)cityName cityID:(NSString *)cityID vc:(UINavigationController *)vc
{
    self = [super init];
   if (self)
   {
       self.frame = CGRectMake(0, 0, ScreenWidth, 130 + (ScreenWidth - 50) / Num + 30 +(ScreenWidth - 8) / 3 + 10);
       n = 0;
       [self titleLayout:cityName];
       [self searchLayout];
       [self buttonLayout];
       [self ScrollViewImage:cityID cityName:cityName];
       self.Navi = vc;
       self.cityID = cityID;
       
   }
    return self;
}

#pragma mark - 标题布局
-(void)titleLayout: (NSString*)cityName
{   //标题
    UIImageView * nameImg = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth / 2 - NameImgViewWidth , 30, NameImgViewWidth, NameImgViewHeight)];
    nameImg.image = [UIImage imageNamed:@"anjukelogo"];

    //地区按钮
    self.regionBut = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.regionBut.frame = CGRectMake(CGRectGetWidth(self.frame) / 2 + 5,35, RegionButWidth, RegionButHeight);
    self.regionBut.titleLabel.font = [UIFont systemFontOfSize:14];
    self.regionBut.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//字体左对齐
    [self.regionBut setTitle:cityName forState:UIControlStateNormal];
    [self.regionBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.regionBut addTarget:self action:@selector(SelectedRegion:) forControlEvents:UIControlEventTouchDown];
    UIImageView * butImg = [[UIImageView alloc]initWithFrame:CGRectMake(35, 4, 8, 8)];
    butImg.image = [UIImage imageNamed:@"area_filter_unfold"];

    [self.regionBut addSubview:butImg];
    [self addSubview:self.regionBut];
    [self addSubview:nameImg];
}


#pragma mark - 搜索布局
-(void)searchLayout
{
    _searchbar = [[UISearchBar alloc]initWithFrame:CGRectMake(20, 70, ScreenWidth - 40, 40)];
    _searchbar.searchBarStyle = UISearchBarStyleProminent;
    _searchbar.placeholder = @"搜索";
    [self addSubview:_searchbar];
}

#pragma mark - 房子等按钮布局
-(void)buttonLayout
{
    NSArray * butArr = @[@"home_icon_ershoufang@2x",@"home_icon_xinfang@2x",@"home_icon_shoucang@2x",@"home_icon_fangjia@2x"];
    NSArray * labelArr = @[@"新房",@"楼盘",@"资讯",@"推荐"];
    for (int i = 0; i < Num ; i++)
    {
        but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.tag = 100 + i;
        but.frame = CGRectMake(10 + i % Num * ((ScreenWidth - 50) / 4 + 10), 130,
                               (ScreenWidth - 50) / Num, (ScreenWidth - 50) / Num);
        [but setImage:[UIImage imageNamed:butArr[i]] forState:UIControlStateNormal];
        [but addTarget:self action:@selector(downButton:) forControlEvents:UIControlEventTouchDown];

        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(but.frame.origin.x, but.frame.origin.y + CGRectGetHeight(but.frame), CGRectGetWidth(but.frame), 15)];
        label.tag = 200 + i;
        label.text = labelArr[i];
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;

        [self addSubview:label];
        [self addSubview:but];
    }
}

#pragma mark - 图片轮播布局
-(void)ScrollViewImage:(NSString *)cityID cityName:(NSString*)cityName
{
    //int  value = (arc4random() % 10) + 1;//随机页数
    NSDictionary * dic = [GainDataSource shuJuYuan:HotHouses(cityID, 1, Amount)];
    
    scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0,but.frame.origin.y + CGRectGetHeight(but.frame) + 30, ScreenWidth,(ScreenWidth - 8) / 3)];
    scrollV.contentSize = CGSizeMake(((ScreenWidth - 8)  / 3 + 2) * 12 + 2, 80);
    scrollV.showsHorizontalScrollIndicator = NO;
    scrollV.delegate = self;

    for (int y = Amount; y < Amount + 3; y++)
    {
        UIImageView * LastImageView = [[UIImageView alloc]initWithFrame:CGRectMake(2 + y  * ((ScreenWidth - 8)  / 3 + 2) ,0, (ScreenWidth - 8)  / 3, (ScreenWidth - 8) / 3)];
        LastImageView.tag = 10010 + y;
        UILabel * LastLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(LastImageView.frame) - 20, CGRectGetWidth(LastImageView.frame), 20)];
        LastLabel.tag = 10020 + y;
        LastLabel.backgroundColor = [UIColor blackColor];
        LastLabel.alpha = 0.7;
        LastLabel.adjustsFontSizeToFitWidth = YES;
        LastLabel.textAlignment = NSTextAlignmentCenter;
        LastLabel.font = [UIFont systemFontOfSize:15];
        LastLabel.textColor = [UIColor whiteColor];
        LastLabel.text = [NSString stringWithFormat:@"%@",dic[@"result"][@"rows"][y - Amount][@"loupan_name"]];
        [LastImageView addSubview:LastLabel];
        [scrollV addSubview:LastImageView];
    }
//    UIImageView * LastImageView = [[UIImageView alloc]initWithFrame:CGRectMake(2 + 9  * ((ScreenWidth - 8)  / 3 + 2) ,0, (ScreenWidth - 8)  / 3, (ScreenWidth - 8) / 3)];
//    UIImageView * Last2ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(2 + 10  * ((ScreenWidth - 8)  / 3 + 2) ,0, (ScreenWidth - 8)  / 3, (ScreenWidth - 8) / 3)];
//    UIImageView * Last3ImageView = [[UIImageView alloc]initWithFrame:CGRectMake(2 + 11  * ((ScreenWidth - 8)  / 3 + 2) ,0, (ScreenWidth - 8)  / 3, (ScreenWidth - 8) / 3)];
    
    
    
    for (int i = 0; i < Amount ; i++)
    {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(2 + i % Amount * ((ScreenWidth - 8)  / 3 + 2) ,0, (ScreenWidth - 8)  / 3, (ScreenWidth - 8) / 3)];
        imageView.tag = 10000 + i;
        imageView.image = [UIImage imageNamed:@"aifang_46.png"];
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(imageView.frame) - 20, CGRectGetWidth(imageView.frame), 20)];
        label.backgroundColor = [UIColor blackColor];
        label.alpha = 0.7;
        label.adjustsFontSizeToFitWidth = YES;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor whiteColor];
        label.text = [NSString stringWithFormat:@"%@",dic[@"result"][@"rows"][i][@"loupan_name"]];
        [imageView addSubview:label];
         dispatch_async(dispatch_queue_create("my queue1", NULL), ^{
        //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSURL * url = [NSURL URLWithString:dic[@"result"][@"rows"][i][@"default_image"]];
            NSURLRequest * request = [[NSURLRequest alloc]initWithURL:url cachePolicy:2 timeoutInterval:30];
            
            NSError * error;//指向服务器的连接错误,如果没有出错.则为null;
            NSURLResponse * response;//服务器在传回信息的时候,还返回了一些响应信息,保存在NSURLResponse的对象中
            NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            UIImage * image = [[UIImage alloc]initWithData:data];
           
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImageView * imgV = (UIImageView*)[self viewWithTag:i + 10000];
                imgV.image = image;
                switch (imgV.tag) {
                    case 10000:
                    case 10001:
                    case 10002:
                    {
                        UIImageView * lastIV = (UIImageView *)[self viewWithTag:imgV.tag + 10 + Amount];
                        lastIV.image = image;
                    }
                    default:
                        break;
                }
            });
        });
        [scrollV addSubview:imageView];
    }
    [self addSubview:scrollV];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollVAnimation:) userInfo:scrollV repeats:YES];
}

#pragma mark - 选取地区方法
-(void)SelectedRegion:(UIButton*)sender
{
    CityViewController * city = [CityViewController new];
    [self.Navi pushViewController:city animated:YES];
}

#pragma mark - 定时器调用方法
-(void)scrollVAnimation:(NSTimer*)sender
{
    double d =  scrollV.contentOffset.x + (ScreenWidth - 8)  / 3 + 2;
    [scrollV setContentOffset:CGPointMake(d, 0) animated:YES];
}

#pragma mark - 按下按钮
-(void)downButton:(UIButton*)sender
{
    UILabel * label = (UILabel*)[self viewWithTag:sender.tag + 100];
    [UIView animateWithDuration:0.3 animations:^{
        sender.transform = CGAffineTransformMakeScale(0.8, 0.8);
        label.transform  = CGAffineTransformMakeScale(0.8, 0.8);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            sender.transform = CGAffineTransformMakeScale(1, 1);
            label.transform  = CGAffineTransformMakeScale(1, 1);
        } completion:^(BOOL finished) {
         
            [self pushchooseVC:sender.tag];
            
        }];
    }];
}
#pragma mark - 跳转页面

-(void)pushchooseVC:(NSInteger)tag
{
    switch (tag)
    {
        case 100:
        {
            NewHouse *nh = [NewHouse new];
            [self.Navi pushViewController:nh animated:YES];
        }
            break;
        case 101:
        {
            Building *bud = [Building new];
            [self.Navi pushViewController:bud animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma msrk - ScrollView代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x >= ((ScreenWidth - 8)  / 3 + 2) * 9)
    {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
}

@end
