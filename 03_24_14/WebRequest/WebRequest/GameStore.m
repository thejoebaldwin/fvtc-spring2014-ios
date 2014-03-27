//
//  GameStore.m
//  WebRequest
//
//  Created by student on 3/17/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "GameStore.h"
#import "Game.h"

#import <CommonCrypto/CommonHMAC.h>
#import "NSData+Base64.h"

@implementation GameStore


NSString const *_hostname = @"http://itweb.fvtc.edu/kingbingo/service/v0";

-(id) init
{
    self  = [super init];
    if (self)
    {
        _Games = [[NSMutableArray alloc] init];
        _LoggedIn = NO;
        NSLog(@"Initialized Games: %@", _Games);
        
    }
    return self;
}



-(NSMutableArray *) Games
{
    return _Games;
}

+(GameStore*) SharedStore
{
    static GameStore *sharedStore = nil;
    if (!sharedStore)
    {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}


-(bool) LoggedIn
{
    return _LoggedIn;
}

-(void) LogOut
{
    _password = @"";
    _LoggedIn = NO;
    _authToken = @"";
}

- (void) PostDataWithOperation:(NSString*) operation withJSON: (NSString*) JSON
{
    _HttpData = [[NSMutableData alloc] init];
    //build the post url with operation
    NSString *tempHost =  [[NSString alloc] initWithFormat:@"%@/%@", _hostname, operation];
    NSURL *url = [NSURL URLWithString:tempHost];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    
    //post body here
    NSData *postData = [JSON dataUsingEncoding:NSUTF8StringEncoding];
    //[request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"text/html" forHTTPHeaderField:@"Content-Type"];
    //post body data length
    [request setValue:[NSString stringWithFormat:@"%d", [postData length]] forHTTPHeaderField:@"Content-Length"];
    //set post body
    [request setHTTPBody:postData];
    
    _Connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
   
}



-(NSString *) SHA1:(NSString*) cleartext
{
    
    NSData *data = [cleartext dataUsingEncoding:NSUnicodeStringEncoding];
    data = [NSData dataWithBytes:[data bytes] + 2 length:[data length] - 2];
    NSString *unicodePassword = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    data = [unicodePassword dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char hash[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1([data bytes], [data length], hash);
    NSData *result = [NSData dataWithBytes:hash length:CC_SHA1_DIGEST_LENGTH];
    
    NSString *resultHash = [result base64EncodedString];
    
    return resultHash;
}

-(NSString *) GetAuthHash:(NSString*) password
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSString *today = [formatter stringFromDate:[NSDate date]];
    NSString *hash = [self SHA1:password];
    hash = [hash stringByAppendingString:today];
    hash = [self SHA1:hash];
    NSLog(@"RESULT HASH:%@", hash);
    return hash;
    
}


- (NSData *)sha256:(NSData *)data
{
    unsigned char hash[CC_SHA256_DIGEST_LENGTH];
    if ( CC_SHA256([data bytes], [data length], hash) )
    {
        NSData *hashData = [NSData dataWithBytes:hash length:CC_SHA256_DIGEST_LENGTH];
        return hashData;
    }
    return nil;
}


-(void) LoadGames:(void(^)(void)) block
{
    //set the completion class variable to block
    completion = block;
    NSString *json = [[NSString alloc] initWithFormat:
                      @"{\"user_id\":\"%i\",\"authentication_token\":\"%@\"}",
                      _userID, _authToken];
    NSLog(@"Post Data:%@", json);
    [self PostDataWithOperation:@"allgames" withJSON:json];
}

-(void) connection: (NSURLConnection *) conn didReceiveData:(NSData *)data
{
    //add the received data to the end of our NSMutableData object.
    [_HttpData appendData:data];
}

-(void) connectionDidFinishLoading:(NSURLConnection*) connection
{
    NSString *response = [[NSString alloc] initWithData:_HttpData encoding:NSUTF8StringEncoding];
    NSLog(@"Received Data:%@", response);
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:_HttpData options:kNilOptions error:nil];
    
    NSString *operation = [json objectForKey:@"operation"];
    NSString *status = [json objectForKey:@"status"];
    
    if ([operation isEqualToString:@"createuser"])
    {
        
    
    }
    else if ([operation isEqualToString:@"auth"])
    {
        if ([status isEqualToString:@"ok"])
        {
            NSDictionary *user = [json objectForKey:@"user"];
            _authToken = [user objectForKey:@"authentication_token"];
            _userID =   [[user objectForKey:@"user_id"] intValue];
            _LoggedIn = YES;
        }
        else
        {
            _LoggedIn = NO;
        }
    }
    else if ([operation isEqualToString:@"allgames"])
    {
        NSArray *games = [json objectForKey:@"games"];
        for (int i = 0; i < [games count]; i++)
        {
            NSDictionary *temp = [games objectAtIndex:i];
            Game *tempGame = [[Game alloc] initWithDictionary:temp];
            NSLog(@"tempGame:%@", tempGame);
            [_Games addObject:tempGame];
        }

    }
        
    //execute the code block
    completion();
    
}

-(void) LoadUsers: (void(^)(void)) block
{
    completion = block;
    [self PostDataWithOperation:@"allusers" withJSON:@""];
}

-(void) CreateUser:(NSString*) username withPassword:(NSString*) password withEmail:(NSString*) email  withBlock:(void(^)(void)) block
{
    completion = block;
    NSString *json = [[NSString alloc] initWithFormat:
                      @"{\"username\":\"%@\",\"password\":\"%@\", \"email\":\"%@\"}",
                      username, password, email];
    [self PostDataWithOperation:@"createuser" withJSON:json];
}

-(void) Authenticate:(NSString*) username withPassword:(NSString*) password withBlock:(void(^)(void)) block
{
     completion = block;
     NSString *hash = [self GetAuthHash:password];
    
     NSString *json = [[NSString alloc] initWithFormat:
                      @"{\"username\":\"%@\",\"hash\":\"%@\"}",
                      username, hash];

    
     [self PostDataWithOperation:@"auth" withJSON:json];
}


@end
