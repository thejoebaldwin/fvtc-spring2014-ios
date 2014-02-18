//
//  SlotMachineViewController.h
//  SlotMachine
//
//  Created by student on 2/17/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <UIKit/UIKit.h>


#define MAX_ITEMS 30
#define SLOT_COUNT 3

@interface SlotMachineViewController : UIViewController  <UIPickerViewDataSource>
{
    NSMutableArray *_pickerItems;
    NSMutableArray *_slotContents;


    
}

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)SpinButtonClick:(id)sender;
@end
