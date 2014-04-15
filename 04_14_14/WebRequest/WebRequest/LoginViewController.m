//
//  LoginViewController.m
//  WebRequest
//
//  Created by student on 3/24/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "LoginViewController.h"
#import "CameraViewController.h"
#import "GameStore.h"
#import "MainViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize UsernameField, PasswordField, EmailField;


-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UsernameField resignFirstResponder];
    [PasswordField resignFirstResponder];
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

bool _firstTime = YES;

-(void) viewDidAppear:(BOOL)animated
{
    if (!_firstTime)
    {
        [PasswordField setText:@""];
        [[GameStore SharedStore] LogOut];
    }
    _firstTime = NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)LoginButtonClick:(id)sender {
    NSString *username = [UsernameField text];
    NSString *password = [PasswordField text];

    void (^block)(void) = ^{
        NSLog(@"LoginViewController Authenticate Complete");
        _main = [[MainViewController alloc] init];
        //added this 4/14
        CameraViewController *camera = [[CameraViewController alloc] init];
        //[[self navigationController] pushViewController:_main animated:YES];
        //use camera instead
        [[self navigationController] pushViewController:camera animated:YES];
    };
    
    [[GameStore SharedStore] Authenticate:username withPassword:password  withBlock:block];

    
}

- (IBAction)CreateButtonClick:(id)sender
{
    NSString *username = [UsernameField text];
    NSString *password = [PasswordField text];
    NSString *email = [EmailField text];
    void (^block)(void) = ^{
        NSLog(@"WE CALLED THE LOGIN BLOCK");
    };
    
    [[GameStore SharedStore] CreateUser:username withPassword:password withEmail:email withBlock:block];
    

}




@end
