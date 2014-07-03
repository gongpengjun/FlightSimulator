//
//  Plane.h
//  FlightSimulator
//
//  Created by Gong Pengjun on 14-6-30.
//  Copyright (c) 2014年 www.GongPengjun.com. All rights reserved.
//

#import "cocos2d.h"

@interface Plane : CCNode

+ (Plane*)plane;

@property (nonatomic, assign) NSUInteger tag;

- (void)reset;
- (void)moveWithLinerRouteFrom:(CGPoint)from to:(CGPoint)to duration:(CCTime)dt direction:(BOOL)direction;
- (void)moveWithBezierRouteFrom:(CGPoint)from to:(CGPoint)to duration:(CCTime)dt direction:(BOOL)direction;

@end
