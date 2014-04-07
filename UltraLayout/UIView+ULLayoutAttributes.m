//
//  UIView+ULLayoutAttributes.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "UIView+ULLayoutAttributes.h"

#import "ULLayoutAttributeSet.h"

@implementation UIView (ULLayoutAttributes)

- (ULLayoutAttributeSet *)ul {
    return [[ULLayoutAttributeSet alloc] initWithItem:self];
}

@end
