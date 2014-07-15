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
    Plane *_plane;
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
        _plane = [Plane plane];
        _plane.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
        [self addChild:_plane];
    }
    return self;
}


- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    
    CGPoint touchLoc = [touch locationInNode:self];
    CCLOG(@"%s,%d %@",__FUNCTION__,__LINE__,NSStringFromCGPoint(touchLoc));
    
    ccBezierConfig bezierConfig;
#if 0
    bezierConfig.controlPoint_1 = ccp(100,100);
    bezierConfig.controlPoint_2 = ccp(100,-100);
    bezierConfig.endPosition = touchLoc;
    CCActionBezierTo *bezierAction = [CCActionBezierTo actionWithDuration:1.0f bezier:bezierConfig];
    [_plane runAction:bezierAction];
#elif 0
    CGPoint curLoc = _plane.position;
    bezierConfig.controlPoint_1 = ccp(curLoc.x,touchLoc.y);
    bezierConfig.controlPoint_2 = touchLoc;
    bezierConfig.endPosition = touchLoc;
    CCActionBezierTo *bezierAction = [CCActionBezierTo actionWithDuration:1.0f bezier:bezierConfig];
    [_plane runAction:bezierAction];
#else
    CGPoint curLoc = _plane.position;
    CGPoint centerLoc = ccpMidpoint(curLoc, touchLoc);
    
    bezierConfig.controlPoint_1 = ccp(centerLoc.x,curLoc.y);
    bezierConfig.controlPoint_2 = centerLoc;
    bezierConfig.endPosition = centerLoc;
    CCActionBezierTo *bezierAction1 = [CCActionBezierTo actionWithDuration:1.0f bezier:bezierConfig];
    
    bezierConfig.controlPoint_1 = ccp(centerLoc.x,touchLoc.y);
    bezierConfig.controlPoint_2 = touchLoc;
    bezierConfig.endPosition = touchLoc;
    CCActionBezierTo *bezierAction2 = [CCActionBezierTo actionWithDuration:1.0f bezier:bezierConfig];
    
    CCActionSequence *seq = [CCActionSequence actionOne:bezierAction1 two:bezierAction2];
    [_plane runAction:seq];
#endif
    
}

@end
