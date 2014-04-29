//
//  SuperheroStore.m
//  SuperheroStore
//
//  Created by student on 2/24/14.
//  Copyright (c) 2014 fvtc. All rights reserved.
//


#import "SuperheroStore.h"
#import "Hero.h"

#import <CoreData/CoreData.h>

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
        
        //read in hero .xcdatamodel
        _model = [NSManagedObjectModel mergedModelFromBundles:nil];
        NSPersistentStoreCoordinator *psc =  [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
        //where should be stored
        NSString *path = [self ItemArchivePath];
        NSURL *storeURL = [NSURL fileURLWithPath:path];
        NSError *error;
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                               configuration:nil
                                         URL:storeURL
                                     options:nil
                                       error:&error]) {
            [NSException raise:@"Open Failure" format:[error localizedDescription]];
        }
        
        //create the managed object context
        _context = [[NSManagedObjectContext alloc] init];
        _context.persistentStoreCoordinator = psc;
        
        
        [self CreateHero:@"Thor" withPower:@"Hammer" withID: [[NSNumber alloc] initWithInt:1 ]];
        [self Save];
        
    }
    return self;
}

- (Hero*) CreateHero:(NSString *) name withPower:(NSString *) power withID:(NSNumber *) id
{
    Hero *h = [NSEntityDescription insertNewObjectForEntityForName:@"Hero"
                                            inManagedObjectContext:self.context];
    h.name = name;
    h.power = power;
    h.id = id;
    
    [_heroes addObject:h];
    
    return h;
    
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
    //NSString *path = [documentDirectory stringByAppendingPathComponent:@"superherostore.archive"];
    
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"store.data"];
    
    //write path to log
    NSLog(@"ArchivePath:%@", path);
    //return the path
    return path;
}

-(void) Save
{
    /*
    NSString *path = [self ItemArchivePath];
    BOOL success = [NSKeyedArchiver archiveRootObject:_superHeroes toFile:path];
    if (success) {
        NSLog(@"Saved:%@", _superHeroes);
    }
    else
    {
        NSLog(@"Problem with Save.");
    }
    */
    NSError *error;
    BOOL successful  = [self.context save:&error];
    if (!successful) {
        NSLog(@"Error Saving: %@", [error localizedDescription]);
    }
    
}

-(void) Load
{
    // NSString *path = [self ItemArchivePath];
    //_superHeroes = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (!_heroes) {
        //_heroes = [[NSMutableArray alloc] init];

        //build the query request
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *e = [NSEntityDescription entityForName:@"Hero"
                                             inManagedObjectContext:self.context];
        request.entity = e;
        
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"id"
                                                             ascending:YES];
        request.sortDescriptors = @[sd];
      
        //make the query
        NSError *error;
        NSArray *result = [self.context executeFetchRequest:request error:&error];
        if (!result) {
            [NSException raise:@"Fetch Failed"
                        format:@"Reason: %@", [error localizedDescription]];
        }
        _heroes = [[NSMutableArray alloc] initWithArray:result];
        NSLog(@"Loaded: %@", _heroes);
    }
}

@end
