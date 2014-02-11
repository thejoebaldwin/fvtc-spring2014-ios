//
//  DetailViewController.m
//  SuperHeroList
//
//  Created by student on 2/10/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize NameLabel, PowerLabel;

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
    [NameLabel setText:_name];
    [PowerLabel setText:_power];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BackButtonClick:(id)sender {
    //dismiss popup
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) SetName:(NSString *)name
{
    _name = name;
}

-(void) SetPower:(NSString *)power
{
    _power = power;
}
@end
