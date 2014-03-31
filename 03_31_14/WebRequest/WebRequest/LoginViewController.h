//
//  LoginViewController.h
//  WebRequest
//
//  Created by student on 3/24/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface LoginViewController : UIViewController
{
    MainViewController *_main;
}
@property (weak, nonatomic) IBOutlet UITextField *UsernameField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordField;
- (IBAction)LoginButtonClick:(id)sender;
- (IBAction)CreateButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *EmailField;





@end
