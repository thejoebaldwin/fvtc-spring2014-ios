//
//  Game.m
//  WebRequest
//
//  Created by student on 3/17/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "Game.h"

@implementation Game


-(int) GameID
{
    return _GameID;
}
-(void) SetGameID:(int) gameID
{
    _GameID = gameID;
}
-(int) WinLimit
{
    return _WinLimit;
}
-(void) SetWinLimit:(int) winLimit
{
    _WinLimit = winLimit;
}
-(int) WinCount
{
    return _WinCount;
}
-(void) SetWinCount:(int) winCount
{
    _WinCount = winCount;
}
-(int) UserLimit
{
    return _UserLimit;
}
-(void) SetUserLimit:(int) userLimit
{
    _UserLimit = userLimit;
}
-(int) UserCount
{
    return _UserCount;
}
-(void) SetUserCount:(int) userCount
{
    _UserCount = userCount;
}


-(NSString*) Description
{
    return _Description;
}

-(void) SetDescription:(NSString*) description
{
    _Description = description;
    
}

-(void) SetName: (NSString*) name
{
    _Name = name;
}

-(NSString*) Name
{
    return _Name;
}


-(NSString*) description
{
    NSString *description = [[NSString alloc] initWithFormat:@"GameID:%i,WinLimit:%i,WinCount:%i,UserLimit:%i,UserCount:%i",
                             _GameID,
                             _WinLimit,
                             _WinCount,
                             _UserLimit,
                             _UserCount];
    return description;
}

-(id) initWithDictionary:(NSDictionary*) dictionary
{
    self = [super init];
    if (self)
    {
        _GameID = [[dictionary objectForKey:@"game_id"] intValue] ;
        _WinCount = [[dictionary objectForKey:@"win_count"] intValue];
        _WinLimit = [[dictionary objectForKey:@"win_limit"] intValue];
        _UserCount = [[dictionary objectForKey:@"user_count"] intValue];
        _UserLimit = [[dictionary objectForKey:@"user_limit"] intValue];
        _Description = [dictionary objectForKey:@"description"];
        _Name = [dictionary objectForKey:@"name"];
    }
    return self;
}




@end
