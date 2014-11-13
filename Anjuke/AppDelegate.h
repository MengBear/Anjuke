//
//  AppDelegate.h
//  Aujuke
//
//  Created by 6006 on 14-11-5.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>//定位

@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>
{
    CLLocationManager * _locationManager;
}

@property (strong, nonatomic) UIWindow *window;

//上下文 -- 指向你的数据库的对象 -- 可以对你的数据库进行 增加,修改,查找的操作
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

//管理对象模型 -- 你建立的对象模型
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

//持久化存储协调器
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

