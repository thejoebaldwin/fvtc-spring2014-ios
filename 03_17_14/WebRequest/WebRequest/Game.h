//
//  Game.h
//  WebRequest
//
//  Created by student on 3/17/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject
{
    int _GameID;
    int _WinLimit;
    int _WinCount;
    int _UserLimit;
    int _UserCount;
}

-(int) GameID;
-(void) SetGameID:(int) gameID;
-(int) WinLimit;
-(void) SetWinLimit:(int) winLimit;
-(int) WinCount;
-(void) SetWinCount:(int) winCount;
-(int) UserLimit;
-(void) SetUserLimit:(int) userLimit;
-(int) UserCount;
-(void) SetUserCount:(int) userCount;
@end
