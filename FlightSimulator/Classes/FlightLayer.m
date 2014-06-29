//
//  FlightLayer.m
//  FlightSimulator
//
//  Created by Gong Pengjun on 14-6-30.
//  Copyright (c) 2014年 www.GongPengjun.com. All rights reserved.
//

#import "FlightLayer.h"

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
        CGSize s = [CCDirector sharedDirector].designSize;
        self.contentSize = s;
    }
    return self;
}

@end
