//
//  ULLayoutPosition.h
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/6/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import <UltraLayout/UltraLayout.h>

/// 
/// ULLayoutXPosition is a ULAttribute that represents a left-right position, 
/// as opposed to a dimension or top-bottom position. ULLayoutXPosition, and its sibling classes
/// ULLayoutYPosition and ULDimensionAttribute, help ensure you don't construct invalid constraints.
/// 
@interface ULLayoutXPosition : ULAttribute

@end

@interface ULLayoutXPosition (ULTypeChecking)

- (NSLayoutConstraint*)constraintForRelation:(NSLayoutRelation)relation toAttribute:(ULLayoutXPosition*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constraintConstrainingTo:(ULLayoutXPosition*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constraintConstrainingUpTo:(ULLayoutXPosition*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constraintConstrainingDownTo:(ULLayoutXPosition*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constrainTo:(ULLayoutXPosition*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constrainUpTo:(ULLayoutXPosition*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constrainDownTo:(ULLayoutXPosition*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constrainTo:(ULLayoutXPosition*)other;
- (NSLayoutConstraint*)constrainUpTo:(ULLayoutXPosition*)other;
- (NSLayoutConstraint*)constrainDownTo:(ULLayoutXPosition*)other;

@end

/// 
/// ULLayoutYPosition is a ULAttribute that represents a top-bottom position, 
/// as opposed to a dimension or left-right position. ULLayoutYPosition, and its sibling classes
/// ULLayoutXPosition and ULDimensionAttribute, help ensure you don't construct invalid constraints.
/// 
@interface ULLayoutYPosition : ULAttribute

@end

@interface ULLayoutYPosition (ULTypeChecking)

- (NSLayoutConstraint*)constraintForRelation:(NSLayoutRelation)relation toAttribute:(ULLayoutYPosition*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constraintConstrainingTo:(ULLayoutYPosition*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constraintConstrainingUpTo:(ULLayoutYPosition*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constraintConstrainingDownTo:(ULLayoutYPosition*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constrainTo:(ULLayoutYPosition*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constrainUpTo:(ULLayoutYPosition*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;
- (NSLayoutConstraint*)constrainDownTo:(ULLayoutYPosition*)other offset:(CGFloat)offset priority:(ULLayoutPriority)priority;

- (NSLayoutConstraint*)constrainTo:(ULLayoutYPosition*)other;
- (NSLayoutConstraint*)constrainUpTo:(ULLayoutYPosition*)other;
- (NSLayoutConstraint*)constrainDownTo:(ULLayoutYPosition*)other;

@end
