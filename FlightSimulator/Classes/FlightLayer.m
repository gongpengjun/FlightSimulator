//
//  FlightLayer.m
//  FlightSimulator
//
//  Created by Gong Pengjun on 14-6-30.
//  Copyright (c) 2014年 www.GongPengjun.com. All rights reserved.
//

#import "FlightLayer.h"
#import "Plane.h"

@interface FlightLayer ()
{
    NSMutableArray * _planeArray;
}
@end


@implementation FlightLayer

+ (FlightLayer*)layer;
{
    return [[self alloc] init];
}

- (id)init
{
    self = [super init];
	if(self)
    {
        self.contentSize = [CCDirector sharedDirector].designSize;
        [self loadPlanes];
        [self addOnePlane];
        [self schedule:@selector(addOnePlane) interval:3.0];
    }
    return self;
}

- (void)loadPlanes
{
    NSUInteger capacity = 50;
    _planeArray = [NSMutableArray arrayWithCapacity:capacity];
    for(NSUInteger i = 0; i < capacity; i++) {
        Plane* plane = [Plane plane];
        plane.tag = i;
        [_planeArray addObject:plane];
    }
}

- (void)addOnePlane
{
    [self addPlaneCount:1];
}

- (void)addPlanes
{
    NSUInteger count = CCRANDOM_0_1() * 2 + 1;
    [self addPlaneCount:count];
}

- (void)addPlaneCount:(NSUInteger)countToAdd
{
    NSUInteger countHasAdded = 0;
    for(Plane *plane in _planeArray)
    {
        if(plane.isRunningInActiveScene)
            continue;
        [self addChild:plane];
        [self resetPlane:plane];
        countHasAdded++;
        if(countToAdd == countHasAdded)
            break;
    }
}

- (void)resetPlane:(Plane*)plane
{
    [plane reset];
    CGFloat startX, startY, endX, endY;
    CGSize winSize = self.contentSize;
    CGSize planeSize = plane.contentSize;
    int direction = CCRANDOM_0_1()*2;
    CGFloat leftPos = -planeSize.width*0.5;
    CGFloat rightPos = winSize.width + planeSize.width*0.5;
    if(direction) {
        plane.scaleX = -1;
        startX = rightPos;
        endX   = leftPos;
    } else {
        plane.scaleX = 1;
        startX = leftPos;
        endX   = rightPos;
    }
    startY = CCRANDOM_0_1()*(winSize.height-2*planeSize.height) + planeSize.height;
    endY   = CCRANDOM_0_1()*(winSize.height-2*planeSize.height) + planeSize.height;
    
    CGPoint start = ccp(startX, startY);
    CGPoint end = ccp(endX, endY);
    CGFloat duration = CCRANDOM_0_1()*10.0f + 5.0f;
    plane.position = start;
    [plane moveTo:end duration:duration];
}

@end
