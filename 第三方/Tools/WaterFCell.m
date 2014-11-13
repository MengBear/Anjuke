//
//  WaterFCell.m
//  CollectionView
//
//  Created by d2space on 14-2-26.
//  Copyright (c) 2014年 D2space. All rights reserved.
//

#import "WaterFCell.h"

@implementation WaterFCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        self.contentView.layer.cornerRadius = 5.0;
//        self.contentView.layer.borderWidth = 1.0f;
//        self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
        [self setup];
    }
    return self;
}
#pragma mark - Setup
- (void)setup
{
    [self setupView];
    [self setupTextView];
}

- (void)setupView
{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,0,0)];
    self.imageView.layer.cornerRadius = 5;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.borderColor = [UIColor brownColor].CGColor;
    self.imageView.layer.borderWidth = 2;
    self.imageView.backgroundColor = [UIColor greenColor];
    [self addSubview:self.imageView];
}

- (void)setupTextView
{
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0,0,0,0)];
    self.textView.layer.cornerRadius = 5;
    self.textView.layer.masksToBounds = YES;
    self.textView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.textView.layer.borderWidth = 1;
    self.textView.textColor = [UIColor whiteColor];
    self.textView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.textView];
}

//#pragma mark - Configure
//- (void)configureCellWithIndexPath:(NSIndexPath *)indexPath
//{
//    self.textView.text = [NSString stringWithFormat:@"Cell %ld", (long)(indexPath.row + 1)];
//}

@end
