//
//  LocationViewController.h
//  WebRequest
//
//  Created by student on 4/14/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *_LocationManager;
    id delegate;
}
@end
