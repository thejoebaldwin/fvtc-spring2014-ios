//
//  GameDetailViewController.m
//  WebRequest
//
//  Created by student on 3/31/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "GameDetailViewController.h"
#import "Game.h"
#import "GameStore.h"

@interface GameDetailViewController ()

@end

@implementation GameDetailViewController

@synthesize NameLabel, DescriptionLabel, WinCountLabel, WinLimitLabel, UserCountLabel, UserLimitLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    Game *game = [[[GameStore SharedStore] Games] objectAtIndex: _GameIndex];
    [NameLabel setText:[game Name]];
    [DescriptionLabel setText: [game Description]];
    [WinCountLabel setText: [NSString stringWithFormat:@"%i", [game WinCount]]];
    [WinLimitLabel setText: [NSString stringWithFormat:@"%i", [game WinLimit]]];
    [UserCountLabel setText: [NSString stringWithFormat:@"%i", [game UserCount]]];
    [UserLimitLabel setText: [NSString stringWithFormat:@"%i", [game UserLimit]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) SetGameIndex:(int)gameindex
{
    _GameIndex = gameindex;
}


- (IBAction)JoinButtonClick:(id)sender {
    Game *game = [[[GameStore SharedStore] Games] objectAtIndex: _GameIndex];
    
    void (^block)(void) = ^{
        NSLog(@"GameDetailViewController Join Complete");
           };
    
    
    [[GameStore SharedStore] JoinGame:[game GameID] withBlock:block];
}

- (IBAction)QuitButtonClick:(id)sender {
    Game *game = [[[GameStore SharedStore] Games] objectAtIndex: _GameIndex];
    
    void (^block)(void) = ^{
        NSLog(@"GameDetailViewController Quit Complete");
    };
    [[GameStore SharedStore] QuitGame:[game GameID] withBlock:block];
}
@end
