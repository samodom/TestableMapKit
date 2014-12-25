//
//  MKOverlayRendererCallsTests.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit
import XCTest

class MKOverlayRendererCallsTests: XCTestCase {

    let renderer = MKOverlayRenderer()
    let mapPoint = MKMapPoint(x: 12345.12345, y: 12321.12321)
    let mapSize = MKMapSize(width: 12.34, height: 11.11)
    var mapRect: MKMapRect!

    override func setUp() {
        super.setUp()

        mapRect = MKMapRect(origin: mapPoint, size: mapSize)
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

    func testSetNeedsDisplayCall() {
        renderer.setNeedsDisplayCalled = false
        XCTAssertTrue(renderer.setNeedsDisplayMapRect == nil, "The rect should be missing by default")
        XCTAssertNil(renderer.setNeedsDisplayZoomScale, "The zoom scale should be missing by default")
        renderer.setNeedsDisplay()
        XCTAssertTrue(renderer.setNeedsDisplayCalled, "The renderer should now indicate having had setNeedsDisplay called")
        XCTAssertTrue(renderer.setNeedsDisplayMapRect == nil, "The rect should still be missing")
        XCTAssertNil(renderer.setNeedsDisplayZoomScale, "The zoom scale should still be missing")
    }

    func testSetNeedsDisplayInMapRectCall() {
        renderer.setNeedsDisplayCalled = false
        XCTAssertTrue(renderer.setNeedsDisplayMapRect == nil, "The rect should be missing by default")
        XCTAssertNil(renderer.setNeedsDisplayZoomScale, "The zoom scale should be missing by default")
        renderer.setNeedsDisplayInMapRect(mapRect)
        XCTAssertTrue(renderer.setNeedsDisplayCalled, "The renderer should now indicate having had setNeedsDisplay called")
        XCTAssertEqual(renderer.setNeedsDisplayMapRect!, mapRect, "The map rect should be captured")
        XCTAssertNil(renderer.setNeedsDisplayZoomScale, "The zoom scale should still be missing")
    }

    func testSetNeedsDisplayInRectWithZoomScaleCall() {
        renderer.setNeedsDisplayCalled = false
        XCTAssertTrue(renderer.setNeedsDisplayMapRect == nil, "The rect should be missing by default")
        XCTAssertNil(renderer.setNeedsDisplayZoomScale, "The zoom scale should be missing by default")
        renderer.setNeedsDisplayInMapRect(mapRect, zoomScale: 2.0)
        XCTAssertTrue(renderer.setNeedsDisplayCalled, "The renderer should now indicate having had setNeedsDisplay called")
        XCTAssertEqual(renderer.setNeedsDisplayMapRect!, mapRect, "The map rect should be captured")
        XCTAssertEqual(renderer.setNeedsDisplayZoomScale!, MKZoomScale(2.0), "The zoom scale should be captured")
    }

}
