//
//  MainViewController.h
//  testdemo
//
//  Created by 王碧仕 on 14-2-13.
//  Copyright (c) 2014年 王碧仕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MainViewController : UIViewController<CLLocationManagerDelegate, NSURLConnectionDelegate,UIWebViewDelegate>
{
    CLLocationManager* _locationManager;

}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate2D;
@property (nonatomic, assign) CLLocationDistance distance;

-(IBAction)gotoZbarView:(id)sender;
-(IBAction)startMapkit:(id)sender;
-(IBAction)goAnimationView:(id)sender;

@end
