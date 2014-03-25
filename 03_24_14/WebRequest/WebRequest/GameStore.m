//
//  GameStore.m
//  WebRequest
//
//  Created by student on 3/17/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "GameStore.h"
#import "Game.h"
#include <CommonCrypto/CommonDigest.h>

@implementation GameStore

    NSString const *_hostname = @"http://itweb.fvtc.edu/kingbingo/service/v0";

-(id) init
{
    self  = [super init];
    if (self)
    {
        _Games = [[NSMutableArray alloc] init];
        //populate array
        /*
        Game *temp = [[Game alloc] init];
        [temp SetGameID:0];
        [temp SetWinCount:1];
        [temp SetWinLimit:1];
        [temp SetUserCount:3];
        [temp SetUserLimit:5];
        [_Games addObject:temp];
        
        temp = [[Game alloc] init];
        [temp SetGameID:1];
        [temp SetWinCount:2];
        [temp SetWinLimit:4];
        [temp SetUserCount:1];
        [temp SetUserLimit:3];
        [_Games addObject:temp];
        */
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

- (NSString *) GetAuthHash:(NSString *) password
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSString* today = [formatter stringFromDate:[NSDate date]];
    
    NSData *data = [password dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, data.length, digest);
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    {
        [hash appendFormat:@"%02x", digest[i]];
    }
    
    //add the date at the end
    [hash appendString:today];
    
    
    //hash it again!
    
    NSData *data2 = [hash dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest2[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data2.bytes, data2.length, digest2);
    NSMutableString *hash2 = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    {
        [hash2 appendFormat:@"%02x", digest2[i]];
    }
    return hash2;
    
}


-(void) LoadGames:(void(^)(void)) block
{
    //set the completion class variable to block
   completion = block;
    //add the json later
    [self PostDataWithOperation:@"allgames" withJSON:@""];
   
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
    //NSLog(@"%@", [json objectForKey:@"games"]);
    
    NSArray *games = [json objectForKey:@"games"];
    //NSLog(@"Element[0]:%@", [games objectAtIndex:0]);

    for (int i = 0; i < [games count]; i++)
    {
        NSDictionary *temp = [games objectAtIndex:i];
        Game *tempGame = [[Game alloc] initWithDictionary:temp];
        NSLog(@"tempGame:%@", tempGame);
        [_Games addObject:tempGame];
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
    
     NSString *json = [[NSString alloc] initWithFormat:
                      @"{\"username\":\"%@\",\"password\":\"%@\"}",
                      username, password];

    
     [self PostDataWithOperation:@"auth" withJSON:json];
}


@end
