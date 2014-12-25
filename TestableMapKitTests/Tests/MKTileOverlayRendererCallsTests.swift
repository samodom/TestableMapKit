//
//  MKTileOverlayRendererCallsTests.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit
import XCTest

class MKTileOverlayRendererCallsTests: XCTestCase {

    let template = "http://myserver/tile?x={x}&y={y}&z={z}&scale={scale}"
    var overlay: MKTileOverlay!
    var renderer: MKTileOverlayRenderer!

    override func setUp() {
        super.setUp()

        overlay = MKTileOverlay(URLTemplate: template)
        renderer = MKTileOverlayRenderer(tileOverlay: overlay)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShimMethodForwarding() {
        XCTAssertFalse(renderer.shouldForwardByDefault, "This shim should not forward methods by default")
        XCTAssertFalse(renderer.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded by default")
        renderer.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(renderer.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded")
        renderer.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(renderer.shouldForwardMethodCallWithSelector("someSelector"), "The method should no longer be forwarded")
    }

    func testInvalidatePathCall() {
        XCTAssertFalse(renderer.reloadDataCalled, "The renderer should not indicate having had reloadData called by default")
        renderer.reloadData()
        XCTAssertTrue(renderer.reloadDataCalled, "The renderer should now indicate having had reloadData called")
    }

}
