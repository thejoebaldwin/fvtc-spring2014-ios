//
//  superhero.m
//  SuperHeros
//
//  Created by student on 2/3/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "superhero.h"

@implementation Superhero

-(id) init
{
    self = [super init];
    //do initialization here
    return self;
}

-(id) initWithName:(NSString *) name withPower:(NSString*) power withSecret:(NSString*) secret
{
    self = [super init];
    //do initialization here
    _name = name;
    _power = power;
    _secret = secret;
    return self;
}



-(NSString*) Name
{
    return _name;
}

-(void) SetName:(NSString*) name
{
    _name = name;
}

-(NSString*) Power
{
    return _power;
}

-(void) SetPower:(NSString*) power
{
    _power = power;
}

-(NSString*) Secret
{
    return _secret;
}

-(void) SetSecret:(NSString*) secret
{
    _secret = secret;
}



-(NSString *) description
{
    NSString *temp = [NSString stringWithFormat:@"Name:%@,Power:%@,Secret:%@", _name, _power, _secret];
    return temp;
}


@end
