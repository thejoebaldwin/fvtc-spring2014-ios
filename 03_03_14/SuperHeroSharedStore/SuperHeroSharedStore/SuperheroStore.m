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

- (void) RemoveSuperheroAtIndex:(NSInteger) index
{
    [_superHeroes removeObjectAtIndex:index];
}

- (NSString *) ItemArchivePath
{
    //get all the document directories
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //get the first directory returned
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    //build a unique archive for this application
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"superherostore.archive"];
    //write path to log
    NSLog(@"ArchivePath:%@", path);
    //return the path
    return path;
}

-(void) Save
{
    NSString *path = [self ItemArchivePath];
    BOOL success = [NSKeyedArchiver archiveRootObject:_superHeroes toFile:path];
    if (success) {
        NSLog(@"Saved:%@", _superHeroes);
    }
    else
    {
        NSLog(@"Problem with Save.");
    }
}

-(void) Load
{
     NSString *path = [self ItemArchivePath];
    _superHeroes = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (!_superHeroes) {
        _superHeroes = [[NSMutableArray alloc] init];
    }
}

@end
