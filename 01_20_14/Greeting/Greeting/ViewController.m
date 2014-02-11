//
//  ViewController.m
//  Greeting
//
//  Created by student on 1/20/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


@synthesize greetingLabel, submitButton, clearButton, firstNameField, lastNameField, ageSlider;

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //dismiss the keyboards when anywhere on the view is touched
    [firstNameField resignFirstResponder];
    [lastNameField resignFirstResponder];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //call the initialize method
    [self initialize];
    
  }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearButtonClick:(id)sender {
    //call the initialize method
    [self initialize];
}

- (IBAction)firstNameEditEnd:(id)sender {
    //logging for black box testing
    //NSLog(@"First Name Edit Did End");
}

- (IBAction)firstNameExit:(id)sender {
    NSLog(@"First Name Exit!");
}

- (IBAction)ageSliderValueChanged:(id)sender {
    
    //get the age slider value
    float age = [ageSlider value];
    //write to nslog
    NSLog(@"Selected Age:%i", (int) age);
    //set the greeting label to be the value of the slider
    [greetingLabel setText: [NSString stringWithFormat:@"%i", (int) age]];
}

- (IBAction)safetySwitchValueChanged:(id)sender {
    
    //cast the id sender object into a UISwitch Pointer
    UISwitch *tempSwitch = (UISwitch *) sender;
    NSLog(@"%i", [tempSwitch isOn]);
    
    //disable the controls if switch is set to off
    if ([tempSwitch isOn])
    {
        [firstNameField setEnabled:YES];
        [lastNameField setEnabled:YES];
        [submitButton setEnabled:YES];
        [clearButton setEnabled:YES];
        [ageSlider setEnabled:YES];
        
    }
    else
    {
        [firstNameField setEnabled:NO];
        [lastNameField setEnabled:NO];
        [submitButton setEnabled:NO];
        [clearButton setEnabled:NO];
        [ageSlider setEnabled:NO];
    }
    
}

- (void) initialize
{
    //clear out the label
    [greetingLabel setText:@""];
    [ageSlider setValue:100];
    [firstNameField setText:@""];
    [lastNameField setText:@""];
}

- (IBAction)submitButtonClick:(id)sender {
    //get the value of the age slider
    float age = [ageSlider value];
    //get the first and last name
    NSString *firstName = [firstNameField text];
    NSString *lastName = [lastNameField text];
    //create a string using format
    NSString *wholeName = [[NSString alloc] initWithFormat:@"%@ %@ You are %i years old!", firstName, lastName, (int) age];
    //create an alert view
    UIAlertView *submitAlertView = [[UIAlertView alloc] initWithTitle:@"OK" message:wholeName delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
    //show the alert view
    [submitAlertView show];
}

@end
