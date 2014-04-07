//
//  AppKitOrUIKit.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#if TARGET_OS_IPHONE

#import <UIKit/UIKit.h>

#define ULView UIView
#define UL_isDescendantOf isDescendantOfView
#define ULLayoutPriority UILayoutPriority
#define ULLayoutPriorityRequired UILayoutPriorityRequired

#else

#import <AppKit/AppKit.h>

#define ULView NSView
#define UL_isDescendantOf isDescendantOf
#define ULLayoutPriority NSLayoutPriority
#define ULLayoutPriorityRequired NSLayoutPriorityRequired

#endif
