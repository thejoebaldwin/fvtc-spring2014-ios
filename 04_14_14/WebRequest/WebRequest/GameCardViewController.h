//
//  GameCardViewController.h
//  WebRequest
//
//  Created by student on 3/31/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameCardViewController : UIViewController
{
    int _gameIndex;
}
@property (weak, nonatomic) IBOutlet UILabel *NumberLabel;

-(void) SetGameIndex:(int) gameindex;

-(void) GetNumber;

@end
