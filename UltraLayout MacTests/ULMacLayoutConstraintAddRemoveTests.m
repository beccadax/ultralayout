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

@end
