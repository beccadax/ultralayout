//
//  ULLayoutAttributeSet.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "AppKitOrUIKit.h"

@class ULLayoutDimension;
@class ULLayoutXPosition;
@class ULLayoutYPosition;

/// 
/// ULItem is used to construct ULLayoutAttributes for a particular view.
/// 
/// A view's ULItem is accessed through its ul property. From the item, you can 
/// access ULLayoutAttributes for the view's various NSLayoutAttributes. You can also 
/// use a small suite of methods to constrain it to other items in various common ways, 
/// such as making the views sit next to each other or match some or all of their dimensions.
/// 
@interface ULItem : NSObject

/// 
/// Constructs a new ULItem for the indicated view. You should not generally need to call 
/// this.
/// 
- (id)initWithItem:(id)item;

/// 
/// Stores the actual view the item represents.
/// 
@property (readonly, nonatomic) id item;

/// The left edge of the view.
@property (readonly, nonatomic) ULLayoutXPosition * left;
/// The right edge of the view.
@property (readonly, nonatomic) ULLayoutXPosition * right;
/// The top edge of the view.
@property (readonly, nonatomic) ULLayoutYPosition * top;
/// The bottom edge of the view.
@property (readonly, nonatomic) ULLayoutYPosition * bottom;
/// The leading edge of the view. (This is left in LTR locales and right in RTL locales.)
@property (readonly, nonatomic) ULLayoutXPosition * leading;
/// The trailing edge of the view. (This is right in LTR locales and left in RTL locales.)
@property (readonly, nonatomic) ULLayoutXPosition * trailing;
/// The width of the view.
@property (readonly, nonatomic) ULLayoutDimension * width;
/// The height of the view.
@property (readonly, nonatomic) ULLayoutDimension * height;
/// The horizontal center of the view.
@property (readonly, nonatomic) ULLayoutXPosition * centerX;
/// The vertical center of the view.
@property (readonly, nonatomic) ULLayoutYPosition * centerY;
/// The baseline of text in the view.
@property (readonly, nonatomic) ULLayoutYPosition * baseline;

/// Constrains the current view to match the top and bottom of the other view. Returns the enforcing constraints.
- (NSArray*)constrainToVerticalEdges:(ULItem*)otherView;
/// Constrains the current view to match the left and right of the other view. Returns the enforcing constraints.
- (NSArray*)constrainToHorizontalEdges:(ULItem*)otherView;
/// Constrainst the current view to match all edges with the other view, effectively matching its position and size. Returns the enforcing constraints.
- (NSArray*)constrainToEdges:(ULItem*)otherView;

/// Constrains the current view to make its trailing edge touch the other view's leading edge. Returns the enforcing constraint.
- (NSLayoutConstraint *)constrainToBeside:(ULItem *)item;
/// Constrains the current view to make its trailing edge stay the indicated number of points from the other view's leading edge. Returns the enforcing constraint.
- (NSLayoutConstraint *)constrainToBeside:(ULItem *)item spacing:(CGFloat)spacing;
/// Constrains the current view to make its bottom edge touch the other view's top edge. Returns the enforcing constraint.
- (NSLayoutConstraint *)constrainToAbove:(ULItem *)item;
/// Constrains the current view to make its bottom edge stay the indicated number of points from the other view's top edge. Returns the enforcing constraint.
- (NSLayoutConstraint *)constrainToAbove:(ULItem *)item spacing:(CGFloat)spacing;

@end
