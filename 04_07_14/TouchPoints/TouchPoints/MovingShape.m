//
//  MovingShape.m
//  TouchPoints
//
//  Created by student on 4/7/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "MovingShape.h"

@implementation MovingShape


-(void) SetVelocity:(float) x withY: (float) y
{
    velocity_x = x;
    velocity_y = y;
}


-(void) Update
{
    
    CGPoint temp = CGPointMake(
                               [self position].x + velocity_x,
                               [self position].y + velocity_y
                               );
    self.position = temp;

    if ([self position].x >= _bounds.origin.x + _bounds.size.width ||
       ([self position].x <= _bounds.origin.x)
        )
    {
        velocity_x *= -1;
    }

    if ([self position].y >= _bounds.origin.y + _bounds.size.height ||
        ([self position].y <= _bounds.origin.y)
        )
    {
        velocity_y *= -1;
    }
    
    
}

-(void) SetBounds:(CGRect) bounds
{
    _bounds = bounds;
}


+ (id)layer
{
    MovingShape *temp = [super layer];
    
    int x = arc4random() % 4;
    int y = arc4random() % 4;
    if (arc4random() % 2) x *= -1;
    if (arc4random() % 2) y *= -1;
    
    [temp SetVelocity:x withY:y];
    return temp;
}

@end
