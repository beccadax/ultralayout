//
//  ULMacAttributeTests.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/7/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "UltraLayout.h"

@interface ULMacAttributeTests : XCTestCase

@property NSView * view;
@property NSView * subview;

@end

@implementation ULMacAttributeTests

- (void)setUp {
    [super setUp];
    self.view = [[NSView alloc] initWithSuperview:nil];
    self.subview = [[NSView alloc] initWithSuperview:self.view];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFixedValue {
    NSLayoutConstraint * constraint = [self.view.ul.width constrainToValue:50];
    XCTAssertEqualObjects(constraint.firstItem, self.view, @"-constrainToValue: constrains to the right item");
    XCTAssertEqual((long)constraint.firstAttribute, (long)NSLayoutAttributeWidth, @"-constrainToValue: constrains the right attribute");
    XCTAssertNil(constraint.secondItem, @"-constrainToValue: gives no second item");
    XCTAssertEqual((long)constraint.secondAttribute, (long)NSLayoutAttributeNotAnAttribute, @"-constrainToValue: gives no second attribute");
    
    XCTAssertEqual((long)constraint.relation, (long)NSLayoutRelationEqual, @"Creates equal constraint");
    XCTAssertEqual((long)constraint.priority, (long)NSLayoutPriorityRequired, @"Creates required constraint by default");
    
    NSLayoutConstraint * constraint2 = [self.view.ul.width constrainUpToValue:75];
    
    XCTAssertEqual((long)constraint2.relation, (long)NSLayoutRelationLessThanOrEqual, @"-constrainUpToValue: creates a less-than-or-equal constraint");
    
    NSLayoutConstraint * constraint3 = [self.view.ul.width constrainDownToValue:25];
    
    XCTAssertEqual((long)constraint3.relation, (long)NSLayoutRelationGreaterThanOrEqual, @"-constrainDownToValue: creates a greater-than-or-equal constraint");
    
    [self.view layoutSubtreeIfNeeded];
    
    XCTAssertEqual((double)self.view.bounds.size.width, (double)50, @"Constrains width to intended value");
}

- (void)testConstraintForRelation {
    NSLayoutConstraint * constraint = [self.view.ul.width constraintForRelation:NSLayoutRelationEqual toAttribute:self.subview.ul.height offset:10 priority:NSLayoutPriorityDefaultHigh];
    
    XCTAssertEqualObjects(constraint.firstItem, self.view, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeWidth, @"Constraint's first attribute matches target");
    XCTAssertEqualObjects(constraint.secondItem, self.subview, @"Constraint's second item matches parameter");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeHeight, @"Constraint's second attribute matches parameter");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 10.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityDefaultHigh, @"Constraint has correct priority");
    
    XCTAssertFalse([self.view.constraints containsObject:constraint], @"Does not add constraint");
    
    constraint = [self.subview.ul.height constraintForRelation:NSLayoutRelationGreaterThanOrEqual toAttribute:nil offset:20 priority:NSLayoutPriorityDefaultLow];
    XCTAssertEqualObjects(constraint.firstItem, self.subview, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeHeight, @"Constraint's first attribute matches target");
    XCTAssertNil(constraint.secondItem, @"Constraint's second item is nil");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeNotAnAttribute, @"Constraint's second attribute is NotAnAttribute");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationGreaterThanOrEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 20.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityDefaultLow, @"Constraint has correct priority");
}

