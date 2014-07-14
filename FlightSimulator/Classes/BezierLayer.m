//
//  BezierLayer.m
//  FlightSimulator
//
//  Created by 巩 鹏军 on 7/8/14.
//  Copyright 2014 www.GongPengjun.com. All rights reserved.
//

#import "BezierLayer.h"
#import "Plane.h"

@interface BezierLayer ()
{
    ccBezierConfig bezierConfig;
    CCActionBezierTo *bezierAction;
    Plane *plane;
}
@end

@implementation BezierLayer

+ (BezierLayer*)layer;
{
    return [[self alloc] init];
}

- (id)init
{
    self = [super init];
	if(self)
    {
        self.contentSize = [CCDirector sharedDirector].designSize;
        self.userInteractionEnabled = YES;
        plane = [Plane plane];
        plane.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
        [self addChild:plane];
    }
    return self;
}


- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchLoc = [touch locationInNode:self];
    CCLOG(@"%s,%d %@",__FUNCTION__,__LINE__,NSStringFromCGPoint(touchLoc));
    
    bezierConfig.controlPoint_1 = ccp(100,100);
    bezierConfig.controlPoint_2 = ccp(100,-100);
    bezierConfig.endPosition = touchLoc;
    
    bezierAction = [CCActionBezierTo actionWithDuration:1.0f bezier:bezierConfig];
    [plane runAction:bezierAction];
}

@end
