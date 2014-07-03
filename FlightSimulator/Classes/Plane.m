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

- (void)moveWithLineRouteFrom:(CGPoint)from to:(CGPoint)to duration:(CCTime)dt direction:(BOOL)direction
{
    self.scaleX = direction ? 1 : -1;
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
    CGFloat h[] = {};
    CGFloat r[] = {};
    self.scaleX = direction ? 1 : -1;
    
    ccBezierConfig b1, b2;
    b1.controlPoint_1 = b1.controlPoint_2 = ccp(s.width/2 + (direction?r[0]:r[1])/3, direction?h[1]:h[0]);
    b1.endPosition = ccp(s.width/2, h[0]+r[0]);
    
    b2.controlPoint_1 = b2.controlPoint_2 = ccp(s.width/2 + (direction?r[1]:r[0])/3, direction?h[0]:h[1]);
    b1.endPosition = ccp(s.width/2 + (direction?r[1]:r[0]), direction?h[0]:h[1]);
    
    CCActionFiniteTime *move = nil;
    [self runAction:move];
}

- (void)moveTo:(CGPoint)destination
{
    [self moveTo:destination duration:20.0f];
}

- (void)moveTo:(CGPoint)destination duration:(CCTime)duration;
{
    CCActionMoveTo * moveTo = [CCActionMoveTo actionWithDuration:duration position:destination];
    __weak typeof(self) wself = self;
    CCActionCallBlock * endBlock = [CCActionCallBlock actionWithBlock:^{
        [wself removeFromParentAndCleanup:NO];
    }];
    CCActionFiniteTime * seq = [CCActionSequence actions:moveTo, endBlock, nil];
    seq.tag = kPlaneActionTagMove;
    [self runAction:seq];
}

@end
