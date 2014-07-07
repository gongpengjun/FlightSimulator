//
//  BezierLayer.m
//  FlightSimulator
//
//  Created by 巩 鹏军 on 7/8/14.
//  Copyright 2014 www.GongPengjun.com. All rights reserved.
//

#import "BezierLayer.h"


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
    }
    return self;
}


@end
