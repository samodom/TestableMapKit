//
//  MKMapViewCallsTests.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/24/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit
import XCTest

class MKMapViewCallsTests: XCTestCase {

    let map = MKMapView()
    let coordinate = CLLocationCoordinate2D(latitude: 12.1234, longitude: -24.4321)
    let regionSpan = MKCoordinateSpan(latitudeDelta: 1.1, longitudeDelta: 2.2)
    var region: MKCoordinateRegion!
    var annotation1: SampleAnnotation!
    var annotation2: SampleAnnotation!
    var annotation3: SampleAnnotation!
    let mapPoint = MKMapPoint(x: 12345.12345, y: 12321.12321)
    let mapSize = MKMapSize(width: 12.34, height: 11.11)
    var mapRect: MKMapRect!
    let padding = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)

    override func setUp() {
        super.setUp()

        region = MKCoordinateRegion(center: coordinate, span: regionSpan)

        annotation1 = SampleAnnotation(coordinate: coordinate, title: "Sample 1")
        annotation2 = SampleAnnotation(coordinate: coordinate, title: "Sample 1")
        annotation3 = SampleAnnotation(coordinate: coordinate, title: "Sample 1")

        mapRect = MKMapRect(origin: mapPoint, size: mapSize)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShimMethodForwarding() {
        XCTAssertTrue(map.shouldForwardByDefault, "This shim should forward methods by default")
        XCTAssertTrue(map.shouldForwardMethodCallWithSelector("someSelector"), "The method should be forwarded by default")
        map.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(map.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded now")
        map.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(map.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded again")
    }

    func testSetRegionAnimatedCall() {
        map.setRegionCalled = false
        map.setRegionRegion = nil
        map.setRegionAnimated = nil
        map.setRegion(region, animated: true)
        XCTAssertTrue(map.setRegionCalled, "The map view should now indicate having had setRegion called")
        XCTAssertEqual(map.setRegionRegion!, region , "The region should be captured")
        XCTAssertTrue(map.setRegionAnimated!, "The animation flag should be captured")
    }

    func testSetCenterCoordinateCall() {
        XCTAssertFalse(map.setCenterCoordinateCalled, "The map view should not indicate having had setCenterCoordinate called by default")
        XCTAssertTrue(map.setCenterCoordinateCoordinate == nil, "The coordinate should be missing by default")
        XCTAssertNil(map.setCenterCoordinateAnimated, "The animation flag should be missing by default")
        map.setCenterCoordinate(coordinate, animated: true)
        XCTAssertTrue(map.setCenterCoordinateCalled, "The map view should now indicate having had setCenterCoordinate called")
        XCTAssertEqual(map.setCenterCoordinateCoordinate!, coordinate, "The coordinate should be captured")
        XCTAssertTrue(map.setCenterCoordinateAnimated!, "The animation flag should be captured")
    }

    func testShowAnnotationsCall() {
        XCTAssertFalse(map.showAnnotationsCalled, "The map view should not indicate having had showAnnotations called by default")
        XCTAssertNil(map.showAnnotationsAnnotations, "The annotations should be missing by default")
        XCTAssertNil(map.showAnnotationsAnimated, "The animation flag should be missing by default")
        let annotations = [annotation1, annotation2, annotation3]
        map.showAnnotations(annotations, animated: true)
        XCTAssertTrue(map.showAnnotationsCalled, "The map view should now indicate having had showAnnotations called")
        let capturedAnnotations = map.showAnnotationsAnnotations!
        XCTAssertEqual(capturedAnnotations.count, 3, "There should be three captured annotations")
        XCTAssertEqual(capturedAnnotations[0] as SampleAnnotation, annotation1, "The annotations should be captured")
        XCTAssertEqual(capturedAnnotations[1] as SampleAnnotation, annotation2, "The annotations should be captured")
        XCTAssertEqual(capturedAnnotations[2] as SampleAnnotation, annotation3, "The annotations should be captured")
        XCTAssertTrue(map.showAnnotationsAnimated!, "The animation flag should be captured")
    }

    func testSetVisibleMapRect() {
        XCTAssertFalse(map.setVisibleMapRectCalled, "The map view should not indicate having had setVisibleMapRect called by default")
        XCTAssertTrue(map.setVisibleMapRectRect == nil, "The rect should be missing by default")
        XCTAssertTrue(map.setVisibleMapRectPadding == nil, "The padding should be missing by default")
        XCTAssertNil(map.setVisibleMapRectAnimated, "The animation flag should be missing by default")
        map.setVisibleMapRect(mapRect, animated: true)
        XCTAssertTrue(map.setVisibleMapRectCalled, "The map view should now indicate having had setVisibleMapRect called")
        XCTAssertEqual(map.setVisibleMapRectRect!, mapRect, "The rect should be captured")
        XCTAssertEqual(map.setVisibleMapRectPadding!, UIEdgeInsetsZero, "The padding should still zero")
        XCTAssertTrue(map.setVisibleMapRectAnimated!, "The animation flag should be captured")
    }

    func testSetVisibleMapRectWithPaddingCall() {
        XCTAssertFalse(map.setVisibleMapRectCalled, "The map view should not indicate having had setVisibleMapRect called by default")
        XCTAssertTrue(map.setVisibleMapRectRect == nil, "The rect should be missing by default")
        XCTAssertTrue(map.setVisibleMapRectPadding == nil, "The padding should be missing by default")
        XCTAssertNil(map.setVisibleMapRectAnimated, "The animation flag should be missing by default")
        map.setVisibleMapRect(mapRect, edgePadding: padding, animated: true)
        XCTAssertTrue(map.setVisibleMapRectCalled, "The map view should now indicate having had setVisibleMapRect called")
        XCTAssertEqual(map.setVisibleMapRectRect!, mapRect, "The rect should be captured")
        XCTAssertEqual(map.setVisibleMapRectPadding!, padding, "The padding should be missing by default")
        XCTAssertTrue(map.setVisibleMapRectAnimated!, "The animation flag should be captured")
    }

    func testSetCameraCall() {
        XCTAssertFalse(map.setCameraCalled, "The map view should not indicate having had setCamera called by default")
        XCTAssertTrue(map.setCameraCamera == nil, "The camera should be missing by default")
        XCTAssertNil(map.setCameraAnimated, "The animation flag should be missing by default")
        let camera = MKMapCamera(lookingAtCenterCoordinate: coordinate, fromEyeCoordinate: coordinate, eyeAltitude: 1000)
        map.setCamera(camera, animated: true)
        XCTAssertTrue(map.setCameraCalled, "The map view should now indicate having had setCamera called")
        XCTAssertEqual(map.setCameraCamera!, camera, "The camera should be captured")
        XCTAssertTrue(map.setCameraAnimated!, "The animation flag should be captured")
    }

    func testSetUserTrackingModeCall() {
        XCTAssertFalse(map.setUserTrackingModeCalled, "The map view should not indicate having had setUserTrackingMode called by default")
        XCTAssertTrue(map.setUserTrackingModeMode == nil, "The mode should be missing by default")
        XCTAssertNil(map.setUserTrackingModeAnimated, "The animation flag should be missing by default")
        map.setUserTrackingMode(.FollowWithHeading, animated: true)
        XCTAssertTrue(map.setUserTrackingModeCalled, "The map view should now indicate having had setUserTrackingMode called")
        XCTAssertEqual(map.setUserTrackingModeMode!, MKUserTrackingMode.FollowWithHeading, "The mode should be captured")
        XCTAssertTrue(map.setUserTrackingModeAnimated!, "The animation flag should be captured")
    }

    func testSelectAnnotationCall() {
        XCTAssertFalse(map.selectAnnotationCalled, "The map view should not indicate having had selectAnnotation called by default")
        XCTAssertTrue(map.selectAnnotationAnnotation == nil, "The annotation should be missing by default")
        XCTAssertNil(map.selectAnnotationAnimated, "The animation flag should be missing by default")
        map.selectAnnotation(annotation1, animated: true)
        XCTAssertTrue(map.selectAnnotationCalled, "The map view should now indicate having had selectAnnotation called")
        XCTAssertEqual(map.selectAnnotationAnnotation! as SampleAnnotation, annotation1, "The annotation should be captured")
        XCTAssertTrue(map.selectAnnotationAnimated!, "The animation flag should be captured")
    }

    func testDeselectAnnotationCall() {
        XCTAssertFalse(map.deselectAnnotationCalled, "The map view should not indicate having had deselectAnnotation called by default")
        XCTAssertTrue(map.deselectAnnotationAnnotation == nil, "The annotation should be missing by default")
        XCTAssertNil(map.deselectAnnotationAnimated, "The animation flag should be missing by default")
        map.deselectAnnotation(annotation1, animated: true)
        XCTAssertTrue(map.deselectAnnotationCalled, "The map view should now indicate having had deselectAnnotation called")
        XCTAssertEqual(map.deselectAnnotationAnnotation! as SampleAnnotation, annotation1, "The annotation should be captured")
        XCTAssertTrue(map.deselectAnnotationAnimated!, "The animation flag should be captured")
    }

}
