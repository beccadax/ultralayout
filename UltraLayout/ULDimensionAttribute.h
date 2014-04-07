//
//  ULDimensionAttribute.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import <UltraLayout/UltraLayout.h>

/// 
/// ULDimensionAttribute is a ULAttribute that represents a size (like width or height), 
/// as opposed to a position. ULDimensionAttribute, and its sibling classes
/// ULXPositionAttribute and ULYPositionAttribute, help ensure you don't construct invalid constraints.
/// 
@interface ULDimensionAttribute : ULAttribute

/// Constrains this attribute to always match the given value. The constraint is required, and is automatically added.
- (NSLayoutConstraint*)constrainToValue:(CGFloat)value;
/// Constrains this attribute to be less than or equal to the given value. The constraint is required, and is automatically added.
- (NSLayoutConstraint*)constrainUpToValue:(CGFloat)value;
/// Constrains this attribute to be greater than or equal to the given value. The constraint is required, and is automatically added.
- (NSLayoutConstraint*)constrainDownToValue:(CGFloat)value;

@end

@interface ULDimensionAttribute (ULTypeChecking)

- (NSLayoutConstraint*)constraintForRelation:(NSLayoutRelation)relation toAttribute:(ULDimensionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constraintConstrainingTo:(ULDimensionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constraintConstrainingUpTo:(ULDimensionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constraintConstrainingDownTo:(ULDimensionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constrainTo:(ULDimensionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constrainUpTo:(ULDimensionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constrainDownTo:(ULDimensionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constrainTo:(ULDimensionAttribute*)other;
- (NSLayoutConstraint*)constrainUpTo:(ULDimensionAttribute*)other;
- (NSLayoutConstraint*)constrainDownTo:(ULDimensionAttribute*)other;


@end
