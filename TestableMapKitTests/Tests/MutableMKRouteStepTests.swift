//
//  MutableMKRouteStepTests.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/26/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit
import XCTest

class MutableMKRouteStepTests: XCTestCase {

    var step = MKRouteStep()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testMutablePolyline() {
        XCTAssertNil(step.polyline, "The polyline should be missing by default")
        var coordinates =
        [CLLocationCoordinate2D(latitude: 24.0, longitude: -24.0),
            CLLocationCoordinate2D(latitude: 24.1, longitude: -24.1)]
        let polyline = MKPolyline(coordinates: &coordinates, count: 2)
        step.polyline = polyline
        XCTAssertEqual(step.polyline, polyline, "The step should allow mutation of its polyline property")
    }

    func testMutableInstructions() {
        XCTAssertNil(step.instructions, "The instructions should be missing by default")
        step.instructions = "Use the force"
        XCTAssertEqual(step.instructions, "Use the force", "The step should allow mutation of its instructions property")
    }

    func testMutableNotice() {
        XCTAssertNil(step.notice, "The notice should be missing by default")
        step.notice = "Watch Out!"
        XCTAssertEqual(step.notice, "Watch Out!", "The step should allow mutation of its notice property")
    }

    func testMutableDistance() {
        XCTAssertEqual(step.distance, CLLocationDistance(0.0), "The distance should be zero by default")
        step.distance = 14.42
        XCTAssertEqual(step.distance, CLLocationDistance(14.42), "The step should allow mutation of its distance property")
    }

    func testMutableTransportType() {
        XCTAssertEqual(step.transportType, MKDirectionsTransportType.allZeros, "The transport type should be all zeros by default")
        step.transportType = .Walking
        XCTAssertEqual(step.transportType, MKDirectionsTransportType.Walking, "The step should allow mutation of its transportType property")
    }

}
