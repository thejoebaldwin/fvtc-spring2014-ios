//
//  GameDetailViewController.h
//  WebRequest
//
//  Created by student on 3/31/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameDetailViewController : UIViewController
{
    int _GameIndex;
    
    
}

-(void) SetGameIndex:(int) gameindex;

@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *DescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *WinLimitLabel;
@property (weak, nonatomic) IBOutlet UILabel *WinCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *UserLimitLabel;
@property (weak, nonatomic) IBOutlet UILabel *UserCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *JoinButton;
@property (weak, nonatomic) IBOutlet UIButton *QuitButton;

- (IBAction)JoinButtonClick:(id)sender;
- (IBAction)QuitButtonClick:(id)sender;

@end
