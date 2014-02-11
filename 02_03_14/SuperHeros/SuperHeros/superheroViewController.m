//
//  superheroViewController.m
//  SuperHeros
//
//  Created by student on 2/3/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "superheroViewController.h"
#import "superhero.h"


@interface superheroViewController ()

@end

@implementation superheroViewController

@synthesize nameField, powerField, secretField, ageField;





- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //dismiss keyboards
    [nameField resignFirstResponder];
    [powerField resignFirstResponder];
    [secretField resignFirstResponder];
    [ageField resignFirstResponder];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    index = 0;
    
    _heroes = [[NSMutableArray alloc] init];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearButtonClick:(id)sender {
    
}

- (IBAction)submitButtonClick:(id)sender {
    
    //get input into variables and log to console
    NSString *name = [nameField text];
    NSString *secret = [secretField text];
    NSString *power = [powerField text];
    
    //NSLog(@"Name:%@", name);
    //NSLog(@"Power:%@", power);
    //NSLog(@"Secret:%@", secret);
    /*
    Superhero *hero = [[Superhero alloc] init];
    
    
    
    [hero SetName:name];
    [hero SetPower:power];
    [hero SetSecret:secret];
  */
    Superhero *hero = [[Superhero alloc] initWithName:name withPower:power withSecret:secret];
    
    //if (index < 20)
    //{
    //_heroes[index] = hero;
    //index++;
    //}
    [_heroes addObject:hero];
    
    
    /*
    for (int i = 0; i < [_heroes count]; i++)
    {
          NSLog(@"index:%i||%@", i, [_heroes objectAtIndex:i]);
    }
    */
    NSLog(@"%@", _heroes);
    
    //switch statement numeric range
    int age = [[ageField text] intValue];
    switch (age) {
        case 0 ... 10:
            NSLog(@"Child");
            break;
        case 11 ... 20:
            NSLog(@"Teenager");
            break;
        default:
            NSLog(@"Normal");
            break;
    }
    
    //call the function with arguments 4, 6, 9
    int product = [self productWithNumber1:4 withNumber2:6 withNumber3:9];
    
}

- (IBAction)nameFieldEndEdit:(id)sender {
}

- (IBAction)powerFieldEndEdit:(id)sender {
}

- (IBAction)secretFieldEndEdit:(id)sender {
}

- (IBAction)ageFieldEndEdit:(id)sender {
}


//method to take 3 numbers and return their product
- (int) productWithNumber1:(int) num1 withNumber2:(int) num2 withNumber3:(int) num3
{
    int product = num1 * num2 * num3;
    return product;
    
}



@end
