//
//  NSLayoutConstraint+ULExtensions.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif

@interface NSLayoutConstraint (ULExtensions)

- (instancetype)add;
- (instancetype)remove;

@end
