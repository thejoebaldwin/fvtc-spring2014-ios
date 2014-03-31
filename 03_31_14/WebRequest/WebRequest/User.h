//
//  User.h
//  Bingo Store
//
//  Created by student on 3/31/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
{
    NSString *_Username;
    int _UserID;
    NSString *_Bio;
    int _GameCount;
    int _WinCount;
    int _Rank;
    
}


-(NSString*) Username;
-(void) SetUsername:(NSString*) username;
-(int) UserID;
-(void) SetUserID:(int) userid;
-(NSString*) Bio;
-(void) SetBio:(NSString*) bio;

-(int) WinCount;
-(void) SetWinCount:(int) wincount;

-(int) GameCount;
-(void) SetGameCount:(int) gamecount;

-(int) Rank;
-(void) SetRank:(int) rank;

-(id) initWithData:(NSDictionary *) dictionary;
-(NSString *) description;


@end
