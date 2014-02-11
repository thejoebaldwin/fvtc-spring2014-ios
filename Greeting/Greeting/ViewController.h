//
//  ViewController.h
//  Greeting
//
//  Created by student on 1/20/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *greetingLabel;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
- (IBAction)clearButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
- (IBAction)firstNameEditEnd:(id)sender;
- (IBAction)firstNameExit:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *ageSlider;
- (IBAction)ageSliderValueChanged:(id)sender;
- (IBAction)safetySwitchValueChanged:(id)sender;

- (IBAction)submitButtonClick:(id)sender;
@end
