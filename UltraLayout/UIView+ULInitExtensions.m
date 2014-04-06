//
//  UIView+UIView_ULInitExtensions.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "UIView+ULInitExtensions.h"

@implementation UIView (ULInitExtensions)

- (id)initWithSuperview:(UIView *)superview {
    if((self = [self initWithFrame:CGRectMake(0, 0, 100, 100)])) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [superview addSubview:self];
    }
    return self;
}

@end

@implementation UIImageView (ULInitExtensions)

- (id)initWithImage:(UIImage *)image superview:(UIView *)superview {
    if((self = [self initWithImage:image])) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [superview addSubview:self];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage superview:(UIView *)superview {
    if((self = [self initWithImage:image highlightedImage:highlightedImage])) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [superview addSubview:self];
    }
    return self;
}

@end
