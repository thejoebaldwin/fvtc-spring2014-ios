//
//  SuperheroStore.h
//  SuperheroStore
//
//  Created by student on 2/24/14.
//  Copyright (c) 2014 fvtc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hero.h"

@interface SuperheroStore : NSObject
{


}

//added 4/28
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSManagedObjectModel *model;
@property (nonatomic, strong) NSMutableArray *heroes;

+ (SuperheroStore *) SharedStore;
- (void) AddSuperhero:(Hero *) superhero;
- (Hero *) SuperheroAtIndex:(NSInteger) index;
- (NSInteger) Count;
- (void) RemoveSuperheroAtIndex:(NSInteger) index;
- (void) Save;
- (void) Load;
- (Hero*) CreateHero;

@end
