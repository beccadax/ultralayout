//
//  ULLayoutAttributeSet.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "ULLayoutAttributeSet.h"

#import "ULLayoutAttribute.h"

@implementation ULLayoutAttributeSet

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

@end
