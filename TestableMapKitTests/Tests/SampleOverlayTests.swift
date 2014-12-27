//
//  SampleOverlayTests.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/26/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit
import XCTest

class SampleOverlayTests: XCTestCase {

    var overlay: SampleOverlay!
    let coordinate = CLLocationCoordinate2D(latitude: 12.1234, longitude: -24.4321)
    let size = MKMapSize(width: 111.0, height: 144.0)
    var mapRect: MKMapRect!

    override func setUp() {
        super.setUp()

        let origin = MKMapPointForCoordinate(coordinate)
        mapRect = MKMapRect(origin: origin, size: size)

        overlay = SampleOverlay(coordinate: coordinate, boundingMapRect: mapRect)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSampleOverlayCreation() {
        XCTAssertEqual(overlay.coordinate, coordinate, "The overlay should be created with the provide coordinate")
        XCTAssertEqual(overlay.boundingMapRect, mapRect, "The overlay should be created with the provide bounding map rect")
    }

    func testMapContentReplacement() {
        XCTAssertFalse(overlay.canReplaceMapContent(), "The overlay should not indicate that it can replace map content by default")
        overlay.shouldReplaceMapContent = true
        XCTAssertTrue(overlay.canReplaceMapContent(), "The overlay should now indicate that it can replace map content")
        overlay.shouldReplaceMapContent = false
        XCTAssertFalse(overlay.canReplaceMapContent(), "The overlay should no longer indicate that it can replace map content")
    }

}
