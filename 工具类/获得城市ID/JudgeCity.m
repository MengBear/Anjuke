//
//  JudgeCity.m
//  Anjuke
//
//  Created by 8025 on 14/11/3.
//  Copyright (c) 2014年 liang. All rights reserved.
//

#import "JudgeCity.h"

@implementation JudgeCity
+(NSString*)judgeCity:(NSString *)cityName
{
    NSString * path = [[NSBundle mainBundle]pathForResource:@"城市信息" ofType:@"plist"];
    NSDictionary * dic = [[NSDictionary alloc]initWithContentsOfFile:path];
    for (NSString * str in dic)
    {
        if([cityName isEqualToString:[dic objectForKey:str][@"city_name"]])
        {
            return [dic objectForKey:str][@"city_id"];
        }
    }
    return nil;
}
@end
