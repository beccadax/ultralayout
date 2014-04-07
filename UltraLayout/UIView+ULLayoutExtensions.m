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
    return @[ [self.ul.top constrainTo:otherView.ul.top], [self.ul.bottom constrainTo:otherView.ul.bottom] ];
}

- (NSArray*)constrainToHorizontalOfView:(UIView*)otherView {
    return @[ [self.ul.left constrainTo:otherView.ul.left], [self.ul.right constrainTo:otherView.ul.right] ];
}

- (NSArray*)constrainToView:(UIView*)otherView {
    return [[self constrainToHorizontalOfView:otherView] arrayByAddingObjectsFromArray:
            [self constrainToVerticalOfView:otherView]];
}

@end
