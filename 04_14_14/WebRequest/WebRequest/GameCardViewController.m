//
//  GameCardViewController.m
//  WebRequest
//
//  Created by student on 3/31/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "GameCardViewController.h"
#import "GameStore.h"
#import "Game.h"

@interface GameCardViewController ()

@end

@implementation GameCardViewController

@synthesize NumberLabel;

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
    [NSTimer scheduledTimerWithTimeInterval:30.0 target:self selector:@selector(GetNumber) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) SetGameIndex:(int) gameindex
{
    _gameIndex = gameindex;
}

-(void) GetNumber
{
    Game *game = [[[GameStore SharedStore] Games] objectAtIndex:_gameIndex];
    void (^block)(void) = ^{
        NSLog(@"GameCardViewController GetNumber Complete");
        [NumberLabel setText:[[GameStore SharedStore] Number] ];
    };
    [[GameStore SharedStore] GetNextNumber:[game GameID] withBlock:block];
}

@end
