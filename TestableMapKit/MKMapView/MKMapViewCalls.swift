//
//  MKMapViewCalls.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public extension MKMapView {

    public override func setRegion(region: MKCoordinateRegion, animated: Bool) {
        setRegionCalled = true
        setRegionRegion = region
        setRegionAnimated = animated

        if shouldForwardMethodCallWithSelector("setRegion:animated:") {
            super.setRegion(region, animated: animated)
        }
    }

    public override func setCenterCoordinate(coordinate: CLLocationCoordinate2D, animated: Bool) {
        setCenterCoordinateCalled = true
        setCenterCoordinateCoordinate = coordinate
        setCenterCoordinateAnimated = animated

        if shouldForwardMethodCallWithSelector("setCenterCoordinate:animated:") {
            super.setCenterCoordinate(coordinate, animated: animated)
        }
    }

    public override func showAnnotations(annotations: [AnyObject]!, animated: Bool) {
        showAnnotationsCalled = true
        showAnnotationsAnnotations = annotations as? [MKAnnotation]
        showAnnotationsAnimated = animated

        if shouldForwardMethodCallWithSelector("showAnnotations:animated:") {
            super.showAnnotations(annotations, animated: animated)
        }
    }

    public override func setVisibleMapRect(mapRect: MKMapRect, edgePadding: UIEdgeInsets, animated: Bool) {
        setVisibleMapRectCalled = true
        setVisibleMapRectRect = mapRect
        setVisibleMapRectPadding = edgePadding
        setVisibleMapRectAnimated = animated

        if shouldForwardMethodCallWithSelector("setVisibleMapRect:animated:") {
            super.setVisibleMapRect(mapRect, edgePadding: edgePadding, animated: animated)
        }
    }

    public override func setCamera(camera: MKMapCamera!, animated: Bool) {
        setCameraCalled = true
        setCameraCamera = camera
        setCameraAnimated = animated

        if shouldForwardMethodCallWithSelector("setCamera:animated:") {
            super.setCamera(camera, animated: animated)
        }
    }

    public override func setUserTrackingMode(mode: MKUserTrackingMode, animated: Bool) {
        setUserTrackingModeCalled = true
        setUserTrackingModeMode = mode
        setUserTrackingModeAnimated = animated

        if shouldForwardMethodCallWithSelector("setUserTrackingMode:animated:") {
            super.setUserTrackingMode(mode, animated: animated)
        }
    }

    public override func selectAnnotation(annotation: MKAnnotation!, animated: Bool) {
        selectAnnotationCalled = true
        selectAnnotationAnnotation = annotation
        selectAnnotationAnimated = animated

        if shouldForwardMethodCallWithSelector("selectAnnotation:animated:") {
            super.selectAnnotation(annotation, animated: animated)
        }
    }

    public override func deselectAnnotation(annotation: MKAnnotation!, animated: Bool) {
        deselectAnnotationCalled = true
        deselectAnnotationAnnotation = annotation
        deselectAnnotationAnimated = animated

        if shouldForwardMethodCallWithSelector("deselectAnnotation:animated:") {
            super.deselectAnnotation(annotation, animated: animated)
        }
    }

}

extension MKMapView: ShimMethodForwarding {

    /*!
        The UIResponder shim should forward spied messages by default.
    */
    public var shouldForwardByDefault: Bool { return forwardingList.shouldForwardByDefault }

    /*!
        This method indicates whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method to check for forwarding status.
        :returns: Boolean value indicating whether or not the spy currently forwards calls to the specified method.
    */
    public func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool {
        return forwardingList.shouldForwardMethodCallWithSelector(selector)
    }

    /*!
        Calls to this method control whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method of which to change the forwarding status.
        :param: Boolean value indicating whether or not the method calls should be forwarded.
    */
    public func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool) {
        forwardingList.setShouldForwardMethodCallWithSelector(selector, shouldForward)
    }

}
