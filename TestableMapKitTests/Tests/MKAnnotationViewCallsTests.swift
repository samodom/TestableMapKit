//
//  MKAnnotationViewCallsTests.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit
import XCTest

class MKAnnotationViewCallsTests: XCTestCase {

    let view = MKAnnotationView()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShimMethodForwarding() {
        XCTAssertTrue(view.shouldForwardByDefault, "This shim should forward methods by default")
        XCTAssertTrue(view.shouldForwardMethodCallWithSelector("someSelector"), "The method should be forwarded by default")
        view.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(view.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded now")
        view.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(view.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded again")
    }

    func testSetSelectedCall() {
        XCTAssertFalse(view.setSelectedCalled, "The view should not indicate having had setSelected called by default")
        XCTAssertNil(view.setSelectedSelected, "The selected flag should be missing by default")
        XCTAssertNil(view.setSelectedAnimated, "The animation flag should be missing by default")
        view.setSelected(true, animated: true)
        XCTAssertTrue(view.setSelectedCalled, "The view should now indicate having had setSelected called")
        XCTAssertTrue(view.setSelectedSelected!, "The selected flag should be captured")
        XCTAssertTrue(view.setSelectedAnimated!, "The animation flag should be captured")
    }

    func testSetDragStateCall() {
        XCTAssertFalse(view.setDragStateCalled, "The view should not indicate having had setDragState called by default")
        XCTAssertTrue(view.setDragStateState == nil, "The drag state should be missing by default")
        XCTAssertNil(view.setDragStateAnimated, "The animation flag should be missing by default")
        view.setDragState(.Dragging, animated: true)
        XCTAssertTrue(view.setDragStateCalled, "The view should now indicate having had setDragState called")
        XCTAssertEqual(view.setDragStateState!, MKAnnotationViewDragState.Dragging, "The drag state should be captured")
        XCTAssertTrue(view.setDragStateAnimated!, "The animation flag should be captured")
    }

}
