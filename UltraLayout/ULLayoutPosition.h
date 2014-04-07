//
//  ULLayoutPosition.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import <UltraLayout/UltraLayout.h>

/// 
/// ULXPositionAttribute is a ULAttribute that represents a left-right position, 
/// as opposed to a dimension or top-bottom position. ULXPositionAttribute, and its sibling classes
/// ULYPositionAttribute and ULDimensionAttribute, help ensure you don't construct invalid constraints.
/// 
@interface ULXPositionAttribute : ULAttribute

@end

@interface ULXPositionAttribute (ULTypeChecking)

- (NSLayoutConstraint*)constraintForRelation:(NSLayoutRelation)relation toAttribute:(ULXPositionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constraintConstrainingTo:(ULXPositionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constraintConstrainingUpTo:(ULXPositionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constraintConstrainingDownTo:(ULXPositionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constrainTo:(ULXPositionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constrainUpTo:(ULXPositionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constrainDownTo:(ULXPositionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constrainTo:(ULXPositionAttribute*)other;
- (NSLayoutConstraint*)constrainUpTo:(ULXPositionAttribute*)other;
- (NSLayoutConstraint*)constrainDownTo:(ULXPositionAttribute*)other;

@end

/// 
/// ULYPositionAttribute is a ULAttribute that represents a top-bottom position, 
/// as opposed to a dimension or left-right position. ULYPositionAttribute, and its sibling classes
/// ULXPositionAttribute and ULDimensionAttribute, help ensure you don't construct invalid constraints.
/// 
@interface ULYPositionAttribute : ULAttribute

@end

@interface ULYPositionAttribute (ULTypeChecking)

- (NSLayoutConstraint*)constraintForRelation:(NSLayoutRelation)relation toAttribute:(ULYPositionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constraintConstrainingTo:(ULYPositionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constraintConstrainingUpTo:(ULYPositionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constraintConstrainingDownTo:(ULYPositionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constrainTo:(ULYPositionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constrainUpTo:(ULYPositionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constrainDownTo:(ULYPositionAttribute*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constrainTo:(ULYPositionAttribute*)other;
- (NSLayoutConstraint*)constrainUpTo:(ULYPositionAttribute*)other;
- (NSLayoutConstraint*)constrainDownTo:(ULYPositionAttribute*)other;

@end
