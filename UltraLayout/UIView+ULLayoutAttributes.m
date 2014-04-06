//
//  UIView+ULLayoutAttributes.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "UIView+ULLayoutAttributes.h"

@implementation UIView (ULLayoutAttributes)

- (ULLayoutAttribute *)left {
    return [[ULLayoutAttribute alloc] initWithItem:self attribute:NSLayoutAttributeLeft];
}

- (ULLayoutAttribute *)right {
    return [[ULLayoutAttribute alloc] initWithItem:self attribute:NSLayoutAttributeRight];
}

- (ULLayoutAttribute *)top {
    return [[ULLayoutAttribute alloc] initWithItem:self attribute:NSLayoutAttributeTop];
}

- (ULLayoutAttribute *)bottom {
    return [[ULLayoutAttribute alloc] initWithItem:self attribute:NSLayoutAttributeBottom];
}

- (ULLayoutAttribute *)leading {
    return [[ULLayoutAttribute alloc] initWithItem:self attribute:NSLayoutAttributeLeading];
}

- (ULLayoutAttribute *)trailing {
    return [[ULLayoutAttribute alloc] initWithItem:self attribute:NSLayoutAttributeTrailing];
}

- (ULLayoutAttribute *)width {
    return [[ULLayoutAttribute alloc] initWithItem:self attribute:NSLayoutAttributeWidth];
}

- (ULLayoutAttribute *)height {
    return [[ULLayoutAttribute alloc] initWithItem:self attribute:NSLayoutAttributeHeight];
}

- (ULLayoutAttribute *)centerX {
    return [[ULLayoutAttribute alloc] initWithItem:self attribute:NSLayoutAttributeCenterX];
}

- (ULLayoutAttribute *)centerY {
    return [[ULLayoutAttribute alloc] initWithItem:self attribute:NSLayoutAttributeCenterY];
}

- (ULLayoutAttribute *)baseline {
    return [[ULLayoutAttribute alloc] initWithItem:self attribute:NSLayoutAttributeBaseline];
}

@end
