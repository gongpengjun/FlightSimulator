//
//  Plane.m
//  FlightSimulator
//
//  Created by Gong Pengjun on 14-6-30.
//  Copyright (c) 2014年 www.GongPengjun.com. All rights reserved.
//

#import "Plane.h"

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
        _planeSprite = [CCSprite spriteWithImageNamed:@"plane-32.png"];
        [self addChild:_planeSprite];
    }
    return self;
}


@end
