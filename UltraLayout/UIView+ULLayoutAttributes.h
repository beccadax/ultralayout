//
//  UIView+ULLayoutAttributes.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ULLayoutAttribute;

@interface UIView (ULLayoutAttributes)

@property (readonly, nonatomic) ULLayoutAttribute * left;
@property (readonly, nonatomic) ULLayoutAttribute * right;
@property (readonly, nonatomic) ULLayoutAttribute * top;
@property (readonly, nonatomic) ULLayoutAttribute * bottom;
@property (readonly, nonatomic) ULLayoutAttribute * leading;
@property (readonly, nonatomic) ULLayoutAttribute * trailing;
@property (readonly, nonatomic) ULLayoutAttribute * width;
@property (readonly, nonatomic) ULLayoutAttribute * height;
@property (readonly, nonatomic) ULLayoutAttribute * centerX;
@property (readonly, nonatomic) ULLayoutAttribute * centerY;
@property (readonly, nonatomic) ULLayoutAttribute * baseline;

@end
