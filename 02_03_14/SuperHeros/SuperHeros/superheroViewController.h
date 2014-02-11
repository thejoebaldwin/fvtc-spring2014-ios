//
//  superheroViewController.h
//  SuperHeros
//
//  Created by student on 2/3/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "superhero.h"

@interface superheroViewController : UIViewController
{
    //Superhero *_heroes[20];
    
    NSMutableArray *_heroes;
    
    int index;
}

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *powerField;
@property (weak, nonatomic) IBOutlet UITextField *secretField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;

- (IBAction)clearButtonClick:(id)sender;
- (IBAction)submitButtonClick:(id)sender;

- (IBAction)nameFieldEndEdit:(id)sender;
- (IBAction)powerFieldEndEdit:(id)sender;
- (IBAction)secretFieldEndEdit:(id)sender;
- (IBAction)ageFieldEndEdit:(id)sender;




@end
