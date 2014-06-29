//
//  MainScene.m
//  FlightSimulator
//
//  Created by Gong Pengjun on 14-6-29.
//  Copyright (c) 2014年 www.GongPengjun.com. All rights reserved.
//

#import "MainScene.h"
#import "IntroScene.h"
#import "cocos2d-ui.h"

@implementation MainScene

+ (MainScene *)scene;
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
    CCNode * bgLayer = [CCNode node];
    bgLayer.contentSize = [CCDirector sharedDirector].designSize;
    bgLayer.position = CGPointZero;
    {
        CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor colorWithRed:0.2f green:0.2f blue:0.2f alpha:1.0f]];
        [bgLayer addChild:background];
        
        CCSprite *map = [CCSprite spriteWithImageNamed:@"1024px-world_map_blank.png"];
        map.anchorPoint = ccp(0, 0);
        map.positionType = CCPositionTypeNormalized;
        map.position = ccp(0, 0);
        map.scaleX = [CCDirector sharedDirector].designSize.width / map.contentSize.width;
        map.scaleY = [CCDirector sharedDirector].designSize.height / map.contentSize.height;
        [bgLayer addChild:map];
    }
    return bgLayer;
}

- (CCNode*)flightLayer
{
    CCNode* fishLayer = [CCNode node];
    fishLayer.contentSize = [CCDirector sharedDirector].designSize;
    fishLayer.position = CGPointZero;
    {
        
    }
    return fishLayer;
}

- (CCNode*)menuLayer
{
    CCNode* menuLayer = [CCNode node];
    menuLayer.contentSize = [CCDirector sharedDirector].designSize;
    menuLayer.position = CGPointZero;
    {
        CCButton *backButton = [CCButton buttonWithTitle:@"[ Back ]" fontName:@"Verdana-Bold" fontSize:18.0];
        backButton.positionType = CCPositionTypeNormalized;
        backButton.position = ccp(0.90, 0.95);
        [backButton setTarget:self selector:@selector(onBackButtonAction:)];
        [menuLayer addChild:backButton];
    }
    return menuLayer;
}

#pragma mark - Action

- (void)onBackButtonAction:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[IntroScene scene]
                               withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:1.0f]];
}

@end
