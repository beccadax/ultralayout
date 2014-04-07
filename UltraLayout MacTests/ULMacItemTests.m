//
//  ULMacItemTests.m
//  UltraLayout
//
//  Created by Brent Royal-Gordon on 4/7/14.
//  Copyright (c) 2014 Architechies. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "UltraLayout.h"

@interface ULMacItemTests : XCTestCase

@property NSView * view;

@end

@implementation ULMacItemTests

- (void)setUp
{
    [super setUp];
    self.view = [[NSView alloc] initWithSuperview:nil];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testItemExists {
    ULItem * item = self.view.ul;
    
    XCTAssertNotNil(item, @"NSView.ul constructs an UltraLayout item");
    XCTAssertEqualObjects(item.item, self.view, @"ULItem.item contains the view");
}

#define ULTAssertItemPropertyOK(property, layoutAttribute, expectedClass) \
    XCTAssertNotNil(self.view.ul.property, @"ULItem." #property " not nil"); \
    XCTAssertTrue([self.view.ul.property isKindOfClass:expectedClass.class], @"ULItem." #property " is a " #expectedClass); \
    XCTAssertEqual(self.view.ul.property.attribute, layoutAttribute, @"ULItem." #property ".attribute is " #layoutAttribute) \

- (void)testAttributesAsExpected {
    ULTAssertItemPropertyOK(left, NSLayoutAttributeLeft, ULXPositionAttribute);
    ULTAssertItemPropertyOK(right, NSLayoutAttributeRight, ULXPositionAttribute);
    ULTAssertItemPropertyOK(top, NSLayoutAttributeTop, ULYPositionAttribute);
    ULTAssertItemPropertyOK(bottom, NSLayoutAttributeBottom, ULYPositionAttribute);
    ULTAssertItemPropertyOK(leading, NSLayoutAttributeLeading, ULXPositionAttribute);
    ULTAssertItemPropertyOK(trailing, NSLayoutAttributeTrailing, ULXPositionAttribute);
    ULTAssertItemPropertyOK(width, NSLayoutAttributeWidth, ULDimensionAttribute);
    ULTAssertItemPropertyOK(height, NSLayoutAttributeHeight, ULDimensionAttribute);
    ULTAssertItemPropertyOK(centerX, NSLayoutAttributeCenterX, ULXPositionAttribute);
    ULTAssertItemPropertyOK(centerY, NSLayoutAttributeCenterY, ULYPositionAttribute);
    ULTAssertItemPropertyOK(baseline, NSLayoutAttributeBaseline, ULYPositionAttribute);
}

- (BOOL)constraints:(NSArray*)constraints includeConstraintForItem:(id)firstItem attribute:(NSLayoutAttribute)firstAttribute andItem:(id)secondItem attribute:(NSLayoutAttribute)secondAttribute {
    for(NSLayoutConstraint * constraint in constraints) {
        if(constraint.firstItem == firstItem && constraint.firstAttribute == firstAttribute && constraint.secondItem == secondItem && constraint.secondAttribute == secondAttribute) {
            return YES;
        }
        if(constraint.firstItem == secondItem && constraint.firstAttribute == secondAttribute && constraint.secondItem == firstItem && constraint.secondAttribute == firstAttribute) {
            return YES;
        }
    }
    
    return NO;
}

- (void)testConstrainToVerticalEdges {
    NSView * subview = [[NSView alloc] initWithSuperview:self.view];
    subview.frame = NSMakeRect(25, 25, 50, 50);   // Make sure they don't start the same
    
    NSArray * returnValue = [subview.ul constrainToVerticalEdges:self.view.ul];
    
    XCTAssertTrue([self constraints:returnValue includeConstraintForItem:subview attribute:NSLayoutAttributeTop andItem:self.view attribute:NSLayoutAttributeTop], @"Constrains top of view");
    XCTAssertTrue([self constraints:returnValue includeConstraintForItem:subview attribute:NSLayoutAttributeBottom andItem:self.view attribute:NSLayoutAttributeBottom], @"Constrains bottom of view");
    
    [self.view layoutSubtreeIfNeeded];
    
    XCTAssertEqual(self.view.bounds.origin.y, subview.frame.origin.y, @"Constraints make y-positions equal");
    XCTAssertEqual(self.view.bounds.size.height, subview.frame.size.height, @"Constraints make heights equal");
}

- (void)testConstrainToHorizontalEdges {
    NSView * subview = [[NSView alloc] initWithSuperview:self.view];
    subview.frame = NSMakeRect(25, 25, 50, 50);   // Make sure they don't start the same
    
    NSArray * returnValue = [subview.ul constrainToHorizontalEdges:self.view.ul];
    
    XCTAssertTrue([self constraints:returnValue includeConstraintForItem:subview attribute:NSLayoutAttributeLeft andItem:self.view attribute:NSLayoutAttributeLeft], @"Constrains left of view");
    XCTAssertTrue([self constraints:returnValue includeConstraintForItem:subview attribute:NSLayoutAttributeRight andItem:self.view attribute:NSLayoutAttributeRight], @"Constrains right of view");
    
    [self.view layoutSubtreeIfNeeded];
    
    XCTAssertEqual(self.view.bounds.origin.x, subview.frame.origin.x, @"Constraints make x-positions equal");
    XCTAssertEqual(self.view.bounds.size.width, subview.frame.size.width, @"Constraints make widths equal");
}

- (void)testConstrainToEdges {
    NSView * subview = [[NSView alloc] initWithSuperview:self.view];
    subview.frame = NSMakeRect(25, 25, 50, 50);   // Make sure they don't start the same
    
    NSArray * returnValue = [subview.ul constrainToEdges:self.view.ul];
    
    XCTAssertTrue([self constraints:returnValue includeConstraintForItem:subview attribute:NSLayoutAttributeTop andItem:self.view attribute:NSLayoutAttributeTop], @"Constrains top of view");
    XCTAssertTrue([self constraints:returnValue includeConstraintForItem:subview attribute:NSLayoutAttributeBottom andItem:self.view attribute:NSLayoutAttributeBottom], @"Constrains bottom of view");
    XCTAssertTrue([self constraints:returnValue includeConstraintForItem:subview attribute:NSLayoutAttributeLeft andItem:self.view attribute:NSLayoutAttributeLeft], @"Constrains left of view");
    XCTAssertTrue([self constraints:returnValue includeConstraintForItem:subview attribute:NSLayoutAttributeRight andItem:self.view attribute:NSLayoutAttributeRight], @"Constrains right of view");
    
    [self.view layoutSubtreeIfNeeded];
    
    XCTAssertEqual(self.view.bounds.origin.x, subview.frame.origin.x, @"Constraints make x-positions equal");
    XCTAssertEqual(self.view.bounds.size.width, subview.frame.size.width, @"Constraints make widths equal");
    XCTAssertEqual(self.view.bounds.origin.y, subview.frame.origin.y, @"Constraints make y-positions equal");
    XCTAssertEqual(self.view.bounds.size.height, subview.frame.size.height, @"Constraints make heights equal");
}

- (void)testConstrainToBeside {
    NSView * firstView = [[NSView alloc] initWithSuperview:self.view];
    NSView * lastView = [[NSView alloc] initWithSuperview:self.view];
    
    NSLayoutConstraint * returnValue = [firstView.ul constrainToBeside:lastView.ul];
    
    XCTAssertTrue([self constraints:@[ returnValue ] includeConstraintForItem:firstView attribute:NSLayoutAttributeTrailing andItem:lastView attribute:NSLayoutAttributeLeading], @"Creates expected constraint");
    XCTAssertEqual(fabs(returnValue.constant), 0.0, @"Constraint has no spacing in it");
    
    [firstView.ul.leading constrainToSuperview];
    [lastView.ul.trailing constrainToSuperview];
    
    [self.view layoutSubtreeIfNeeded];
    
    XCTAssertEqual(NSMaxX(firstView.frame), NSMinX(lastView.frame), @"Arranges views side-by-side");
}

- (void)testConstrainToBesideSpacing {
    NSView * firstView = [[NSView alloc] initWithSuperview:self.view];
    NSView * lastView = [[NSView alloc] initWithSuperview:self.view];
    
    NSLayoutConstraint * returnValue = [firstView.ul constrainToBeside:lastView.ul spacing:5];
    
    XCTAssertTrue([self constraints:@[ returnValue ] includeConstraintForItem:firstView attribute:NSLayoutAttributeTrailing andItem:lastView attribute:NSLayoutAttributeLeading], @"Creates expected constraint");
    XCTAssertEqual(fabs(returnValue.constant), 5.0, @"Constraint has spacing in it");
    
    [firstView.ul.leading constrainToSuperview];
    [lastView.ul.trailing constrainToSuperview];
    
    [self.view layoutSubtreeIfNeeded];
    
    XCTAssertEqual(NSMaxX(firstView.frame) + 5, NSMinX(lastView.frame), @"Arranges views side-by-side");
}

- (void)testConstrainToAbove {
    NSView * firstView = [[NSView alloc] initWithSuperview:self.view];
    NSView * lastView = [[NSView alloc] initWithSuperview:self.view];
    
    NSLayoutConstraint * returnValue = [firstView.ul constrainToAbove:lastView.ul];
    
    XCTAssertTrue([self constraints:@[ returnValue ] includeConstraintForItem:firstView attribute:NSLayoutAttributeBottom andItem:lastView attribute:NSLayoutAttributeTop], @"Creates expected constraint");
    XCTAssertEqual(fabs(returnValue.constant), 0.0, @"Constraint has no spacing in it");
    
    [firstView.ul.top constrainToSuperview];
    [lastView.ul.bottom constrainToSuperview];
    
    [self.view layoutSubtreeIfNeeded];
    
    XCTAssertEqual(NSMinY(firstView.frame), NSMaxY(lastView.frame), @"Arranges views side-by-side");
}

- (void)testConstrainToAboveSpacing {
    NSView * firstView = [[NSView alloc] initWithSuperview:self.view];
    NSView * lastView = [[NSView alloc] initWithSuperview:self.view];
    
    NSLayoutConstraint * returnValue = [firstView.ul constrainToAbove:lastView.ul spacing:5];
    
    XCTAssertTrue([self constraints:@[ returnValue ] includeConstraintForItem:firstView attribute:NSLayoutAttributeBottom andItem:lastView attribute:NSLayoutAttributeTop], @"Creates expected constraint");
    XCTAssertEqual(fabs(returnValue.constant), 5.0, @"Constraint has spacing in it");
    
    [firstView.ul.top constrainToSuperview];
    [lastView.ul.bottom constrainToSuperview];
    
    [self.view layoutSubtreeIfNeeded];
    
    XCTAssertEqual(NSMinY(firstView.frame) - 5, NSMaxY(lastView.frame), @"Arranges views side-by-side");
}

@end
