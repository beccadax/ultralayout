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

@end

@implementation ULMacAttributeTests

- (void)setUp {
    [super setUp];
    self.view = [[NSView alloc] initWithSuperview:nil];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFixedValue {
    NSLayoutConstraint * constraint = [self.view.ul.width constrainToValue:50];
    XCTAssertEqualObjects(constraint.firstItem, self.view, @"-constrainToValue: constrains to the right item");
    XCTAssertEqual(constraint.firstAttribute, NSLayoutAttributeWidth, @"-constrainToValue: constrains the right attribute");
    XCTAssertNil(constraint.secondItem, @"-constrainToValue: gives no second item");
    XCTAssertEqual(constraint.secondAttribute, NSLayoutAttributeNotAnAttribute, @"-constrainToValue: gives no second attribute");
    
    XCTAssertEqual(constraint.relation, NSLayoutRelationEqual, @"Creates equal constraint");
    XCTAssertEqual(constraint.priority, NSLayoutPriorityRequired, @"Creates required constraint by default");
    
    NSLayoutConstraint * constraint2 = [self.view.ul.width constrainUpToValue:75];
    
    XCTAssertEqual(constraint2.relation, NSLayoutRelationLessThanOrEqual, @"-constrainUpToValue: creates a less-than-or-equal constraint");
    
    NSLayoutConstraint * constraint3 = [self.view.ul.width constrainDownToValue:25];
    
    XCTAssertEqual(constraint3.relation, NSLayoutRelationGreaterThanOrEqual, @"-constrainDownToValue: creates a greater-than-or-equal constraint");
    
    [self.view layoutSubtreeIfNeeded];
    
    XCTAssertEqual(self.view.bounds.size.width, 50, @"Constrains width to intended value");
}

@end
