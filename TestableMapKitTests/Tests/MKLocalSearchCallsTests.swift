//
//  MKLocalSearchCallsTests.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit
import XCTest

class MKLocalSearchCallsTests: XCTestCase {

    let search = MKLocalSearch(request: MKLocalSearchRequest())
    var handler: MKLocalSearchCompletionHandler!
    var handlerCalled = false

    override func setUp() {
        super.setUp()

        handler = { _, _ in
            self.handlerCalled = true
        }
    }

    override func tearDown() {
        super.tearDown()
    }

    func testShimMethodForwarding() {
        XCTAssertFalse(search.shouldForwardByDefault, "This shim should not forward methods by default")
        XCTAssertFalse(search.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded by default")
        search.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(search.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded")
        search.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(search.shouldForwardMethodCallWithSelector("someSelector"), "The method should no longer be forwarded")
    }

    func testStartCall() {
        XCTAssertFalse(search.startCalled, "The search should not indicate having had start called by default")
        XCTAssertTrue(search.startCompletionHandler == nil, "The completion handler should be missing by default")
        search.startWithCompletionHandler(handler)
        XCTAssertTrue(search.startCalled, "The search should now indicate having had start called")
        XCTAssertTrue(search.startCompletionHandler != nil, "The completion handler should be captured")
        XCTAssertFalse(handlerCalled, "The handler should not have been called")
        search.startCompletionHandler!(nil, nil)
        XCTAssertTrue(handlerCalled, "The handler should be captured")
    }

    func testCancelCall() {
        XCTAssertFalse(search.cancelCalled, "The search should not indicate having had cancel called by default")
        search.cancel()
        XCTAssertTrue(search.cancelCalled, "The search should now indicate having had cancel called")
    }

}
