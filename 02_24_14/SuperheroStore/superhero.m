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


-(NSString*) Image
{
    return _image;
}

-(void) SetImage:(NSString*) image
{
    _image = image;
}

+(Superhero*) RandomSuperhero
{
    //data for generating randoms
    NSArray *firstNames = [[NSArray alloc] initWithObjects:@"Joe",
                           @"Rick",
                           @"Jon",
                           @"Carl",
                           @"Suzy",
                           nil];
    NSArray *lastNames = [[NSArray alloc] initWithObjects:@"Thompson",
                          @"Richards",
                          @"Stevenson",
                          @"Smith",
                          @"Jones",
                          nil];
    
    NSArray *firstPowers = [[NSArray alloc] initWithObjects:@"Super",
                          @"Cold",
                          @"Fire",
                          @"Poison",
                          @"Wind",
                          nil];
    
    NSArray *lastPowers = [[NSArray alloc] initWithObjects:@"Strength",
                           @"Breath",
                           @"Skin",
                           @"Armor",
                           @"Lasers",
                           nil];
    
    
    //temp variable
    Superhero *tempHero = [[Superhero alloc] init];
    
    //random numbers to pick
    int first = rand() % 5;
    int second = rand() % 5;
    
    //generate the name
    NSString *name = [[NSString alloc] initWithFormat:@"%@ %@", [firstNames objectAtIndex:first],
    [lastNames objectAtIndex:second]];
    
    //random numbers to pick

    first = rand() % 5;
    second = rand() % 5;
    
    //generate the power
    NSString *power = [[NSString alloc] initWithFormat:@"%@ %@", [firstPowers objectAtIndex:first],
                      [lastPowers objectAtIndex:second]];

    
    [tempHero SetName:name];
    [tempHero SetPower:power];
    
    
    return tempHero;
}

@end