- (void)testConstraintConstrainingTo {
    NSLayoutConstraint * constraint = [self.view.ul.width constraintConstrainingTo:self.subview.ul.height offset:10 priority:NSLayoutPriorityDefaultHigh];
    
    XCTAssertEqualObjects(constraint.firstItem, self.view, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeWidth, @"Constraint's first attribute matches target");
    XCTAssertEqualObjects(constraint.secondItem, self.subview, @"Constraint's second item matches parameter");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeHeight, @"Constraint's second attribute matches parameter");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 10.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityDefaultHigh, @"Constraint has correct priority");
    
    XCTAssertFalse([self.view.constraints containsObject:constraint], @"Does not add constraint");
    
    constraint = [self.subview.ul.height constraintConstrainingDownTo:nil offset:20 priority:NSLayoutPriorityDefaultLow];
    XCTAssertEqualObjects(constraint.firstItem, self.subview, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeHeight, @"Constraint's first attribute matches target");
    XCTAssertNil(constraint.secondItem, @"Constraint's second item is nil");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeNotAnAttribute, @"Constraint's second attribute is NotAnAttribute");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationGreaterThanOrEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 20.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityDefaultLow, @"Constraint has correct priority");

    constraint = [self.view.ul.height constraintConstrainingUpTo:self.view.ul.width offset:30 priority:NSLayoutPriorityRequired];
    XCTAssertEqualObjects(constraint.firstItem, self.view, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeHeight, @"Constraint's first attribute matches target");
    XCTAssertEqualObjects(constraint.secondItem, self.view, @"Constraint's second item matches parameter");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeWidth, @"Constraint's second attribute matches parameter");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationLessThanOrEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 30.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityRequired, @"Constraint has correct priority");
}

- (void)testConstrainToParams {
    NSLayoutConstraint * constraint = [self.view.ul.width constrainTo:self.subview.ul.height offset:10 priority:NSLayoutPriorityDefaultHigh];
    
    XCTAssertEqualObjects(constraint.firstItem, self.view, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeWidth, @"Constraint's first attribute matches target");
    XCTAssertEqualObjects(constraint.secondItem, self.subview, @"Constraint's second item matches parameter");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeHeight, @"Constraint's second attribute matches parameter");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 10.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityDefaultHigh, @"Constraint has correct priority");
    
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"Adds constraint");
    
    constraint = [self.subview.ul.height constrainDownTo:nil offset:20 priority:NSLayoutPriorityDefaultLow];
    XCTAssertEqualObjects(constraint.firstItem, self.subview, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeHeight, @"Constraint's first attribute matches target");
    XCTAssertNil(constraint.secondItem, @"Constraint's second item is nil");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeNotAnAttribute, @"Constraint's second attribute is NotAnAttribute");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationGreaterThanOrEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 20.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityDefaultLow, @"Constraint has correct priority");
    
    XCTAssertTrue([self.subview.constraints containsObject:constraint], @"Adds constraint");
    
    constraint = [self.view.ul.height constrainUpTo:self.view.ul.width offset:30 priority:NSLayoutPriorityRequired];
    XCTAssertEqualObjects(constraint.firstItem, self.view, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeHeight, @"Constraint's first attribute matches target");
    XCTAssertEqualObjects(constraint.secondItem, self.view, @"Constraint's second item matches parameter");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeWidth, @"Constraint's second attribute matches parameter");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationLessThanOrEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 30.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityRequired, @"Constraint has correct priority");
    
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"Adds constraint");
}

- (void)testConstrainToNoParams {
    NSLayoutConstraint * constraint = [self.view.ul.width constrainTo:self.subview.ul.height];
    
    XCTAssertEqualObjects(constraint.firstItem, self.view, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeWidth, @"Constraint's first attribute matches target");
    XCTAssertEqualObjects(constraint.secondItem, self.subview, @"Constraint's second item matches parameter");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeHeight, @"Constraint's second attribute matches parameter");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 0.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityRequired, @"Constraint has correct priority");
    
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"Adds constraint");
    
    constraint = [self.subview.ul.height constrainDownTo:nil];
    XCTAssertEqualObjects(constraint.firstItem, self.subview, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeHeight, @"Constraint's first attribute matches target");
    XCTAssertNil(constraint.secondItem, @"Constraint's second item is nil");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeNotAnAttribute, @"Constraint's second attribute is NotAnAttribute");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationGreaterThanOrEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 0.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityRequired, @"Constraint has correct priority");
    
    XCTAssertTrue([self.subview.constraints containsObject:constraint], @"Adds constraint");
    
    constraint = [self.view.ul.height constrainUpTo:self.view.ul.width];
    XCTAssertEqualObjects(constraint.firstItem, self.view, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeHeight, @"Constraint's first attribute matches target");
    XCTAssertEqualObjects(constraint.secondItem, self.view, @"Constraint's second item matches parameter");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeWidth, @"Constraint's second attribute matches parameter");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationLessThanOrEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 0.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityRequired, @"Constraint has correct priority");
    
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"Adds constraint");
}

