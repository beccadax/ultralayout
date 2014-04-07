//
//  ULMacInitExtensionTests.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/7/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSView+ULInitExtensions.h"

@interface ULMacInitExtensionTests : XCTestCase

@end

@implementation ULMacInitExtensionTests

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

- (void)testInitWithSuperviewNil {
    NSView * aView = [[NSView alloc] initWithSuperview:nil];
    
    XCTAssertNil(aView.superview, @"-initWithSuperview:nil returns a nil-superviewed view");
    XCTAssertFalse(aView.translatesAutoresizingMaskIntoConstraints, @"Views from -initWithSuperview: don't use autoresizing");
}

- (void)testInitWithSuperviewNotNil {
    NSView * superview = [[NSView alloc] initWithSuperview:nil];
    NSView * subview = [[NSView alloc] initWithSuperview:superview];
    
    XCTAssertEqualObjects(subview.superview, superview, @"-initWithSuperview:nil returns a nil-superviewed view");
    XCTAssertFalse(subview.translatesAutoresizingMaskIntoConstraints, @"Views from -initWithSuperview: don't use autoresizing");
}

@end
