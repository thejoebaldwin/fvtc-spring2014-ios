//
//  SuperheroStore.m
//  SuperheroStore
//
//  Created by student on 2/24/14.
//  Copyright (c) 2014 fvtc. All rights reserved.
//


#import "SuperheroStore.h"
#import "Hero.h"
#import "Hero+Methods.h"
#import <CoreData/CoreData.h>

@implementation SuperheroStore

-(id) init
{
    self = [super init];
    if (self) {
        
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
        
    }
    return self;
}

- (Hero*) CreateHero
{
    Hero *h = [NSEntityDescription insertNewObjectForEntityForName:@"Hero"
                                            inManagedObjectContext:self.context];
    [_heroes addObject:h];
    return h;
}


- (Hero*) CreateHero:(NSString *) name withPower:(NSString *) power withID:(NSNumber *) heroId
{
    Hero *h = [NSEntityDescription insertNewObjectForEntityForName:@"Hero"
                                            inManagedObjectContext:self.context];
    h.name = name;
    h.power = power;
    h.heroId = heroId;
    
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

- (void) AddSuperhero:(Hero *) hero
{
    [_heroes addObject:hero];
}

- (Hero *) SuperheroAtIndex:(NSInteger) index
{
    return [_heroes objectAtIndex:index];
}

- (NSInteger) Count
{
    return [_heroes count];
}

- (void) RemoveSuperheroAtIndex:(NSInteger) index
{
    [_heroes removeObjectAtIndex:index];
}

- (NSString *) ItemArchivePath
{
    //get all the document directories
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //get the first directory returned
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"store.data"];
    
    //write path to log
    NSLog(@"ArchivePath:%@", path);
    //return the path
    return path;
}

-(void) Save
{
    NSError *error;
    BOOL successful  = [self.context save:&error];
    if (!successful) {
        NSLog(@"Error Saving: %@", [error localizedDescription]);
    }
    
}

//NSString *filePath = [[NSBundle mainBundle] pathForResource:@"HeroData" ofType:@"txt"];

//NSData *localData = [[NSData alloc] initWithContentsOfFile:filePath];




-(void) Load
{
    if (!_heroes) {
        //build the query request
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *e = [NSEntityDescription entityForName:@"Hero"
                                             inManagedObjectContext:self.context];
        request.entity = e;
        
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"name"
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
        
        //create some random heroes if it is empty
        if ([_heroes count] == 0) {
            Hero *hero = [self CreateHero];
            [hero RandomizeHero];
            
            hero = [self CreateHero];
            [hero RandomizeHero];
            
            [self Save];

        }
        
        NSLog(@"Loaded: %@", _heroes);
    }
}

@end
