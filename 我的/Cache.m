//
//  CacheAndFeedback.m
//  Aujuke
//
//  Created by 8025 on 14/11/6.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import "Cache.h"

@implementation Cache

-(id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    if (self)
    {
        self.delegate = self;
    }
    return self;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self clearCache];//清除缓存
    }
}

#pragma mark - 清除缓存
-(void)clearCache
{
    dispatch_async(
                   
                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
                   , ^{
                       
                       NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0];
                       
                       NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
                       
                       NSLog(@"files :%lu",(unsigned long)[files count]);
                       
                       for (NSString *p in files) {
                           
                           NSError *error;
                           NSString *path = [cachPath stringByAppendingPathComponent:p];
                           if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                               [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                           }
                       }
                       [self performSelectorOnMainThread:@selector(clearCacheSuccess) withObject:nil waitUntilDone:YES];
                   });
    
}

#pragma mark - 缓存清理完毕
-(void)clearCacheSuccess
{
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"清理缓存" message:@"您的缓存已清理完毕!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
    [alertView show];
}


@end
