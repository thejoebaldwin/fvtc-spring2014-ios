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
    //connection object
    NSURLConnection *_Connection;
    NSMutableData *_HttpData;
    void (^completion) (void);
}

-(NSMutableArray*) Games;
+(GameStore*) SharedStore;
-(void) Load: (void(^)(void)) block;

@end
