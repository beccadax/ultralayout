//
//  UIView+ULLayoutAttributes.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "UIView+ULLayoutAttributes.h"

#import "ULLayoutItem.h"

@implementation UIView (ULLayoutAttributes)

- (ULLayoutItem *)ul {
    return [[ULLayoutItem alloc] initWithItem:self];
}

@end
