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

#define ULTAssertConstraintProperties(CONSTRAINT, FIRST_ITEM, FIRST_ATTR, SECOND_ITEM, SECOND_ATTR, RELATION, CONSTANT, PRIORITY, description) do { \
    XCTAssertEqualObjects(CONSTRAINT.firstItem, FIRST_ITEM, @"%@ has right first item", description); \
    XCTAssertEqual(CONSTRAINT.firstAttribute, (NSLayoutAttribute)FIRST_ATTR, @"%@ has right first attribute", description); \
    XCTAssertEqualObjects(CONSTRAINT.secondItem, SECOND_ITEM, @"%@ has right second item", description); \
    XCTAssertEqual(CONSTRAINT.secondAttribute, (NSLayoutAttribute)SECOND_ATTR, @"%@ has right second attribute", description); \
    XCTAssertEqual(CONSTRAINT.relation, (NSLayoutRelation)RELATION, @"%@ has right relation", description); \
    XCTAssertEqual(CONSTRAINT.constant, (CGFloat)CONSTANT, @"%@ has right constant", description); \
    XCTAssertEqual(CONSTRAINT.priority, (NSLayoutPriority)PRIORITY, @"%@ has right priority", description); } while(0)

- (void)testFixedValue {
    NSLayoutConstraint * constraint = [self.view.ul.width constrainToValue:50];
    ULTAssertConstraintProperties(constraint, self.view, NSLayoutAttributeWidth, nil, NSLayoutAttributeNotAnAttribute, NSLayoutRelationEqual, 50, NSLayoutPriorityRequired, @"-constrainToValue:50");
    
    NSLayoutConstraint * constraint2 = [self.view.ul.width constrainUpToValue:75];
    ULTAssertConstraintProperties(constraint2, self.view, NSLayoutAttributeWidth, nil, NSLayoutAttributeNotAnAttribute, NSLayoutRelationLessThanOrEqual, 75, NSLayoutPriorityRequired, @"-constrainUpToValue:75");
    
    NSLayoutConstraint * constraint3 = [self.view.ul.width constrainDownToValue:25];
    ULTAssertConstraintProperties(constraint3, self.view, NSLayoutAttributeWidth, nil, NSLayoutAttributeNotAnAttribute, NSLayoutRelationGreaterThanOrEqual, 25, NSLayoutPriorityRequired, @"-constrainDownToValue:25");
        
    [self.view layoutSubtreeIfNeeded];
    
    XCTAssertEqual((CGFloat)self.view.bounds.size.width, (CGFloat)50, @"Constrains width to intended value");
}

- (void)testConstraintForRelation {
    NSLayoutConstraint * constraint = [self.view.ul.width constraintForRelation:NSLayoutRelationEqual toAttribute:self.subview.ul.height offset:10 priority:NSLayoutPriorityDefaultHigh];
    ULTAssertConstraintProperties(constraint, self.view, NSLayoutAttributeWidth, self.subview, NSLayoutAttributeHeight, NSLayoutRelationEqual, 10.0, NSLayoutPriorityDefaultHigh, @"-constraintForRelation:... with second attribute");
    
    XCTAssertFalse([self.view.constraints containsObject:constraint], @"-constraintForRelation:... does not add constraint");
    
    constraint = [self.subview.ul.height constraintForRelation:NSLayoutRelationGreaterThanOrEqual toAttribute:nil offset:20 priority:NSLayoutPriorityDefaultLow];
    ULTAssertConstraintProperties(constraint, self.subview, NSLayoutAttributeHeight, nil, NSLayoutAttributeNotAnAttribute, NSLayoutRelationGreaterThanOrEqual, 20.0, NSLayoutPriorityDefaultLow, @"-constraintForRelation:... without second attribute");
}

- (void)testConstraintConstrainingTo {
    NSLayoutConstraint * constraint = [self.view.ul.width constraintConstrainingTo:self.subview.ul.height offset:10 priority:NSLayoutPriorityDefaultHigh];
    ULTAssertConstraintProperties(constraint, self.view, NSLayoutAttributeWidth, self.subview, NSLayoutAttributeHeight, NSLayoutRelationEqual, 10.0, NSLayoutPriorityDefaultHigh, @"-constraintConstrainingTo:...");
        
    XCTAssertFalse([self.view.constraints containsObject:constraint], @"-constraintConstrainingTo:... does not add constraint");
    
    constraint = [self.subview.ul.height constraintConstrainingDownTo:nil offset:20 priority:NSLayoutPriorityDefaultLow];
    ULTAssertConstraintProperties(constraint, self.subview, NSLayoutAttributeHeight, nil, NSLayoutAttributeNotAnAttribute, NSLayoutRelationGreaterThanOrEqual, 20.0, NSLayoutPriorityDefaultLow, @"-constraintConstrainingDownTo:...");
    
    constraint = [self.view.ul.height constraintConstrainingUpTo:self.view.ul.width offset:30 priority:NSLayoutPriorityRequired];
    ULTAssertConstraintProperties(constraint, self.view, NSLayoutAttributeHeight, self.view, NSLayoutAttributeWidth, NSLayoutRelationLessThanOrEqual, 30.0, NSLayoutPriorityRequired, @"-constraintConstrainingUpTo:...");
}

