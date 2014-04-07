//
//  NSView+ULInitExtensions.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSView (ULInitExtensions)

/// 
/// Initializes the view, sets it to use Cocoa Autolayout, and adds it to the indicated superview.
/// At the end of this call, the view should be ready to have constraints added to it.
/// 
- (id)initWithSuperview:(NSView *)superview;

@end
