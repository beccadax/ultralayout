//
//  UIView+ULInitExtensions.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ULInitExtensions)

/// 
/// Initializes the view, sets it to use Cocoa Autolayout, and adds it to the indicated superview.
/// At the end of this call, the view should be ready to have constraints added to it.
/// 
- (id)initWithSuperview:(UIView *)superview;

@end

@interface UIImageView (UIView_ULInitExtensions)

/// 
/// Initializes the view with the indicated image, sets it to use Cocoa Autolayout, and adds 
/// it to the indicated superview.
/// At the end of this call, the view should be ready to have constraints added to it.
/// 
- (id)initWithImage:(UIImage *)image superview:(UIView *)superview;

/// 
/// Initializes the view with the indicated images, sets it to use Cocoa Autolayout, and adds 
/// it to the indicated superview.
/// At the end of this call, the view should be ready to have constraints added to it.
/// 
- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage superview:(UIView *)superview;

@end
