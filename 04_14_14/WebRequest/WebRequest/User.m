//
//  User.m
//  Bingo Store
//
//  Created by student on 3/31/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "User.h"

@implementation User


-(NSString*) Username
{
    return _Username;
    
}
-(void) SetUsername:(NSString*) username
{
    _Username = username;
}
-(int) UserID
{
    return _UserID;
}
-(void) SetUserID:(int) userid
{
    _UserID = userid;
}
-(NSString*) Bio
{
    return _Bio;
}
-(void) SetBio:(NSString*) bio
{
    _Bio     = bio;
}

-(int) WinCount
{
    return _WinCount;
}
-(void) SetWinCount:(int) wincount
{
    _WinCount = wincount;
}

-(int) GameCount
{
    return _GameCount;
}
-(void) SetGameCount:(int) gamecount
{
    _GameCount = gamecount;
}

-(int) Rank
{
    return _Rank;
}

-(void) SetRank:(int) rank
{
    _Rank    = rank;
}


-(NSString*) description
{
    NSString *description = [[NSString alloc] initWithFormat:@"UserID:%i,Username:%@,Bio:%@,GameCount:%i,WinCount:%i,Rank:%i",
                             _UserID,
                             _Username,
                             _Bio,
                             _GameCount,
                             _WinCount,
                             _Rank];
    return description;
}



-(id) initWithDictionary:(NSDictionary*) dictionary
{
    self = [super init];
    if (self)
    {
        _UserID = [[dictionary objectForKey:@"user_id"] intValue];
        _Username = [dictionary objectForKey:@"username"];
        _Bio = [dictionary objectForKey:@"bio"];
        _GameCount =[[dictionary objectForKey:@"game_count"] intValue];
        _WinCount = [[dictionary objectForKey:@"win_count"] intValue];
        _Rank = [[dictionary objectForKey:@"rank"] intValue];
        
    }
    return self;
}


@end
