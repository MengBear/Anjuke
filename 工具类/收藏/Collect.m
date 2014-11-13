//
//  Collect.m
//  Anjuke
//
//  Created by 8025 on 14/11/13.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "Collect.h"
#import "ManagedObject.h"
@implementation Collect

-(void)ID:(NSString*)ID name:(NSString*)name databaseName:(NSString*)databaseName
{
    self.ID = ID;
    self.name = name;
    self.DatabaseName = databaseName;
   // [self alertView];
    [self CoreData];
}


#pragma mark - 提示框
-(void)alertView
{
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"\n确定收藏本页面!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消",nil];
    alertView.delegate = self;
    [alertView show];
}

#pragma mark - 提示框代理
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self CoreData];
    }
}

#pragma mark - CoreData
-(void)CoreData
{
    
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;//获取AppDelegate的对象
    NSManagedObjectContext * context = appDelegate.managedObjectContext;
 
    NSFetchRequest * fetchRequest = [NSFetchRequest new];
    NSEntityDescription * entity = [NSEntityDescription entityForName:self.DatabaseName inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError * error = nil;
    NSArray * fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects.count == 0)
    {
        [self GetData:context];
    }
    else
    {
        for (ManagedObject * manObj in fetchedObjects)
        {
            NSLog(@"lid:%@", [manObj valueForKey:@"lid"]);
            NSString * lid = [[NSString alloc]initWithString:[manObj valueForKey:@"lid"]];
            if ([lid containsString:self.ID])
            {
                UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"收藏失败" message:@"\n因为收藏已存在" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertView show];
            }
            else
            {
                [self GetData:context];
            }
        }

    }
}

#pragma mark - 增加数据
-(void)GetData:(NSManagedObjectContext*)context
{
    ManagedObject * manObj = [NSEntityDescription insertNewObjectForEntityForName:self.DatabaseName inManagedObjectContext:context];
    manObj.lid = self.ID;
    manObj.name = self.name;
    NSError * error1 = nil;
    BOOL issaveSuccess = [context save:&error1];
    if (issaveSuccess)
    {
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"收藏成功" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
    }
    else
    {
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"收藏失败" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
        NSLog(@"error1 = %@",[error1 localizedDescription]);
    }
}

@end
