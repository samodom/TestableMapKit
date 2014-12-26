//
//  MutableMKRouteTests.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/26/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit
import XCTest

class MutableMKRouteTests: XCTestCase {

    var route = MKRoute()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testMutablePolyline() {
        XCTAssertNil(route.polyline, "The polyline should be missing by default")
        var coordinates =
        [CLLocationCoordinate2D(latitude: 24.0, longitude: -24.0),
            CLLocationCoordinate2D(latitude: 24.1, longitude: -24.1)]
        let polyline = MKPolyline(coordinates: &coordinates, count: 2)
        route.polyline = polyline
        XCTAssertEqual(route.polyline, polyline, "The route should allow mutation of its polyline property")
    }

    func testMutableSteps() {
        XCTAssertNil(route.steps, "The steps should be missing by default")
        let steps = [MKRouteStep(), MKRouteStep(), MKRouteStep()]
        route.steps = steps
        XCTAssertEqual(route.steps as [MKRouteStep], steps, "The route should allow mutation of its steps property")
    }

    func testMutableName() {
        XCTAssertNil(route.name, "The name should be missing by default")
        route.name = "Sample Route"
        XCTAssertEqual(route.name, "Sample Route", "The route should allow mutation of its name property")
    }

    func testMutableAdvisoryNotices() {
        XCTAssertNil(route.advisoryNotices, "The advisory notices should be missing by default")
        let notices = ["alpha", "bravo", "charlie"]
        route.advisoryNotices = notices
        XCTAssertEqual(route.advisoryNotices as [String], notices, "The route should allow mutation of its advisoryNotices property")
    }

    func testMutableDistance() {
        XCTAssertEqual(route.distance, CLLocationDistance(0.0), "The distance should be zero by default")
        route.distance = 14.42
        XCTAssertEqual(route.distance, CLLocationDistance(14.42), "The route should allow mutation of its distance property")
    }

    func testMutableExpectedTravelTime() {
        XCTAssertEqual(route.expectedTravelTime, NSTimeInterval(0.0), "The expected travel time should be zero by default")
        route.expectedTravelTime = NSTimeInterval(14.42)
        XCTAssertEqual(route.expectedTravelTime, NSTimeInterval(14.42), "The route should allow mutation of its expectedTravelTime property")
    }

    func testMutableTransportType() {
        XCTAssertEqual(route.transportType, MKDirectionsTransportType.Automobile, "The transport type should be automobile by default")
        route.transportType = .Walking
        XCTAssertEqual(route.transportType, MKDirectionsTransportType.Walking, "The route should allow mutation of its transportType property")
    }

}
