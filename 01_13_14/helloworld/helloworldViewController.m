//
//  helloworldViewController.m
//  helloworld
//
//  Created by student on 1/13/14.
//  Copyright (c) 2014 student. All rights reserved.
//

#import "helloworldViewController.h"

@interface helloworldViewController ()

@end

@implementation helloworldViewController

@synthesize helloWorldLabel, clickMeButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
    //    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickMeButtonClicked:(id)sender {
    
    [helloWorldLabel setText:@"ViewDidLoad Sent Me"];

    
}
@end
