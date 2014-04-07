//
//  ULLayoutAttributeSet.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "ULLayoutItem.h"

#import "ULLayoutAttribute.h"

@implementation ULLayoutItem

- (id)initWithItem:(id)item {
    if((self = [super init])) {
        _item = item;
    }
    return self;
}

- (ULLayoutAttribute *)left {
    return [[ULLayoutAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeLeft];
}

- (ULLayoutAttribute *)right {
    return [[ULLayoutAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeRight];
}

- (ULLayoutAttribute *)top {
    return [[ULLayoutAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeTop];
}

- (ULLayoutAttribute *)bottom {
    return [[ULLayoutAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeBottom];
}

- (ULLayoutAttribute *)leading {
    return [[ULLayoutAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeLeading];
}

- (ULLayoutAttribute *)trailing {
    return [[ULLayoutAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeTrailing];
}

- (ULLayoutAttribute *)width {
    return [[ULLayoutAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeWidth];
}

- (ULLayoutAttribute *)height {
    return [[ULLayoutAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeHeight];
}

- (ULLayoutAttribute *)centerX {
    return [[ULLayoutAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeCenterX];
}

- (ULLayoutAttribute *)centerY {
    return [[ULLayoutAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeCenterY];
}

- (ULLayoutAttribute *)baseline {
    return [[ULLayoutAttribute alloc] initWithItem:self.item attribute:NSLayoutAttributeBaseline];
}

- (NSArray*)constrainToVertical:(ULLayoutItem *)otherView {
    return @[ [self.top constrainTo:otherView.top], [self.bottom constrainTo:otherView.bottom] ];
}

- (NSArray*)constrainToHorizontal:(ULLayoutItem *)otherView {
    return @[ [self.left constrainTo:otherView.left], [self.right constrainTo:otherView.right] ];
}

- (NSArray*)constrainTo:(ULLayoutItem *)otherView {
    return [[self constrainToHorizontal:otherView] arrayByAddingObjectsFromArray:
            [self constrainToVertical:otherView]];
}

@end
