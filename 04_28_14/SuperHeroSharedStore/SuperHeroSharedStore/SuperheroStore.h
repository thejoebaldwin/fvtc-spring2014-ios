//
//  SuperheroStore.h
//  SuperheroStore
//
//  Created by student on 2/24/14.
//  Copyright (c) 2014 fvtc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "superhero.h"

@interface SuperheroStore : NSObject
{
    NSMutableArray *_superHeroes;
    NSMutableArray *_heroes;
}

//added 4/28
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSManagedObjectModel *model;


+ (SuperheroStore *) SharedStore;
- (void) AddSuperhero:(Superhero *) superhero;
- (Superhero *) SuperheroAtIndex:(NSInteger) index;
- (NSInteger) Count;
- (void) RemoveSuperheroAtIndex:(NSInteger) index;
- (void) Save;
- (void) Load;

@end