- (void)testConstrainToParams {
    NSLayoutConstraint * constraint = [self.view.ul.width constrainTo:self.subview.ul.height offset:10 priority:NSLayoutPriorityDefaultHigh];
    ULTAssertConstraintProperties(constraint, self.view, NSLayoutAttributeWidth, self.subview, NSLayoutAttributeHeight, NSLayoutRelationEqual, 10.0, NSLayoutPriorityDefaultHigh, @"-constrainTo:...");
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"-constrainTo:... adds constraint");
    
    constraint = [self.subview.ul.height constrainDownTo:nil offset:20 priority:NSLayoutPriorityDefaultLow];
    ULTAssertConstraintProperties(constraint, self.subview, NSLayoutAttributeHeight, nil, NSLayoutAttributeNotAnAttribute, NSLayoutRelationGreaterThanOrEqual, 20.0, NSLayoutPriorityDefaultLow, @"-constrainDownTo:...");
    XCTAssertTrue([self.subview.constraints containsObject:constraint], @"-constrainDownTo:... adds constraint");
    
    constraint = [self.view.ul.height constrainUpTo:self.view.ul.width offset:30 priority:NSLayoutPriorityRequired];
    ULTAssertConstraintProperties(constraint, self.view, NSLayoutAttributeHeight, self.view, NSLayoutAttributeWidth, NSLayoutRelationLessThanOrEqual, 30.0, NSLayoutPriorityRequired, @"-constrainUpTo:...");
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"-constrainUpTo:... adds constraint");
}

- (void)testConstrainToNoParams {
    NSLayoutConstraint * constraint = [self.view.ul.width constrainTo:self.subview.ul.height];
    ULTAssertConstraintProperties(constraint, self.view, NSLayoutAttributeWidth, self.subview, NSLayoutAttributeHeight, NSLayoutRelationEqual, 0.0, NSLayoutPriorityRequired, @"-constrainTo:");
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"-constrainTo: adds constraint");
    
    constraint = [self.subview.ul.height constrainDownTo:nil];
    ULTAssertConstraintProperties(constraint, self.subview, NSLayoutAttributeHeight, nil, NSLayoutAttributeNotAnAttribute, NSLayoutRelationGreaterThanOrEqual, 0.0, NSLayoutPriorityRequired, @"-constrainDownTo:");
    XCTAssertTrue([self.subview.constraints containsObject:constraint], @"-constrainDownTo: adds constraint");
    
    constraint = [self.view.ul.height constrainUpTo:self.view.ul.width];
    ULTAssertConstraintProperties(constraint, self.view, NSLayoutAttributeHeight, self.view, NSLayoutAttributeWidth, NSLayoutRelationLessThanOrEqual, 0.0, NSLayoutPriorityRequired, @"-constrainUpTo:");
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"-constrainUpTo: adds constraint");
}

- (void)testConstrainToSuperviewParams {
    NSLayoutConstraint * constraint = [self.subview.ul.width constrainToSuperviewWithOffset:10 priority:NSLayoutPriorityDefaultHigh];
    ULTAssertConstraintProperties(constraint, self.subview, NSLayoutAttributeWidth, self.view, NSLayoutAttributeWidth, NSLayoutRelationEqual, 10.0, NSLayoutPriorityDefaultHigh, @"-constrainToSuperviewWith...");
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"-constrainToSuperviewWith... adds constraint");
    
    constraint = [self.subview.ul.height constrainDownToSuperviewWithOffset:20 priority:NSLayoutPriorityDefaultLow];
    ULTAssertConstraintProperties(constraint, self.subview, NSLayoutAttributeHeight, self.view, NSLayoutAttributeHeight, NSLayoutRelationGreaterThanOrEqual, 20.0, NSLayoutPriorityDefaultLow, @"-constrainDownToSuperviewWith...");
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"-constrainDownToSuperviewWith... adds constraint");
    
    constraint = [self.subview.ul.leading constrainUpToSuperviewWithOffset:30 priority:NSLayoutPriorityRequired];
    ULTAssertConstraintProperties(constraint, self.subview, NSLayoutAttributeLeading, self.view, NSLayoutAttributeLeading, NSLayoutRelationLessThanOrEqual, 30.0, NSLayoutPriorityRequired, @"-constrainUpToSuperviewWith...");
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"-constrainUpToSuperviewWith... adds constraint");
}

- (void)testConstrainToSuperviewNoParams {
    NSLayoutConstraint * constraint = [self.subview.ul.width constrainToSuperview];
    ULTAssertConstraintProperties(constraint, self.subview, NSLayoutAttributeWidth, self.view, NSLayoutAttributeWidth, NSLayoutRelationEqual, 0.0, NSLayoutPriorityRequired, @"-constrainToSuperview");
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"-constrainToSuperview adds constraint");
    
    constraint = [self.subview.ul.height constrainDownToSuperview];
    ULTAssertConstraintProperties(constraint, self.subview, NSLayoutAttributeHeight, self.view, NSLayoutAttributeHeight, NSLayoutRelationGreaterThanOrEqual, 0.0, NSLayoutPriorityRequired, @"-constrainDownToSuperview");
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"-constrainDownToSuperview adds constraint");
    
    constraint = [self.subview.ul.leading constrainUpToSuperview];
    ULTAssertConstraintProperties(constraint, self.subview, NSLayoutAttributeLeading, self.view, NSLayoutAttributeLeading, NSLayoutRelationLessThanOrEqual, 0.0, NSLayoutPriorityRequired, @"-constrainUpToSuperview");
    XCTAssertTrue([self.view.constraints containsObject:constraint], @"-constrainUpToSuperview adds constraint");
}

@end
