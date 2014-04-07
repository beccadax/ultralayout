//
//  NSView+ULInitExtensions.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "NSView+ULInitExtensions.h"

@implementation NSView (ULInitExtensions)

- (id)initWithSuperview:(NSView *)superview {
    if((self = [self initWithFrame:NSMakeRect(0, 0, 100, 100)])) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [superview addSubview:self];
    }
    return self;
}

@end
