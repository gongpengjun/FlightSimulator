//
//  MenuLayer.m
//  FlightSimulator
//
//  Created by Gong Pengjun on 14-6-30.
//  Copyright (c) 2014年 www.GongPengjun.com. All rights reserved.
//

#import "MenuLayer.h"
#import "StartScene.h"

@implementation MenuLayer

+ (MenuLayer*)layer
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

        CCButton *backButton = [CCButton buttonWithTitle:@"[ Menu ]" fontName:@"Verdana-Bold" fontSize:18.0];
        backButton.positionType = CCPositionTypeNormalized;
        backButton.position = ccp(0.90, 0.95);
        [backButton setTarget:self selector:@selector(onBackButtonAction:)];
        [self addChild:backButton];
    }
    return self;
}

#pragma mark - Action

- (void)onBackButtonAction:(id)sender
{
    [[CCDirector sharedDirector] replaceScene:[StartScene scene]
                               withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:1.0f]];
}

@end
