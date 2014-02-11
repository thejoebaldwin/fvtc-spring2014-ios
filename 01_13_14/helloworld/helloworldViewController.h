//
//  helloworldViewController.h
//  helloworld
//
//  Created by student on 1/13/14.
//  Copyright (c) 2014 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface helloworldViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *helloWorldLabel;


@property (weak, nonatomic) IBOutlet UIButton *clickMeButton;
- (IBAction)clickMeButtonClicked:(id)sender;

@end



