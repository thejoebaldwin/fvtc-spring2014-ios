//
//  LocationViewController.m
//  WebRequest
//
//  Created by student on 4/14/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (_LocationManager == nil)
    {
        _LocationManager = [[CLLocationManager alloc] init];
    }
    _LocationManager.delegate = self;
    _LocationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    _LocationManager.distanceFilter = 1;
    [_LocationManager startUpdatingLocation];
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    NSLog(@"latitude %+.6f, longitude:%+.6f",
          location.coordinate.latitude,
          location.coordinate.longitude);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
