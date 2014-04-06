//
//  UIView+ULLayoutExtensions.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ULLayoutExtensions)

- (NSArray*)constrainToVerticalOfView:(UIView*)otherView;
- (NSArray*)constrainToHorizontalOfView:(UIView*)otherView;
- (NSArray*)constrainToView:(UIView*)otherView;

@end
