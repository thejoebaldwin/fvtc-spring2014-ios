//
//  GameStore.h
//  WebRequest
//
//  Created by student on 3/17/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BingoStore : NSObject
{
    NSMutableArray *_Games;
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
}
-(bool) LoggedIn;
-(void) LogOut;
-(NSMutableArray*) Games;
+(BingoStore*) SharedStore;
-(void) LoadGames: (void(^)(void)) block;
-(void) LoadUsers: (void(^)(void)) block;

-(void) CreateUser:(NSString*) username
      withPassword:(NSString*) password
         withEmail:(NSString*) email
         withBlock:(void(^)(void)) block;

-(void) Authenticate:(NSString*) username withPassword:(NSString*) password withBlock:(void(^)(void)) block;




@end
