//
//  ULAttribute.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "ULAttribute.h"

#import "NSLayoutConstraint+ULExtensions.h"
#import "ULItem.h"

#import "ULDimensionAttribute.h"
#import "ULLayoutPosition.h"

@implementation ULAttribute

- (id)initWithItem:(id)item attribute:(NSLayoutAttribute)attr {
    // If we're constructing the superclass...
    if(self.class == [ULAttribute class]) {
        // Try to choose a more specific subclass.
        switch(attr) {
            case NSLayoutAttributeHeight:
            case NSLayoutAttributeWidth:
                return [[ULDimensionAttribute alloc] initWithItem:item attribute:attr];
                
            case NSLayoutAttributeTop:
            case NSLayoutAttributeCenterY:
            case NSLayoutAttributeBaseline:
            case NSLayoutAttributeBottom:
                return [[ULYPositionAttribute alloc] initWithItem:item attribute:attr];
                
            case NSLayoutAttributeLeft:
            case NSLayoutAttributeLeading:
            case NSLayoutAttributeCenterX:
            case NSLayoutAttributeTrailing:
            case NSLayoutAttributeRight:
                return [[ULXPositionAttribute alloc] initWithItem:item attribute:attr];
                
            case NSLayoutAttributeNotAnAttribute:
                // Handled by ULAttribute
                break;
        }
    }
    
    if((self = [super init])) {
        if([item isKindOfClass:ULItem.class]) {
            item = [(ULItem*)item item];
        }
        
        _item = item;
        _attribute = attr;
    }
    return self;
}

+ (ULAttribute*)nonAttribute {
    return [[self alloc] initWithItem:nil attribute:NSLayoutAttributeNotAnAttribute];
}

- (NSLayoutConstraint*)constraintForRelation:(NSLayoutRelation)relation toAttribute:(ULAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    if(other == nil) {
        other = [ULAttribute nonAttribute];
    }
    
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self.item attribute:self.attribute relatedBy:relation toItem:other.item attribute:other.attribute multiplier:1.0 constant:offset];
    constraint.priority = priority;
    
    return constraint;
}

- (NSLayoutConstraint*)constraintConstrainingTo:(ULAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [self constraintForRelation:NSLayoutRelationEqual toAttribute:other offset:offset priority:priority];
}

- (NSLayoutConstraint*)constraintConstrainingUpTo:(ULAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [self constraintForRelation:NSLayoutRelationLessThanOrEqual toAttribute:other offset:offset priority:priority];
}

- (NSLayoutConstraint*)constraintConstrainingDownTo:(ULAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [self constraintForRelation:NSLayoutRelationGreaterThanOrEqual toAttribute:other offset:offset priority:priority];

}

- (NSLayoutConstraint*)constrainTo:(ULAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [[self constraintConstrainingTo:other offset:offset priority:priority] add];
}

- (NSLayoutConstraint*)constrainUpTo:(ULAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [[self constraintConstrainingUpTo:other offset:offset priority:priority] add];
}

- (NSLayoutConstraint*)constrainDownTo:(ULAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority {
    return [[self constraintConstrainingDownTo:other offset:offset priority:priority] add];
}

- (NSLayoutConstraint*)constrainTo:(ULAttribute*)other {
    return [self constrainTo:other offset:0.0 priority:ULLayoutPriorityRequired];
}

- (NSLayoutConstraint*)constrainUpTo:(ULAttribute*)other {
    return [self constrainUpTo:other offset:0.0 priority:ULLayoutPriorityRequired];
}

- (NSLayoutConstraint*)constrainDownTo:(ULAttribute*)other {
    return [self constrainDownTo:other offset:0.0 priority:ULLayoutPriorityRequired];
}

- (ULAttribute *)superviewAttribute {
    return [[ULAttribute alloc] initWithItem:[self.item superview] attribute:self.attribute];
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
