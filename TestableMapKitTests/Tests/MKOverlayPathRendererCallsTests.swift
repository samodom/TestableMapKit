//
//  MKOverlayPathRendererCallsTests.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit
import XCTest

class MKOverlayPathRendererCallsTests: XCTestCase {

    let renderer = MKOverlayPathRenderer()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShimMethodForwarding() {
        XCTAssertTrue(renderer.shouldForwardByDefault, "This shim should forward methods by default")
        XCTAssertTrue(renderer.shouldForwardMethodCallWithSelector("someSelector"), "The method should be forwarded by default")
        renderer.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(renderer.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded now")
        renderer.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(renderer.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded again")
    }

    func testInvalidatePathCall() {
        XCTAssertFalse(renderer.invalidatePathCalled, "The renderer should not indicate having had invalidatePath called by default")
        renderer.invalidatePath()
        XCTAssertTrue(renderer.invalidatePathCalled, "The renderer should now indicate having had invalidatePath called")
    }

}
