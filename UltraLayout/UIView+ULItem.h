//
//  UIView+ULItem.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ULItem;

@interface UIView (ULItem)

/// 
/// Accesses an UltraLayout item object for the current view. The ULItem can be used 
/// to add autolayout constraints in various convenient ways.
/// 
@property (readonly, nonatomic) ULItem * ul;

@end
