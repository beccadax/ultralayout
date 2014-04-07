//
//  ULLayoutDimension.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "ULLayoutDimension.h"

@implementation ULLayoutDimension

- (NSLayoutConstraint*)constrainToValue:(CGFloat)value {
    return [self constrainTo:nil offset:value priority:ULLayoutPriorityRequired];
}

- (NSLayoutConstraint*)constrainUpToValue:(CGFloat)value {
    return [self constrainUpTo:nil offset:value priority:ULLayoutPriorityRequired];
}

- (NSLayoutConstraint*)constrainDownToValue:(CGFloat)value {
    return [self constrainDownTo:nil offset:value priority:ULLayoutPriorityRequired];
}

@end
