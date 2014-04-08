//
//  MovingShape.h
//  TouchPoints
//
//  Created by student on 4/7/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface MovingShape : CAShapeLayer
{
    float velocity_x;
    float velocity_y;
    CGRect _bounds;
}

-(void) SetVelocity:(float) x withY: (float) y;

-(void) SetBounds:(CGRect) bounds;

+ (id)layer;

-(void) Update;




@end
