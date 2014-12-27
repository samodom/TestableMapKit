//
//  SampleAnnotationTests.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/26/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit
import XCTest

class SampleAnnotationTests: XCTestCase {

    let coordinate = CLLocationCoordinate2D(latitude: 24.1234, longitude: -12.1212)
    var annotation: SampleAnnotation!

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSampleAnnotationCreation() {
        annotation = SampleAnnotation(coordinate: coordinate, title: "Sample", subtitle: "Extra")
        XCTAssertEqual(annotation.coordinate, coordinate, "The annotation should be created with the provided coordinate")
        XCTAssertEqual(annotation.title, "Sample", "The annotation should be created with the provided title")
        XCTAssertEqual(annotation.subtitle, "Extra", "The annotation should be created with the provided subtitle")
    }

    func testSampleAnnotationDefaultValues() {
        annotation = SampleAnnotation(coordinate: coordinate)
        XCTAssertEqual(annotation.coordinate, coordinate, "The annotation should be created with the provided coordinate")
        XCTAssertEqual(annotation.title, "", "The annotation should be created with an empty title")
        XCTAssertEqual(annotation.subtitle, "", "The annotation should be created with an empty subtitle")
    }

}
