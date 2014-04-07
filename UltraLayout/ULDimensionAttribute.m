//
//  ULDimensionAttribute.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "ULDimensionAttribute.h"

@implementation ULDimensionAttribute

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
