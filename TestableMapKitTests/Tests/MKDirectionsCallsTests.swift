//
//  MKDirectionsCallsTests.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit
import XCTest

class MKDirectionsCallsTests: XCTestCase {

    let directions = MKDirections(request: MKDirectionsRequest())
    var directionsHandler: MKDirectionsHandler!
    var estimateHandler: MKETAHandler!
    var handlerCalled = false

    override func setUp() {
        super.setUp()

        directionsHandler = { _ in
            self.handlerCalled = true
        }

        estimateHandler = { _ in
            self.handlerCalled = true
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShimMethodForwarding() {
        XCTAssertFalse(directions.shouldForwardByDefault, "This shim should not forward methods by default")
        XCTAssertFalse(directions.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded by default")
        directions.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(directions.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded")
        directions.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(directions.shouldForwardMethodCallWithSelector("someSelector"), "The method should no longer be forwarded")
    }

    func testCalculateDirectionsCall() {
        XCTAssertFalse(directions.calculateDirectionsCalled, "The directions should not indicate having had calculateDirections called by default")
        XCTAssertTrue(directions.calculateDirectionsCompletionHandler == nil, "The completion handler should be missing by default")
        directions.calculateDirectionsWithCompletionHandler(directionsHandler)
        XCTAssertTrue(directions.calculateDirectionsCalled, "The directions should now indicate having had calculateDirections called")
        XCTAssertTrue(directions.calculateDirectionsCompletionHandler != nil, "The completion handler should be captured")
        XCTAssertFalse(handlerCalled, "The handler should not have been called")
        directions.calculateDirectionsCompletionHandler!(nil, nil)
        XCTAssertTrue(handlerCalled, "The handler should be captured")
    }

    func testCalculateETACall() {
        XCTAssertFalse(directions.calculateETACalled, "The directions should not indicate having had calculateETA called by default")
        XCTAssertTrue(directions.calculateETACompletionHandler == nil, "The completion handler should be missing by default")
        directions.calculateETAWithCompletionHandler(estimateHandler)
        XCTAssertTrue(directions.calculateETACalled, "The directions should now indicate having had calculateETA called")
        XCTAssertTrue(directions.calculateETACompletionHandler != nil, "The completion handler should be captured")
        XCTAssertFalse(handlerCalled, "The handler should not have been called")
        directions.calculateETACompletionHandler!(nil, nil)
        XCTAssertTrue(handlerCalled, "The handler should be captured")
    }

    func testCancelCall() {
        XCTAssertFalse(directions.cancelCalled, "The directions should not indicate having had cancel called by default")
        directions.cancel()
        XCTAssertTrue(directions.cancelCalled, "The directions should now indicate having had cancel called")
    }

}
