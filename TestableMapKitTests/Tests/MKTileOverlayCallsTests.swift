//
//  MKTileOverlayCallsTests.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit
import XCTest

class MKTileOverlayCallsTests: XCTestCase {

    let template = "http://myserver/tile?x={x}&y={y}&z={z}&scale={scale}"
    var overlay: MKTileOverlay!
    let path = MKTileOverlayPath(x: 1, y: 2, z: 3, contentScaleFactor: 2.0)
    var resultHandlerCalled = false
    var resultHandler: MKTileOverlayTileLoadingResultHandler!

    override func setUp() {
        super.setUp()

        overlay = MKTileOverlay(URLTemplate: template)

        resultHandler = { _, _ in
            self.resultHandlerCalled = true
        }
    }

    override func tearDown() {
        super.tearDown()
    }

    func testShimMethodForwarding() {
        XCTAssertFalse(overlay.shouldForwardByDefault, "This shim should not forward methods by default")
        XCTAssertFalse(overlay.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded by default")
        overlay.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(overlay.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded")
        overlay.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(overlay.shouldForwardMethodCallWithSelector("someSelector"), "The method should no longer be forwarded")
    }

    func testLoadTileCall() {
        XCTAssertFalse(overlay.loadTileCalled, "The overlay should not indicate having had loadTile called by default")
        XCTAssertTrue(overlay.loadTilePath == nil, "The path should be missing by default")
        XCTAssertTrue(overlay.loadTileResultHandler == nil, "The result handler should be missing by default")
        overlay.loadTileAtPath(path, result: resultHandler)
        XCTAssertTrue(overlay.loadTileCalled, "The overlay should now indicate having had loadTile called")
        XCTAssertEqual(overlay.loadTilePath!.x, path.x, "The path should be captured")
        XCTAssertEqual(overlay.loadTilePath!.y, path.y, "The path should be captured")
        XCTAssertEqual(overlay.loadTilePath!.z, path.z, "The path should be captured")
        XCTAssertEqual(overlay.loadTilePath!.contentScaleFactor, path.contentScaleFactor, "The path should be captured")
        XCTAssertTrue(overlay.loadTileResultHandler != nil, "The result handler should be captured")
        XCTAssertFalse(resultHandlerCalled, "The result handler should still not have been called")
        overlay.loadTileResultHandler!(nil, nil)
        XCTAssertTrue(resultHandlerCalled, "The result handler should now have been called")
    }

}
