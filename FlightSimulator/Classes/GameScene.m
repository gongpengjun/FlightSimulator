//
//  GameScene.m
//  FlightSimulator
//
//  Created by Gong Pengjun on 14-6-29.
//  Copyright (c) 2014年 www.GongPengjun.com. All rights reserved.
//

#import "GameScene.h"
#import "IntroScene.h"
#import "cocos2d-ui.h"
#import "BackgroundLayer.h"
#import "FlightLayer.h"
#import "MenuLayer.h"

@implementation GameScene

+ (GameScene *)scene;
{
    return [[self alloc] init];
}

- (id)init
{
    self = [super init];
	if(self)
    {
        [self addChild:[self backgroundLayer]];
        [self addChild:[self flightLayer]];
        [self addChild:[self menuLayer]];
    }
    return self;
}

#pragma mark - Layers

- (CCNode*)backgroundLayer
{
    return [BackgroundLayer layer];
}

- (CCNode*)flightLayer
{
    return [FlightLayer layer];
}

- (CCNode*)menuLayer
{
    return [MenuLayer layer];
}

@end
