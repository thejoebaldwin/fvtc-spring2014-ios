//
//  Hero.m
//  SuperHeroSharedStore
//
//  Created by student on 4/28/14.
//  Copyright (c) 2014 fvtc. All rights reserved.
//

#import "Hero.h"


@implementation Hero

@dynamic age;
@dynamic heroId;
@dynamic image;
@dynamic name;
@dynamic power;
@dynamic secret;



-(void) RandomizeHero
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
    //Hero *tempHero = [[Hero alloc] init];
    
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
    
    
    
    
    
    //random numbers to pick
    
    first = arc4random() % [firstPowers count];
    second = arc4random() % [lastPowers count];
    
    //generate the power
    NSString *power = [[NSString alloc] initWithFormat:@"%@ %@", [firstPowers objectAtIndex:first],
                       [lastPowers objectAtIndex:second]];
    
    self.name = name;
    self.secret = secret;
    self.power = power;
    self.age =   [[NSNumber alloc] initWithInt: (arc4random() % 80) + 20];
    //this shouldn't be needed as core data auto increments an internal primary key for us
    self.heroId =  [[NSNumber alloc] initWithInt: (arc4random() % 100)];
    
    
 }



@end
