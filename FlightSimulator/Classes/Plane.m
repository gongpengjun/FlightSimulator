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

- (void)moveTo:(CGPoint)destination
{
    [self moveTo:destination duration:20.0f];
}

- (void)moveTo:(CGPoint)destination duration:(CCTime)duration;
{
    CCActionMoveTo * moveTo = [CCActionMoveTo actionWithDuration:duration position:destination];
    CCActionCallBlock * endBlock = [CCActionCallBlock actionWithBlock:^{
        [self removeFromParentAndCleanup:NO];
    }];
    CCActionFiniteTime * seq = [CCActionSequence actions:moveTo, endBlock, nil];
    seq.tag = kPlaneActionTagMove;
    [self runAction:seq];
}

@end
