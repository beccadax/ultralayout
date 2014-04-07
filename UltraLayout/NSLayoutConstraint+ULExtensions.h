//
//  NSLayoutConstraint+ULExtensions.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "AppKitOrUIKit.h"

@interface NSLayoutConstraint (ULExtensions)

/// 
/// Adds the constraint to the first common ancestor of its items.
/// 
- (instancetype)add;

/// 
/// Removes the constraint from the common ancestors of its items.
/// 
- (instancetype)remove;

@end
