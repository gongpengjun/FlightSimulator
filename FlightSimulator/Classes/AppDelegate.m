//
//  AppDelegate.m
//  FlightSimulator
//
//  Created by Gong Pengjun on 14-6-29.
//  Copyright www.GongPengjun.com 2014年. All rights reserved.
//
// -----------------------------------------------------------------------

#import "AppDelegate.h"
#import "IntroScene.h"

@implementation AppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[self setupCocos2dWithOptions:@{
        CCSetupShowDebugStats : @(YES),
    }];
	return YES;
}

-(CCScene *)startScene
{
	return [IntroScene scene];
}

@end
