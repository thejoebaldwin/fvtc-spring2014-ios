//
//  GameStore.m
//  WebRequest
//
//  Created by student on 3/17/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "GameStore.h"
#import "Game.h"

@implementation GameStore

-(id) init
{
    self  = [super init];
    if (self)
    {
        _Games = [[NSMutableArray alloc] init];
        //populate array
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

-(void) Load:(void(^)(void)) block
{
    //set the completion class variable to block
    completion = block;
    
    _HttpData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://mc.humboldttechgroup.com:1111/?cmd=allgames"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    _Connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

-(void) connection: (NSURLConnection *) conn didReceiveData:(NSData *)data
{
    //add the received data to the end of our NSMutableData object.
    [_HttpData appendData:data];
}

-(void) connectionDidFinishLoading:(NSURLConnection*) connection
{
    NSString *response = [[NSString alloc] initWithData:_HttpData encoding:NSUTF8StringEncoding];
    //NSLog(@"Received Data:%@", response);
    
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


@end
