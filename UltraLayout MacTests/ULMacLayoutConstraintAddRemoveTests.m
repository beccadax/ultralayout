//
//  ULMacLayoutConstraintAddRemoveTests.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/7/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSView+ULInitExtensions.h"
#import "NSLayoutConstraint+ULExtensions.h"

@interface ULMacLayoutConstraintAddRemoveTests : XCTestCase

@end

@implementation ULMacLayoutConstraintAddRemoveTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddOne
{
    NSView * aView = [[NSView alloc] initWithSuperview:nil];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:aView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
    
    id returnValue = [constraint add];
    
    XCTAssertEqualObjects(constraint, returnValue, @"-add returns the constraint added");
    XCTAssertTrue([aView.constraints containsObject:constraint], @"Single-item constraint was added to view");
}

- (void)testAddOneDirectSuperview {
    NSView * superview = [[NSView alloc] initWithSuperview:nil];
    NSView * firstView = [[NSView alloc] initWithSuperview:superview];
    NSView * lastView = [[NSView alloc] initWithSuperview:superview];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:firstView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:lastView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    id returnValue = [constraint add];
    
    XCTAssertEqualObjects(constraint, returnValue, @"-add returns the constraint added");
    XCTAssertTrue([superview.constraints containsObject:constraint], @"Constraint with two sibling views is added to superview");
}

- (void)testAddSubviewSuperview {
    NSView * superview = [[NSView alloc] initWithSuperview:nil];
    NSView * subview = [[NSView alloc] initWithSuperview:superview];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    id returnValue = [constraint add];
    
    XCTAssertEqualObjects(constraint, returnValue, @"-add returns the constraint added");
    XCTAssertTrue([superview.constraints containsObject:constraint], @"Constraint between subview and superview is added to superview");
}

- (void)testAddSuperviewSubview {
    NSView * superview = [[NSView alloc] initWithSuperview:nil];
    NSView * subview = [[NSView alloc] initWithSuperview:superview];
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:subview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    id returnValue = [constraint add];
    
    XCTAssertEqualObjects(constraint, returnValue, @"-add returns the constraint added");
    XCTAssertTrue([superview.constraints containsObject:constraint], @"Constraint between superview and subview is added to superview");
}

- (void)testAddMultilevel {
    NSView * topview = [[NSView alloc] initWithSuperview:nil];
    NSView * sibview = [[NSView alloc] initWithSuperview:topview];
    NSView * superview = [[NSView alloc] initWithSuperview:topview];
    NSView * subview = [[NSView alloc] initWithSuperview:superview];
    
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:sibview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:subview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    id returnValue = [constraint add];
    
    XCTAssertEqualObjects(constraint, returnValue, @"-add returns the constraint added");
    XCTAssertTrue([topview.constraints containsObject:constraint], @"Constraint is added to nearest common ancestor, even with complex hierarchies");
}

- (void)testAddMultilevel2 {
    NSView * topview = [[NSView alloc] initWithSuperview:nil];
    NSView * sibview = [[NSView alloc] initWithSuperview:topview];
    NSView * superview = [[NSView alloc] initWithSuperview:topview];
    NSView * subview = [[NSView alloc] initWithSuperview:superview];
    
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:sibview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    id returnValue = [constraint add];
    
    XCTAssertEqualObjects(constraint, returnValue, @"-add returns the constraint added");
    XCTAssertTrue([topview.constraints containsObject:constraint], @"Constraint is added to nearest common ancestor, even with complex hierarchies (2)");
}

- (void)testAddRedundant {
    NSView * topview = [[NSView alloc] initWithSuperview:nil];
    NSView * superview = [[NSView alloc] initWithSuperview:topview];
    NSView * subview = [[NSView alloc] initWithSuperview:superview];
    
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:subview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    id returnValue = [constraint add];
    
    XCTAssertEqualObjects(constraint, returnValue, @"-add returns the constraint added");
    XCTAssertTrue([superview.constraints containsObject:constraint], @"Constraint is added to nearest common ancestor, not higher ancestors");
}

- (void)testRemove {
    NSView * superview = [[NSView alloc] initWithSuperview:nil];
    NSView * subview = [[NSView alloc] initWithSuperview:superview];
    
    NSLayoutConstraint * constraint = [[NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:subview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0] add];
    
    XCTAssertTrue([superview.constraints containsObject:constraint], @"Sanity check: adding worked");
    
    id returnValue = [constraint remove];
    XCTAssertEqualObjects(constraint, returnValue, @"-remove returns the constraint removed");
    XCTAssertFalse([superview.constraints containsObject:constraint], @"-remove removes constraint");
}

@end
