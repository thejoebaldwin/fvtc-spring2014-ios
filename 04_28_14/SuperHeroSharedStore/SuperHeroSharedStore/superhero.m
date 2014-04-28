//
//  superhero.m
//  SuperHeros
//
//  Created by student on 2/3/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "superhero.h"

@implementation Superhero


-(void) encodeWithCoder:(NSCoder *) aCoder
{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_power forKey:@"power"];
    [aCoder encodeObject:_secret forKey:@"secret"];
}

-(id) initWithCoder:(NSCoder *) aDecoder
{
    self = [super init];
    if (self) {
        [self SetName:[aDecoder decodeObjectForKey:@"name"]];
        [self SetPower:[aDecoder decodeObjectForKey:@"power"]];
        [self SetSecret:[aDecoder decodeObjectForKey:@"secret"]];
    }
    return self;
    
}


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
    NSArray *firstSecrets = [[NSArray alloc] initWithObjects:@"Joe",
                           @"Rick",
                           @"Jon",
                           @"Carl",
                           @"Suzy",
                           nil];
    NSArray *lastSecrets = [[NSArray alloc] initWithObjects:@"Thompson",
                          @"Richards",
                          @"Stevenson",
                          @"Smith",
                          @"Jones",
                          nil];

    NSArray *firstNames = [[NSArray alloc] initWithObjects:@"Dark",
                             @"Liquid",
                             @"King",
                             @"Professor",
                             @"Ms.",
                             @"Mr.",
                             @"Golden",
                             nil];
    
    NSArray *lastNames = [[NSArray alloc] initWithObjects:@"Dragon",
                            @"Robot",
                            @"Ninja",
                            @"Pirate",
                            @"Unicorn",
                            @"Volcano",
                            @"Tornado",
                            @"Earthquake",
                            @"Skeleton",
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
    int first = arc4random() % [firstSecrets count];
    int second = arc4random() % [lastSecrets count];
    
    //generate the name
    NSString *secret = [[NSString alloc] initWithFormat:@"%@ %@", [firstSecrets objectAtIndex:first],
    [lastSecrets objectAtIndex:second]];
    
    
    first = arc4random() % [firstNames count];
    second = arc4random() % [lastNames count];
    
    //generate the name
    NSString *name = [[NSString alloc] initWithFormat:@"%@ %@", [firstNames objectAtIndex:first],
                        [lastNames objectAtIndex:second]];

    [tempHero SetName:name];
    
    //random numbers to pick

    first = arc4random() % [firstPowers count];
    second = arc4random() % [lastPowers count];
    
    //generate the power
    NSString *power = [[NSString alloc] initWithFormat:@"%@ %@", [firstPowers objectAtIndex:first],
                      [lastPowers objectAtIndex:second]];

    
    [tempHero SetSecret:secret];
    [tempHero SetPower:power];
    
    
    return tempHero;
}

@end
