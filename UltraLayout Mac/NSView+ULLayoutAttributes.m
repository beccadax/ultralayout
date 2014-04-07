//
//  NSView+ULLayoutAttributes.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "NSView+ULLayoutAttributes.h"

#import "ULLayoutItem.h"

@implementation NSView (ULLayoutAttributes)

- (ULLayoutItem *)ul {
    return [[ULLayoutItem alloc] initWithItem:self];
}

@end
