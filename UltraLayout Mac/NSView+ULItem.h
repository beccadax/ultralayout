//
//  NSView+ULItem.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ULItem;

@interface NSView (ULItem)

/// 
/// Accesses an UltraLayout item object for the current view. The ULItem can be used 
/// to add autolayout constraints in various convenient ways.
/// 
@property (readonly, nonatomic) ULItem * ul;

@end
