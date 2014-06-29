//
//  Plane.h
//  FlightSimulator
//
//  Created by Gong Pengjun on 14-6-30.
//  Copyright (c) 2014年 www.GongPengjun.com. All rights reserved.
//

#import "CCSprite.h"

@interface Plane : CCNode

+ (Plane*)plane;

@property (nonatomic, assign) NSUInteger tag;

@end
