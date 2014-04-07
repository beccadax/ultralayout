//
//  ULAttribute.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import "AppKitOrUIKit.h"

/// 
/// ULAttribute represents a particular attribute—position or dimension—of a ULItem. 
/// You can use methods on the attribute to construct, and in some cases automatically add, 
/// constraints to that attribute.
/// 
/// Although the methods in ULAttribute are used frequently, they're almost always invoked
/// on one of its subclasses—ULLayoutDimension, ULLayoutXPosition, or ULLayoutYPosition. These 
/// subclasses help ensure you don't create nonsensical constraints, by for instance constraining a 
/// view's left edge to its neighbor's top edge.
/// 
@interface ULAttribute : NSObject

/// Returns an attribute for the given view and NSLayoutAttribute. Instead of using this method, you 
/// should usually construct an attribute by fetching the view's UltraLayout item from its ul property, 
/// then fetching the relevant attribute property, such as top or width.
- (id)initWithItem:(id)item attribute:(NSLayoutAttribute)attr;

/// Stores the view this ULAttribute operates on.
@property (readonly, strong, nonatomic) id item;
/// Stores the NSLayoutAttribute this ULAttribute represents.
@property (readonly, assign, nonatomic) NSLayoutAttribute attribute;

/// Returns a constraint relating this attribute and the other attribute provided in the specified fashion. The constraint is not automatically added.
- (NSLayoutConstraint*)constraintForRelation:(NSLayoutRelation)relation toAttribute:(ULAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

/// Returns a constraint forcing this attribute to match the other attribute with the specified properties. The constraint is not automatically added.
- (NSLayoutConstraint*)constraintConstrainingTo:(ULAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
/// Returns a constraint forcing this attribute to be less than or equal to the other attribute with the specified properties. The constraint is not automatically added.
- (NSLayoutConstraint*)constraintConstrainingUpTo:(ULAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
/// Returns a constraint forcing this attribute to be greater than or equal to the other attribute with the specified properties. The constraint is not automatically added.
- (NSLayoutConstraint*)constraintConstrainingDownTo:(ULAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

/// Constrains this attribute to match the other attribute with the specified properties. The constraint is automatically added.
- (NSLayoutConstraint*)constrainTo:(ULAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
/// Constrains this attribute to be less than or equal to the other attribute with the specified properties. The constraint is automatically added.
- (NSLayoutConstraint*)constrainUpTo:(ULAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
/// Constrains this attribute to be greater than or equal to the other attribute with the specified properties. The constraint is automatically added.
- (NSLayoutConstraint*)constrainDownTo:(ULAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

/// Constrains this attribute to match the other attribute. The constraint is required, and is automatically added.
- (NSLayoutConstraint*)constrainTo:(ULAttribute*)other;
/// Constrains this attribute to be less than or equal to the other attribute. The constraint is required, and is automatically added.
- (NSLayoutConstraint*)constrainUpTo:(ULAttribute*)other;
/// Constrains this attribute to be less than or equal to the other attribute. The constraint is required, and is automatically added.
- (NSLayoutConstraint*)constrainDownTo:(ULAttribute*)other;

/// Returns the matching attribute on the the superview.
@property (readonly, nonatomic) ULAttribute * superviewAttribute;

/// Constrains this attribute to match the equivalent superview attribute with the specified properties. The constraint is automatically added.
- (NSLayoutConstraint *)constrainToSuperviewWithOffset:(CGFloat)offset priority:(ULLayoutPriority)priority;
/// Constrains this attribute to be less than or equal to the equivalent superview attribute with the specified properties. The constraint is automatically added.
- (NSLayoutConstraint *)constrainUpToSuperviewWithOffset:(CGFloat)offset priority:(ULLayoutPriority)priority;
/// Constrains this attribute to be greater than or equal to the equivalent superview attribute with the specified properties. The constraint is automatically added.
- (NSLayoutConstraint *)constrainDownToSuperviewWithOffset:(CGFloat)offset priority:(ULLayoutPriority)priority;

/// Constrains this attribute to match the equivalent superview attribute. The constraint is required, and is automatically added.
- (NSLayoutConstraint *)constrainToSuperview;
/// Constrains this attribute to be less than or equal to the equivalent superview attribute. The constraint is required, and is automatically added.
- (NSLayoutConstraint *)constrainUpToSuperview;
/// Constrains this attribute to be less than or equal to the equivalent superview attribute. The constraint is required, and is automatically added.
- (NSLayoutConstraint *)constrainDownToSuperview;

@end
