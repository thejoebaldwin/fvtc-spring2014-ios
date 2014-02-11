//
//  DetailViewController.h
//  SuperHeroList
//
//  Created by student on 2/10/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    //class variables
    NSString *_name;
    NSString *_power;
}

//outlets and actions
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *PowerLabel;
- (IBAction)BackButtonClick:(id)sender;

//setters
-(void) SetName:(NSString*) name;
-(void) SetPower:(NSString*) power;

@end
