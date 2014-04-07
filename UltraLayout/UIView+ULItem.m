//
//  UIView+ULItem.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "UIView+ULItem.h"

#import "ULItem.h"

@implementation UIView (ULItem)

- (ULItem *)ul {
    return [[ULItem alloc] initWithItem:self];
}

@end
