//
//  AboutViewController.m
//  SuperHeroList
//
//  Created by student on 2/10/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController


-(id) init
{
    //call the parent init
    self = [super init];
    //if super init worked
    if (self) {
        //set the current tab item title to "about"
        [[self tabBarItem] setTitle:@"About"];
        //[[self tabBarItem] setImage: UIBarButtonSystemItemCompose];
    }
    //return the pointer to self
    return self;
}

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
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AboutButtonClick:(id)sender {
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
}
@end