- (void)testConstrainToSuperviewParams {
    NSLayoutConstraint * constraint = [self.subview.ul.width constrainToSuperviewWithOffset:10 priority:NSLayoutPriorityDefaultHigh];
    
    XCTAssertEqualObjects(constraint.firstItem, self.subview, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeWidth, @"Constraint's first attribute matches target");
    XCTAssertEqualObjects(constraint.secondItem, self.view, @"Constraint's second item is superview");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeWidth, @"Constraint's second attribute matches target");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 10.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityDefaultHigh, @"Constraint has correct priority");
    
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"Adds constraint");
    
    constraint = [self.subview.ul.height constrainDownToSuperviewWithOffset:20 priority:NSLayoutPriorityDefaultLow];
    XCTAssertEqualObjects(constraint.firstItem, self.subview, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeHeight, @"Constraint's first attribute matches target");
    XCTAssertEqualObjects(constraint.secondItem, self.view, @"Constraint's second item matches superview");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeHeight, @"Constraint's second attribute matches target attribute");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationGreaterThanOrEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 20.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityDefaultLow, @"Constraint has correct priority");
    
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"Adds constraint");
    
    constraint = [self.subview.ul.leading constrainUpToSuperviewWithOffset:30 priority:NSLayoutPriorityRequired];
    XCTAssertEqualObjects(constraint.firstItem, self.subview, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeLeading, @"Constraint's first attribute matches target");
    XCTAssertEqualObjects(constraint.secondItem, self.view, @"Constraint's second item matches superview");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeLeading, @"Constraint's second attribute matches target attribute");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationLessThanOrEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 30.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityRequired, @"Constraint has correct priority");
    
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"Adds constraint");
}

- (void)testConstrainToSuperviewNoParams {
    NSLayoutConstraint * constraint = [self.subview.ul.width constrainToSuperview];
    
    XCTAssertEqualObjects(constraint.firstItem, self.subview, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeWidth, @"Constraint's first attribute matches target");
    XCTAssertEqualObjects(constraint.secondItem, self.view, @"Constraint's second item is superview");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeWidth, @"Constraint's second attribute matches target");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 0.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityRequired, @"Constraint has correct priority");
    
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"Adds constraint");
    
    constraint = [self.subview.ul.height constrainDownToSuperview];
    XCTAssertEqualObjects(constraint.firstItem, self.subview, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeHeight, @"Constraint's first attribute matches target");
    XCTAssertEqualObjects(constraint.secondItem, self.view, @"Constraint's second item matches superview");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeHeight, @"Constraint's second attribute matches target attribute");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationGreaterThanOrEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 0.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityRequired, @"Constraint has correct priority");
    
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"Adds constraint");
    
    constraint = [self.subview.ul.leading constrainUpToSuperview];
    XCTAssertEqualObjects(constraint.firstItem, self.subview, @"Constraint's first item matches target");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeLeading, @"Constraint's first attribute matches target");
    XCTAssertEqualObjects(constraint.secondItem, self.view, @"Constraint's second item matches superview");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeLeading, @"Constraint's second attribute matches target attribute");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationLessThanOrEqual, @"Constraint has correct relation");
    XCTAssertEqual(constraint.constant, 0.0, @"Constraint has correct constant");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityRequired, @"Constraint has correct priority");
    
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"Adds constraint");
}

@end
