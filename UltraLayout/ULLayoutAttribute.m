//
//  ULLayoutAttribute.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "ULLayoutAttribute.h"

#import "NSLayoutConstraint+ULExtensions.h"
#import "ULLayoutItem.h"

#import "ULLayoutDimension.h"

@implementation ULLayoutAttribute

- (id)initWithItem:(id)item attribute:(NSLayoutAttribute)attr {
    // If we're constructing the superclass...
    if(self.class == [ULLayoutAttribute class]) {
        // Try to choose a more specific subclass.
        switch(attr) {
            case NSLayoutAttributeHeight:
            case NSLayoutAttributeWidth:
                return [[ULLayoutDimension alloc] initWithItem:item attribute:attr];
                
            default:
                break;
        }
    }
    
    if((self = [super init])) {
        if([item isKindOfClass:ULLayoutItem.class]) {
            item = [(ULLayoutItem*)item item];
        }
        
        _item = item;
        _attribute = attr;
    }
    return self;
}

+ (ULLayoutAttribute*)nonAttribute {
    return [[self alloc] initWithItem:nil attribute:NSLayoutAttributeNotAnAttribute];
}

- (NSLayoutConstraint*)constraintForRelation:(NSLayoutRelation)relation toAttribute:(ULLayoutAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    if(other == nil) {
        other = [ULLayoutAttribute nonAttribute];
    }
    
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.item attribute:self.attribute relatedBy:relation toItem:other.item attribute:other.attribute multiplier:1.0 constant:offset];
    constraint.priority = priority;
    
    return constraint;
}

- (NSLayoutConstraint*)constraintConstrainingTo:(ULLayoutAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [self constraintForRelation:NSLayoutRelationEqual toAttribute:other offset:offset priority:priority];
}

- (NSLayoutConstraint*)constraintConstrainingUpTo:(ULLayoutAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [self constraintForRelation:NSLayoutRelationLessThanOrEqual toAttribute:other offset:offset priority:priority];
}

- (NSLayoutConstraint*)constraintConstrainingDownTo:(ULLayoutAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [self constraintForRelation:NSLayoutRelationGreaterThanOrEqual toAttribute:other offset:offset priority:priority];

}

- (NSLayoutConstraint*)constrainTo:(ULLayoutAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [[self constraintConstrainingTo:other offset:offset priority:priority] add];
}

- (NSLayoutConstraint*)constrainUpTo:(ULLayoutAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [[self constraintConstrainingUpTo:other offset:offset priority:priority] add];
}

- (NSLayoutConstraint*)constrainDownTo:(ULLayoutAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [[self constraintConstrainingDownTo:other offset:offset priority:priority] add];
}

- (NSLayoutConstraint*)constrainTo:(ULLayoutAttribute*)other {
    return [self constrainTo:other offset:0.0 priority:ULLayoutPriorityRequired];
}

- (NSLayoutConstraint*)constrainUpTo:(ULLayoutAttribute*)other {
    return [self constrainUpTo:other offset:0.0 priority:ULLayoutPriorityRequired];
}

- (NSLayoutConstraint*)constrainDownTo:(ULLayoutAttribute*)other {
    return [self constrainDownTo:other offset:0.0 priority:ULLayoutPriorityRequired];
}

- (ULLayoutAttribute *)superviewAttribute {
    return [[ULLayoutAttribute alloc] initWithItem:[self.item superview] attribute:self.attribute];
}

- (NSLayoutConstraint *)constrainToSuperviewWithOffset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [self constrainTo:self.superviewAttribute offset:offset priority:priority];
}

- (NSLayoutConstraint *)constrainUpToSuperviewWithOffset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [self constrainUpTo:self.superviewAttribute offset:offset priority:priority];    
}

- (NSLayoutConstraint *)constrainDownToSuperviewWithOffset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [self constrainDownTo:self.superviewAttribute offset:offset priority:priority];
}

- (NSLayoutConstraint *)constrainToSuperview {
    return [self constrainToSuperviewWithOffset:0 priority:ULLayoutPriorityRequired];
}

- (NSLayoutConstraint *)constrainUpToSuperview {
    return [self constrainUpToSuperviewWithOffset:0 priority:ULLayoutPriorityRequired];
}

- (NSLayoutConstraint *)constrainDownToSuperview {
    return [self constrainDownToSuperviewWithOffset:0 priority:ULLayoutPriorityRequired];
}

@end
