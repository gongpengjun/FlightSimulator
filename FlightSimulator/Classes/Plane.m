//
//  Plane.m
//  FlightSimulator
//
//  Created by Gong Pengjun on 14-6-30.
//  Copyright (c) 2014年 www.GongPengjun.com. All rights reserved.
//

#import "Plane.h"

typedef NS_ENUM(NSInteger, PlaneActionTag) {
    kPlaneActionTagMove,
    kPlaneActionTagLineRoute,
};


@interface Plane ()
{
    CCSprite *_planeSprite;
}
@end

@implementation Plane

+ (Plane*)plane;
{
    return [[self alloc] init];
}

- (id)init
{
    self = [super init];
	if(self)
    {
        _planeSprite = [CCSprite spriteWithImageNamed:@"plane-64.png"];
        [self addChild:_planeSprite];
        
        self.contentSize = _planeSprite.contentSize;
    }
    return self;
}

- (void)reset;
{
    self.rotation = 0;
    self.visible = YES;
}

- (void)moveWithLinerRouteFrom:(CGPoint)from to:(CGPoint)to duration:(CCTime)dt direction:(BOOL)direction
{
    self.scaleX = direction ? -1 : 1;
    self.position = from;
    CCActionMoveTo * moveTo = [CCActionMoveTo actionWithDuration:dt position:to];
    __weak typeof(self) wself = self;
    CCActionCallBlock * endBlock = [CCActionCallBlock actionWithBlock:^{
        [wself removeFromParentAndCleanup:NO];
    }];
    CCActionFiniteTime * seq = [CCActionSequence actions:moveTo, endBlock, nil];
    seq.tag = kPlaneActionTagLineRoute;
    [self runAction:seq];
}

- (void)moveWithBezierRouteFrom:(CGPoint)from to:(CGPoint)to duration:(CCTime)dt direction:(BOOL)direction
{
    CGSize s = self.parent.contentSize;
    CGFloat h[] = { 55.0f, s.height - 10.0f};
    CGFloat r[] = {(h[1]-h[0])/2, -(h[1]-h[0])/2};
    self.scaleX = direction ? 1 : -1;
    
    ccBezierConfig b1, b2;
    b1.controlPoint_1 = b1.controlPoint_2 = ccp(s.width/2 + (direction?r[0]:r[1])/3, direction?h[1]:h[0]);
    b1.endPosition = ccp(s.width/2, h[0]+r[0]);
    
    b2.controlPoint_1 = b2.controlPoint_2 = ccp(s.width/2 + (direction?r[1]:r[0])/3, direction?h[0]:h[1]);
    b1.endPosition = ccp(s.width/2 + (direction?r[1]:r[0]), direction?h[0]:h[1]);
    
    CCActionMoveTo   *move1   = [CCActionMoveTo actionWithDuration:dt/4 position:ccp(s.width/2 + direction?r[0]:r[1], direction?h[1]:h[0])];
    CCActionBezierTo *bezier1 = [CCActionBezierTo actionWithDuration:dt/4 bezier:b1];
    CCActionBezierTo *bezier2 = [CCActionBezierTo actionWithDuration:dt/4 bezier:b2];
    CCActionMoveTo *move2 = [CCActionMoveTo actionWithDuration:dt/4 position:to];
    __weak typeof(self) wself = self;
    CCActionCallBlock * endBlock = [CCActionCallBlock actionWithBlock:^{
        [wself removeFromParentAndCleanup:NO];
    }];
    CCActionFiniteTime *seq = [CCActionSequence actions:move1, bezier1, bezier2, move2, endBlock, nil];
    [self runAction:seq];
}

@end
