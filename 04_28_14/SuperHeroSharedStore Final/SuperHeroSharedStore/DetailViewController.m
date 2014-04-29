//
//  DetailViewController.m
//  SuperHeroSharedStore
//
//  Created by student on 3/3/14.
//  Copyright (c) 2014 fvtc. All rights reserved.
//

#import "DetailViewController.h"
#import "superhero.h"
#import "SuperheroStore.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize NameField, PowerField, SecretField;

-(id) init
{
    self = [super init];
    if (self) {
           }
    
    return self;
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [NameField resignFirstResponder];
    [PowerField resignFirstResponder];
    [SecretField resignFirstResponder];
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
    Superhero *tempSuperhero = [[SuperheroStore SharedStore] SuperheroAtIndex:_superheroIndex];
    [NameField setText:[tempSuperhero Name]];
    [PowerField setText:[tempSuperhero Power]];
    [SecretField setText:[tempSuperhero Secret]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CancelButtonClick:(id)sender {
    //dismisses the current view
    [[self navigationController] popViewControllerAnimated:YES];
    
}

- (IBAction)SubmitButtonClick:(id)sender {
    
    Superhero *tempSuperhero = [[SuperheroStore SharedStore] SuperheroAtIndex:_superheroIndex];
    /*
    [NameField setText:[tempSuperhero Name]];
    [PowerField setText:[tempSuperhero Power]];
    [SecretField setText:[tempSuperhero Secret]];
    */
    [tempSuperhero SetName:[NameField text]];
    [tempSuperhero SetPower:[PowerField text]];
    [tempSuperhero SetSecret:[SecretField text]];
    
    
    //dismisses the current view
    [[self navigationController] popViewControllerAnimated:YES];


    
}

-(void) SetSuperheroIndex:(NSInteger) index
{
    _superheroIndex = index;
    
}

@end
