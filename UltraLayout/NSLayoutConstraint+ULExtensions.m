//
//  NSLayoutConstraint+ULExtensions.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "NSLayoutConstraint+ULExtensions.h"

@implementation NSLayoutConstraint (ULExtensions)

- (ULView *)ul_commonAncestorOfItems {
    if(self.firstItem == nil) {
        return self.secondItem;
    }
    if(self.secondItem == nil) {
        return self.firstItem;
    }
    
    ULView * cursor = self.firstItem;
    
    while(![self.secondItem UL_isDescendantOf:cursor]) {
        cursor = cursor.superview;
    }
    
    NSAssert(cursor, @"No common superview found for %@ and %@", self.firstItem, self.secondItem);
    return cursor;
}

- (instancetype)add {
    [[self ul_commonAncestorOfItems] addConstraint:self];
    return self;
}

- (instancetype)remove {
    ULView * cursor = [self ul_commonAncestorOfItems];
    while(cursor) {
        [cursor removeConstraint:self];
        cursor = cursor.superview;
    }
    
    return self;
}


@end
