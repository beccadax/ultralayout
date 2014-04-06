//
//  UIView+ULLayoutExtensions.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "UIView+ULLayoutExtensions.h"

#import "UltraLayout.h"

@implementation UIView (ULLayoutExtensions)

- (NSArray*)constrainToVerticalOfView:(UIView*)otherView {
    return @[ [self.top constrainTo:otherView.top], [self.bottom constrainTo:otherView.bottom] ];
}

- (NSArray*)constrainToHorizontalOfView:(UIView*)otherView {
    return @[ [self.left constrainTo:otherView.left], [self.right constrainTo:otherView.right] ];
}

- (NSArray*)constrainToView:(UIView*)otherView {
    return [[self constrainToHorizontalOfView:otherView] arrayByAddingObjectsFromArray:
            [self constrainToVerticalOfView:otherView]];
}

@end
