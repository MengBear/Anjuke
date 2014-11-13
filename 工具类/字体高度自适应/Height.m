//
//  Height.m
//  食材简谱
//
//  Created by 6006 on 14-10-12.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "Height.h"

@implementation Height
+(CGFloat)contentHeight:(NSString *)content andFontSize:(CGFloat)fontSize andWidth:(CGFloat) width
    {
        CGSize size = CGSizeMake(width, MAXFLOAT);
        NSDictionary * dic = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
        NSAttributedString  * str = [[NSAttributedString alloc] initWithString:content attributes:dic];
        CGRect rect = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
        return CGRectGetHeight(rect);
    }

@end
