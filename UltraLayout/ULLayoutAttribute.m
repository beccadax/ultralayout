//
//  ULLayoutAttribute.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "ULLayoutAttribute.h"

#import "NSLayoutConstraint+ULExtensions.h"

@implementation ULLayoutAttribute

- (id)initWithItem:(id)item attribute:(NSLayoutAttribute)attr {
    if((self = [super init])) {
        _item = item;
        _attribute = attr;
    }
    return self;
}

+ (ULLayoutAttribute*)nonAttribute {
    return [[self alloc] initWithItem:nil attribute:NSLayoutAttributeNotAnAttribute];
}

- (NSLayoutConstraint*)constraintForAttribute:(ULLayoutAttribute*)other offset:(CGFloat)offset priority:(UILayoutPriority)priority {
    if(other == nil) {
        other = [ULLayoutAttribute nonAttribute];
    }
    
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.item attribute:self.attribute relatedBy:NSLayoutRelationEqual toItem:other.item attribute:other.attribute multiplier:1.0 constant:offset];
    constraint.priority = priority;
    
    return constraint;
}

- (NSLayoutConstraint*)constrainTo:(ULLayoutAttribute*)other offset:(CGFloat)offset priority:(UILayoutPriority)priority {
    return [[self constraintForAttribute:other offset:offset priority:priority] add];
}

- (NSLayoutConstraint*)constrainTo:(ULLayoutAttribute*)other {
    return [self constrainTo:other offset:0.0 priority:UILayoutPriorityRequired];
}

- (NSLayoutConstraint*)constrainToValue:(CGFloat)value {
    return [self constrainTo:[self.class nonAttribute] offset:value priority:UILayoutPriorityRequired];
}

@end
