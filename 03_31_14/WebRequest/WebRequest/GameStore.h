//
//  GameStore.h
//  WebRequest
//
//  Created by student on 3/17/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameStore : NSObject
{
    NSMutableArray *_Games;
    NSMutableArray *_Users;
    //connection object
    NSURLConnection *_Connection;
    NSMutableData *_HttpData;
    void (^completion) (void);
    NSString *_username;
    NSString *_password;
    NSString *_authToken;
    NSDate *_authTokenExpires;
    int _userID;
    bool _LoggedIn;
    NSString *_number;
}
-(NSString*) Number;
-(bool) LoggedIn;
-(void) LogOut;
-(NSMutableArray*) Games;
+(GameStore*) SharedStore;
-(void) LoadGames: (void(^)(void)) block;
-(void) LoadUsers: (void(^)(void)) block;

-(void) CreateUser:(NSString*) username
      withPassword:(NSString*) password
         withEmail:(NSString*) email
         withBlock:(void(^)(void)) block;

-(void) Authenticate:(NSString*) username withPassword:(NSString*) password withBlock:(void(^)(void)) block;


-(void) JoinGame:(int) gameID withBlock:(void(^)(void)) block;

-(void) QuitGame:(int) gameID withBlock:(void(^)(void)) block;

-(void) GetNextNumber:(int) gameID withBlock:(void(^)(void)) block;


@end
