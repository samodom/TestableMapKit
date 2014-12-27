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
    var context: CGContext!
    var path: CGPath!

    override func setUp() {
        super.setUp()

        let bitmapInfo = CGBitmapInfo(CGImageAlphaInfo.PremultipliedFirst.rawValue)
        context = CGBitmapContextCreate(nil, 100, 100, 8, 0, CGColorSpaceCreateDeviceRGB(), bitmapInfo)

        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        var transform = CGAffineTransformIdentity
        path = CGPathCreateWithEllipseInRect(rect, &transform)
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

    func testApplyStrokePropertiesCall() {
        XCTAssertFalse(renderer.applyStrokePropertiesCalled, "The renderer should not indicate having had applyStrokeProperties called by default")
        XCTAssertNil(renderer.applyStrokePropertiesContext, "The context should be missing by default")
        XCTAssertNil(renderer.applyStrokePropertiesZoomScale, "The zoom scale should be missing by default")
        renderer.applyStrokePropertiesToContext(context, atZoomScale: 2.0)
        XCTAssertTrue(renderer.applyStrokePropertiesCalled, "The renderer should now indicate having had applyStrokeProperties called")
        XCTAssertTrue(renderer.applyStrokePropertiesContext! === context, "The context should be captured")
        XCTAssertEqual(renderer.applyStrokePropertiesZoomScale!, MKZoomScale(2.0), "The zoom scale should be captured")
    }

    func testApplyFillPropertiesCall() {
        XCTAssertFalse(renderer.applyFillPropertiesCalled, "The renderer should not indicate having had applyFillProperties called by default")
        XCTAssertNil(renderer.applyFillPropertiesContext, "The context should be missing by default")
        XCTAssertNil(renderer.applyFillPropertiesZoomScale, "The zoom scale should be missing by default")
        renderer.applyFillPropertiesToContext(context, atZoomScale: 2.0)
        XCTAssertTrue(renderer.applyFillPropertiesCalled, "The renderer should now indicate having had applyFillProperties called")
        XCTAssertTrue(renderer.applyFillPropertiesContext === context, "The context should be captured")
        XCTAssertEqual(renderer.applyFillPropertiesZoomScale!, MKZoomScale(2.0), "The zoom scale should be captured")
    }

    func testStrokePathCall() {
        XCTAssertFalse(renderer.strokePathCalled, "The renderer should not indicate having had strokePath called by default")
        XCTAssertNil(renderer.strokePathPath, "The path should be missing by default")
        XCTAssertNil(renderer.strokePathContext, "The context should be missing by default")
        renderer.strokePath(path, inContext: context)
        XCTAssertTrue(renderer.strokePathCalled, "The renderer should now indicate having had strokePath called")
        XCTAssertTrue(CGPathEqualToPath(renderer.strokePathPath!, path), "The path should be captured")
        XCTAssertTrue(renderer.strokePathContext === context, "The context should be captured")
    }

    func testFillPathCall() {
        XCTAssertFalse(renderer.fillPathCalled, "The renderer should not indicate having had fillPath called by default")
        XCTAssertNil(renderer.fillPathPath, "The path should be missing by default")
        XCTAssertNil(renderer.fillPathContext, "The context should be missing by default")
        renderer.fillPath(path, inContext: context)
        XCTAssertTrue(renderer.fillPathCalled, "The renderer should now indicate having had fillPath called")
        XCTAssertTrue(CGPathEqualToPath(renderer.fillPathPath!, path), "The path should be captured")
        XCTAssertTrue(renderer.fillPathContext === context, "The context should be captured")
    }

    func testInvalidatePathCall() {
        XCTAssertFalse(renderer.invalidatePathCalled, "The renderer should not indicate having had invalidatePath called by default")
        renderer.invalidatePath()
        XCTAssertTrue(renderer.invalidatePathCalled, "The renderer should now indicate having had invalidatePath called")
    }

}
