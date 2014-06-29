//
//  BackgroundLayer.m
//  FlightSimulator
//
//  Created by Gong Pengjun on 14-6-30.
//  Copyright (c) 2014年 www.GongPengjun.com. All rights reserved.
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer

+ (BackgroundLayer*)layer;
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

        CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor colorWithRed:0.2f green:0.2f blue:0.2f alpha:1.0f]];
        [self addChild:background];
        
        CCSprite *map = [CCSprite spriteWithImageNamed:@"1024px-world_map_blank.png"];
        map.scaleX = self.contentSize.width / map.contentSize.width;
        map.scaleY = self.contentSize.height / map.contentSize.height;
        map.anchorPoint = ccp(0, 0);
        map.position = CGPointZero;
        [self addChild:map];
    }
    return self;
}

@end
