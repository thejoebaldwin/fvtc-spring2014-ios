//
//  SuperheroStore.m
//  SuperheroStore
//
//  Created by student on 2/24/14.
//  Copyright (c) 2014 fvtc. All rights reserved.
//

#import "SuperheroStore.h"

@implementation SuperheroStore

-(id) init
{
    self = [super init];
    if (self) {
        _superHeroes = [[NSMutableArray alloc] init];
        
        [_superHeroes addObject:[Superhero RandomSuperhero]];
        [_superHeroes addObject:[Superhero RandomSuperhero]];
        [_superHeroes addObject:[Superhero RandomSuperhero]];
        [_superHeroes addObject:[Superhero RandomSuperhero]];
        [_superHeroes addObject:[Superhero RandomSuperhero]];
        [_superHeroes addObject:[Superhero RandomSuperhero]];
        
        NSLog(@"Instantiating Test Heroes:%@", _superHeroes);
        
    }
    return self;
}

+ (SuperheroStore *) SharedStore
{
    static SuperheroStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

- (void) AddSuperhero:(Superhero *) superhero
{
    [_superHeroes addObject:superhero];
}

- (Superhero *) SuperheroAtIndex:(NSInteger) index
{
    return [_superHeroes objectAtIndex:index];
}

- (NSInteger) Count
{
    return [_superHeroes count];
}

@end
