//
//  UIView+ULLayoutAttributes.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ULLayoutItem;

@interface UIView (ULLayoutAttributes)

/// 
/// Accesses an UltraLayout item object for the current view. The ULLayoutItem can be used 
/// to add autolayout constraints in various convenient ways.
/// 
@property (readonly, nonatomic) ULLayoutItem * ul;

@end
