//
//  ULItem.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "ULItem.h"

#import "ULDimensionAttribute.h"
#import "ULLayoutPosition.h"

@implementation ULItem

- (id)initWithItem:(id)item {
    if((self = [super init])) {
        _item = item;
    }
    return self;
}

- (ULXPositionAttribute *)left {
    return [[ULXPositionAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeLeft];
}

- (ULXPositionAttribute *)right {
    return [[ULXPositionAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeRight];
}

- (ULYPositionAttribute *)top {
    return [[ULYPositionAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeTop];
}

- (ULYPositionAttribute *)bottom {
    return [[ULYPositionAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeBottom];
}

- (ULXPositionAttribute *)leading {
    return [[ULXPositionAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeLeading];
}

- (ULXPositionAttribute *)trailing {
    return [[ULXPositionAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeTrailing];
}

- (ULDimensionAttribute *)width {
    return [[ULDimensionAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeWidth];
}

- (ULDimensionAttribute *)height {
    return [[ULDimensionAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeHeight];
}

- (ULXPositionAttribute *)centerX {
    return [[ULXPositionAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeCenterX];
}

- (ULYPositionAttribute *)centerY {
    return [[ULYPositionAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeCenterY];
}

- (ULYPositionAttribute *)baseline {
    return [[ULYPositionAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeBaseline];
}

- (NSArray*)constrainToVerticalEdges:(ULItem *)otherView {
    return @[ [self.top constrainTo:otherView.top], [self.bottom constrainTo:otherView.bottom] ];
}

- (NSArray*)constrainToHorizontalEdges:(ULItem *)otherView {
    return @[ [self.left constrainTo:otherView.left], [self.right constrainTo:otherView.right] ];
}

- (NSArray*)constrainToEdges:(ULItem *)otherView {
    return [[self constrainToHorizontalEdges:otherView] arrayByAddingObjectsFromArray:
            [self constrainToVerticalEdges:otherView]];
}

- (NSLayoutConstraint *)constrainToBeside:(ULItem *)item {
    return [self constrainToBeside:item spacing:0];
}

- (NSLayoutConstraint *)constrainToBeside:(ULItem *)item spacing:(CGFloat)spacing {
    return [item.leading constrainTo:self.trailing offset:spacing priority:ULLayoutPriorityRequired];
}

- (NSLayoutConstraint *)constrainToAbove:(ULItem *)item {
    return [self constrainToAbove:item spacing:0];
}

- (NSLayoutConstraint *)constrainToAbove:(ULItem *)item spacing:(CGFloat)spacing {
    return [item.top constrainTo:self.bottom offset:spacing priority:ULLayoutPriorityRequired];
}

@end
