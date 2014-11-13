//
//  Collect.h
//  Anjuke
//
//  Created by 8025 on 14/11/13.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
@interface Collect : NSObject<UIAlertViewDelegate>

@property(nonatomic,strong)NSString * ID;
@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString * DatabaseName; //数据库名字

-(void)ID:(NSString*)ID name:(NSString*)name databaseName:(NSString*)databaseName;
@end
