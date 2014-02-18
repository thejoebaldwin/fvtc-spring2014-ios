//
//  SlotMachineViewController.m
//  SlotMachine
//
//  Created by student on 2/17/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "SlotMachineViewController.h"

@interface SlotMachineViewController ()

@end

@implementation SlotMachineViewController

@synthesize pickerView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //_pickerItems = [[NSMutableArray alloc] init];

    _pickerItems = [[NSMutableArray alloc] initWithObjects:@"cherry.jpg", @"bell.jpg", @"bar.jpg", @"orange.jpg", @"grape.jpg", @"seven.jpg", nil];
    _slotContents = [[NSMutableArray alloc] init];
    //set number of items per slot
        //generate 3 random arrays
    for (int i = 0; i < SLOT_COUNT; i++)
    {
        //instantiate temporary array
        NSMutableArray *_tempItems = [[NSMutableArray alloc] init];
        //loop max items amount of times
        for (int j = 0; j < MAX_ITEMS;j++)
        {
            //generate random number between 0 and 5
            int r = rand() % [_pickerItems count];
            //grab the random object out of our "bell", "cherry", etc. array
            [_tempItems addObject: [_pickerItems objectAtIndex:r]];
        }
        //add the temporary array to slotContents
        [_slotContents addObject:_tempItems];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //number of columns/dials in the picker
    return SLOT_COUNT ;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //number of items in the picker
    
    
    return MAX_ITEMS;
}


- (UIView *) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    //create UIImage
    NSMutableArray *tempArray = [_slotContents objectAtIndex:component];
    UIImage *tempImage = [UIImage imageNamed:[tempArray objectAtIndex:row]];
    
    //Create UIImageView using that image
    UIImageView *imageView = [[UIImageView alloc] initWithImage:tempImage];
    
    //set the dimensions of that view
    [imageView setFrame:CGRectMake(0,0, 60, 60)];
       
    //return it
    return (UIView *) imageView;
}


- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //log the selected row
    NSLog(@"You selected row:%i", row);
}


- (IBAction)SpinButtonClick:(id)sender {
    
    int row1 = rand() % MAX_ITEMS;
    int row2 = rand() % MAX_ITEMS;
    int row3 = rand() % MAX_ITEMS;
    
    
    [pickerView selectRow:row1 inComponent:0 animated:YES];
    [pickerView selectRow:row2 inComponent:1 animated:YES];
    [pickerView selectRow:row3 inComponent:2 animated:YES];
    
    //did we win?
    NSString *value1 = [[_slotContents objectAtIndex:0] objectAtIndex:row1];
    NSString *value2 = [[_slotContents objectAtIndex:1] objectAtIndex:row2];
    NSString *value3 = [[_slotContents objectAtIndex:2] objectAtIndex:row3];
    
    if ([value1 isEqualToString:value2] && [value2 isEqualToString:value3])
    {
        NSLog(@"Winner!");
    }
    else
    {
        NSLog(@"Try Again");
    }
    
}
@end
