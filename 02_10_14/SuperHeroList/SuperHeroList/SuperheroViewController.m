//
//  SuperheroViewController.m
//  SuperHeroList
//
//  Created by student on 2/10/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "SuperheroViewController.h"
#import "AboutViewController.h"


@interface SuperheroViewController ()

@end

@implementation SuperheroViewController

-(id) init{
    self = [super init];
    
    if (self) {
        [[self tabBarItem] setTitle:@"Home"];
        /*
        UITabBarItem *tab =    [[UITabBarItem alloc] initWithTabBarSystemItem: UITabBarSystemItemBookmarks tag:1];
        [self setTabBarItem: tab];
        [tab setTitle:@"About"];
        */
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AboutButtonClick:(id)sender {
    //initialize about view controller
    AboutViewController *about = [[AboutViewController alloc] init];
    //create a navigation controller instance using the about view controller
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:about];
    //use the navigation controller to display the about view controller
    [self presentViewController:nav animated:YES completion:nil];
    
    
}
@end
