//
//  Hero.h
//  SuperHeroSharedStore
//
//  Created by student on 4/28/14.
//  Copyright (c) 2014 fvtc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Hero : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSNumber * heroId;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * power;
@property (nonatomic, retain) NSString * secret;

-(void) RandomizeHero;

@end
