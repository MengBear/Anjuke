//
//  GroupPurchaseDetails.h
//  Tuangou
//
//  Created by 6006 on 14-11-3.
//  Copyright (c) 2014年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface GroupPurchaseDetails : UITableViewController<CLLocationManagerDelegate,MKMapViewDelegate>
{
    NSArray *Sectiontitle;
    CLLocationManager * _locationManager;
    MKMapView * _mapview;
}
@property(nonatomic,strong)NSDictionary * ReceiveData;
@property(nonatomic,strong)NSArray *ImagesData;
@end
