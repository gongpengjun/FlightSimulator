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
        [self schedule:@selector(addPlane) interval:3.0];
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

- (void)addPlane
{
    NSUInteger count = CCRANDOM_0_1() * 10 + 1;
    [self addPlaneCount:count];
}

- (void)addPlaneCount:(NSUInteger)countToAdd
{
    CGSize s = self.contentSize;
    NSUInteger countHasAdded = 0;
    for(Plane *plane in _planeArray)
    {
        if(plane.isRunningInActiveScene)
            continue;
        [self addChild:plane];
        int randomX = CCRANDOM_0_1() * s.width;
        int randomY = CCRANDOM_0_1() * s.height;
        plane.position = ccp(randomX, randomY);
        countHasAdded++;
        if(countToAdd == countHasAdded)
            break;
    }
}

@end
