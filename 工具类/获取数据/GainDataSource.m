//
//  GainDataSource.m
//  ShiCai
//
//  Created by 8025 on 14-9-28.
//  Copyright (c) 2014年 liang. All rights reserved.
//
///Users/ibokan/Desktop/Ich/UI/AnJuKe/pchF.pch
#import "GainDataSource.h"

@implementation GainDataSource
//获取数据
+(id)shuJuYuan:(NSString *)string
{
    NSString * str  = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url = [NSURL URLWithString:str];
    NSData * data = [[NSData alloc]initWithContentsOfURL:url];
    NSError * error = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    return obj;
}
@end
