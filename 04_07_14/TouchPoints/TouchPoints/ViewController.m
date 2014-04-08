//
//  ViewController.m
//  TouchPoints
//
//  Created by student on 4/7/14.
//  Copyright (c) 2014 FVTC. All rights reserved.
//

#import "ViewController.h"

#import "MovingShape.h"

#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _MovingShapes = [[NSMutableArray alloc] init];
   [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(Update) userInfo:nil repeats:YES];
 
    
    [self DrawLine:CGPointMake(100, 200)
           withEnd:CGPointMake(100, 800)];
    
  
    [self DrawLine:CGPointMake(300, 200)
           withEnd:CGPointMake(300, 800)];
    
    [self DrawLine:CGPointMake(100, 400)
           withEnd:CGPointMake(800, 400)];

    
    [self DrawLine:CGPointMake(100, 700)
           withEnd:CGPointMake(800, 700)];

    CGPoint topLeft = [self view].frame.origin;
    [self AddText:topLeft withText:@"hi there"];

    
    
    topLeft.x += 50;
    topLeft.y += 50;
    
    [self AddText:topLeft withText:@"hi there"];

    
    topLeft.x += 50;
    topLeft.y += 50;
    
    [self AddText:topLeft withText:@"hi there"];
    
    topLeft.x += 50;
    topLeft.y += 50;
    
    [self AddText:topLeft withText:@"hi there"];
    
    topLeft.x += 50;
    topLeft.y += 50;
    
    [self AddText:topLeft withText:@"hi there"];
    

}


-(void) AddText:(CGPoint) p withText:(NSString*) text
{
    CATextLayer *label = [[CATextLayer alloc] init];
    [label setFont:@"Helvetica-Bold"];
    [label setFontSize:10];
    [label setFrame:[self.view.layer frame]];
    [label setPosition:p];
    [label setAnchorPoint:CGPointMake(0, 0)];
    [label setString:  text];
    [label setAlignmentMode:kCAAlignmentLeft];
    [label setForegroundColor:[[UIColor blackColor] CGColor]];
    [[[self view] layer] addSublayer:label];
}

-(void) DrawLine:(CGPoint) start withEnd:(CGPoint) end
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:start];
    [path addLineToPoint:end];
    [path closePath];
    
    MovingShape *line = [MovingShape layer];
    line.path = path.CGPath;
    line.fillColor = [UIColor blackColor].CGColor;
    line.lineWidth = 3.0;
    line.strokeColor = [UIColor blackColor].CGColor;
    [[[self view] layer] addSublayer:line];
}





-(void) Update
{
    for (int i = 0; i < [_MovingShapes count];i++)
    {
        [[_MovingShapes objectAtIndex:i] Update];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) AddCircle:(CGPoint) p
{
    NSLog(@"Touching point:%f, %f", p.x, p.y);
    
    //create a layer aka a canvas to draw on
    MovingShape *circle = [MovingShape layer];
    //create a rectangle to bound the bezier curve
    CGRect circleRectangle = CGRectMake(0, 0, 50, 50);
    //tell the layer that it's a circle
    circle.path = [UIBezierPath bezierPathWithRoundedRect:circleRectangle cornerRadius:50].CGPath;
    //set the position of the circle
    
    p.x -= 25;
    p.y -= 25;
    
    circle.position = p;
    //set the fill color of the circle
    circle.fillColor = [UIColor redColor].CGColor;
    circle.strokeColor = [UIColor blackColor].CGColor;
    
    
    [[[self view] layer] addSublayer:circle];
    
    //[circle SetVelocity:0.5f withY:0.5f];
    [circle SetBounds:[[self view] bounds]];
    
    
    [_MovingShapes addObject:circle];
    
  
    
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the point where the touch occurred in the view
    CGPoint p = [[touches anyObject] locationInView:self.view];

    
    bool collision = NO;
    
    for (CAShapeLayer *l in self.view.layer.sublayers)
    {
        
        if ([l isKindOfClass:[CAShapeLayer class]])
        {
            
                CGAffineTransform transform = CGAffineTransformMakeTranslation(-l.position.x, -l.position.y);
       
                if (CGPathContainsPoint(l.path, &transform,  p, NO))
                {
                    l.fillColor = [UIColor yellowColor].CGColor;
                    collision = YES;
                }
        }
        
    }
    
    if (!collision) [self AddCircle:p];
    
}

@end
