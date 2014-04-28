//
//  DetailViewController.h
//  SuperHeroSharedStore
//
//  Created by student on 3/3/14.
//  Copyright (c) 2014 fvtc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    int _superheroIndex;
    
    
}
@property (weak, nonatomic) IBOutlet UITextField *NameField;
@property (weak, nonatomic) IBOutlet UITextField *PowerField;
@property (weak, nonatomic) IBOutlet UITextField *SecretField;
- (IBAction)CancelButtonClick:(id)sender;
- (IBAction)SubmitButtonClick:(id)sender;

-(void) SetSuperheroIndex:(NSInteger) index;

@end
