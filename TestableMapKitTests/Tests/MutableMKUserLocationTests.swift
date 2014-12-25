//
//  MutableMKUserLocationTests.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit
import XCTest

class MutableMKUserLocationTests: XCTestCase {

    let location = CLLocation(latitude: 12.1234, longitude: -24.4321)
    let heading = CLHeading()
    var userLocation: MKUserLocation!

    override func setUp() {
        super.setUp()

        userLocation = MKUserLocation(location: location, heading: heading, updating: true)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCanCreateUserLocation() {
        XCTAssertEqual(userLocation.location, location, "The user location should be created with the provided location")
        XCTAssertEqual(userLocation.heading, heading, "The user location should be created with the provided heading")
        XCTAssertTrue(userLocation.updating, "The user location should be created with the provided updating flag")
    }

    func testMutableLocation() {
        let newLocation = CLLocation(latitude: 1.111, longitude: 2.222)
        userLocation.location = newLocation
        XCTAssertEqual(userLocation.location, newLocation, "The user location should allow mutation of its location property")
    }

    func testMutableUpdating() {
        userLocation.updating = false
        XCTAssertFalse(userLocation.updating, "The user location should allow mutation of its updating property")
        userLocation.updating = true
        XCTAssertTrue(userLocation.updating, "The user location should allow mutation of its updating property")
    }

    func testMutableHeading() {
        let newHeading = CLHeading()
        userLocation.heading = newHeading
        XCTAssertEqual(userLocation.heading, newHeading, "The user location should allow mutation of its heading property")
    }

}
