//
//  ULLayoutAttributeSet.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "ULItem.h"

#import "ULLayoutDimension.h"
#import "ULLayoutPosition.h"

@implementation ULItem

- (id)initWithItem:(id)item {
    if((self = [super init])) {
        _item = item;
    }
    return self;
}

- (ULLayoutXPosition *)left {
    return [[ULLayoutXPosition alloc] initWithItem:self.item attribute:NSLayoutAttributeLeft];
}

- (ULLayoutXPosition *)right {
    return [[ULLayoutXPosition alloc] initWithItem:self.item attribute:NSLayoutAttributeRight];
}

- (ULLayoutYPosition *)top {
    return [[ULLayoutYPosition alloc] initWithItem:self.item attribute:NSLayoutAttributeTop];
}

- (ULLayoutYPosition *)bottom {
    return [[ULLayoutYPosition alloc] initWithItem:self.item attribute:NSLayoutAttributeBottom];
}

- (ULLayoutXPosition *)leading {
    return [[ULLayoutXPosition alloc] initWithItem:self.item attribute:NSLayoutAttributeLeading];
}

- (ULLayoutXPosition *)trailing {
    return [[ULLayoutXPosition alloc] initWithItem:self.item attribute:NSLayoutAttributeTrailing];
}

- (ULLayoutDimension *)width {
    return [[ULLayoutDimension alloc] initWithItem:self.item attribute:NSLayoutAttributeWidth];
}

- (ULLayoutDimension *)height {
    return [[ULLayoutDimension alloc] initWithItem:self.item attribute:NSLayoutAttributeHeight];
}

- (ULLayoutXPosition *)centerX {
    return [[ULLayoutXPosition alloc] initWithItem:self.item attribute:NSLayoutAttributeCenterX];
}

- (ULLayoutYPosition *)centerY {
    return [[ULLayoutYPosition alloc] initWithItem:self.item attribute:NSLayoutAttributeCenterY];
}

- (ULLayoutYPosition *)baseline {
    return [[ULLayoutYPosition alloc] initWithItem:self.item attribute:NSLayoutAttributeBaseline];
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
    return [self.trailing constrainTo:item.leading offset:spacing priority:ULLayoutPriorityRequired];
}

- (NSLayoutConstraint *)constrainToAbove:(ULItem *)item {
    return [self constrainToAbove:item spacing:0];
}

- (NSLayoutConstraint *)constrainToAbove:(ULItem *)item spacing:(CGFloat)spacing {
    return [self.bottom constrainTo:item.top offset:spacing priority:ULLayoutPriorityRequired];
}

@end
