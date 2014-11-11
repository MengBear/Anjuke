//
//  CustomSeparator.m
//  Aujuke
//
//  Created by 8025 on 14/11/6.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "CustomSeparator.h"

@implementation CustomSeparator

-(id)init:(NSInteger)DistanceLeft DistanceReght:(NSInteger)DistanceReght Color:(UIColor*)Color number:(NSInteger)number
{
    self = [super init];
    if (self)
    {
        NSLog(@"666");
        for (int i = 0; i < number; i++)
        {
            UIView * separator = [[UIView alloc]initWithFrame:CGRectMake(DistanceLeft,(i + 1) * 40, ScreenWidth - DistanceLeft - DistanceReght, 1)];
            separator.backgroundColor = Color;
        }
    }
    return self;
}



@end
