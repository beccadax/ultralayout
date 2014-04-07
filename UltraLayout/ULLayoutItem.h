//
//  ULLayoutAttributeSet.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "AppKitOrUIKit.h"

@class ULLayoutAttribute;

/// 
/// ULLayoutItem is used to construct ULLayoutAttributes for a particular view.
/// 
/// A view's ULLayoutItem is accessed through its ul property. From the item, you can 
/// access ULLayoutAttributes for the view's various NSLayoutAttributes. You can also 
/// use a small suite of methods to constrain it to other items in various common ways, 
/// such as making the views sit next to each other or match some or all of their dimensions.
/// 
@interface ULLayoutItem : NSObject

/// 
/// Constructs a new ULLayoutItem for the indicated view. You should not generally need to call 
/// this.
/// 
- (id)initWithItem:(id)item;

/// 
/// Stores the actual view the item represents.
/// 
@property (readonly, nonatomic) id item;

/// The left edge of the view.
@property (readonly, nonatomic) ULLayoutAttribute * left;
/// The right edge of the view.
@property (readonly, nonatomic) ULLayoutAttribute * right;
/// The top edge of the view.
@property (readonly, nonatomic) ULLayoutAttribute * top;
/// The bottom edge of the view.
@property (readonly, nonatomic) ULLayoutAttribute * bottom;
/// The leading edge of the view. (This is left in LTR locales and right in RTL locales.)
@property (readonly, nonatomic) ULLayoutAttribute * leading;
/// The trailing edge of the view. (This is right in LTR locales and left in RTL locales.)
@property (readonly, nonatomic) ULLayoutAttribute * trailing;
/// The width of the view.
@property (readonly, nonatomic) ULLayoutAttribute * width;
/// The height of the view.
@property (readonly, nonatomic) ULLayoutAttribute * height;
/// The horizontal center of the view.
@property (readonly, nonatomic) ULLayoutAttribute * centerX;
/// The vertical center of the view.
@property (readonly, nonatomic) ULLayoutAttribute * centerY;
/// The baseline of text in the view.
@property (readonly, nonatomic) ULLayoutAttribute * baseline;

/// Constrains the current view to match the top and bottom of the other view. Returns the enforcing constraints.
- (NSArray*)constrainToVerticalEdges:(ULLayoutItem*)otherView;
/// Constrains the current view to match the left and right of the other view. Returns the enforcing constraints.
- (NSArray*)constrainToHorizontalEdges:(ULLayoutItem*)otherView;
/// Constrainst the current view to match all edges with the other view, effectively matching its position and size. Returns the enforcing constraints.
- (NSArray*)constrainToEdges:(ULLayoutItem*)otherView;

/// Constrains the current view to make its trailing edge touch the other view's leading edge. Returns the enforcing constraint.
- (NSLayoutConstraint *)constrainToBeside:(ULLayoutItem *)item;
/// Constrains the current view to make its trailing edge stay the indicated number of points from the other view's leading edge. Returns the enforcing constraint.
- (NSLayoutConstraint *)constrainToBeside:(ULLayoutItem *)item spacing:(CGFloat)spacing;
/// Constrains the current view to make its bottom edge touch the other view's top edge. Returns the enforcing constraint.
- (NSLayoutConstraint *)constrainToAbove:(ULLayoutItem *)item;
/// Constrains the current view to make its bottom edge stay the indicated number of points from the other view's top edge. Returns the enforcing constraint.
- (NSLayoutConstraint *)constrainToAbove:(ULLayoutItem *)item spacing:(CGFloat)spacing;

@end
