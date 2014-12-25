//
//  MKMapView.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/24/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public class MKMapView: MapKit.MKMapView {

    /*!
        Indicates whether or not `setRegion:animated:` has been called on this object.
    */
    public var setRegionCalled = false

    /*!
        Provides the region passed to `setRegion:animated:`, if called.
    */
    public var setRegionRegion: MKCoordinateRegion?

    /*!
        Provides the animation flag passed to `setRegion:animated:`, if called.
    */
    public var setRegionAnimated: Bool?

    /*!
        Indicates whether or not `setCenterCoordinate:animated:` has been called on this object.
    */
    public var setCenterCoordinateCalled = false

    /*!
        Provides the coordinate passed to `setCenterCoordinate:animated:`, if called.
    */
    public var setCenterCoordinateCoordinate: CLLocationCoordinate2D?

    /*!
        Provides the animation flag passed to `setCenterCoordinate:animated:`, if called.
    */
    public var setCenterCoordinateAnimated: Bool?

    /*!
        Indicates whether or not `showAnnotations:animated:` has been called on this object.
    */
    public var showAnnotationsCalled = false

    /*!
        Provides the annotations passed to `showAnnotations:animated:`, if called.
    */
    public var showAnnotationsAnnotations: [MKAnnotation]?

    /*!
        Provides the animation flag passed to `showAnnotations:animated:`, if called.
    */
    public var showAnnotationsAnimated: Bool?

    /*!
        Indicates whether or not `setVisibleMapRect:animated:` or `setVisibleMapRect:edgePadding:animated:` has been called on this object.
    */
    public var setVisibleMapRectCalled = false

    /*!
        Provides the map rect passed to `setVisibleMapRect:animated:` or `setVisibleMapRect:edgePadding:animated:`, if called.
    */
    public var setVisibleMapRectRect: MKMapRect?

    /*!
        Provides the edge padding passed to `setVisibleMapRect:edgePadding:animated:`, if called.
    */
    public var setVisibleMapRectPadding: UIEdgeInsets?

    /*!
        Provides the animation flag passed to `setVisibleMapRect:animated:` or `setVisibleMapRect:edgePadding:animated:`, if called.
    */
    public var setVisibleMapRectAnimated: Bool?

    /*!
        Indicates whether or not `setCamera:animated:` has been called on this object.
    */
    public var setCameraCalled = false

    /*!
        Provides the camera passed to `setCamera:animated:`, if called.
    */
    public var setCameraCamera: MKMapCamera?

    /*!
        Provides the animation flag passed to `setCamera:animated:`, if called.
    */
    public var setCameraAnimated: Bool?

    /*!
        Indicates whether or not `setUserTrackingMode:animated:` has been called on this object.
    */
    public var setUserTrackingModeCalled = false

    /*!
        Provides the mode passed to `setUserTrackingMode:animated:`, if called.
    */
    public var setUserTrackingModeMode: MKUserTrackingMode?

    /*!
        Provides the animation flag passed to `setUserTrackingMode:animated:`, if called.
    */
    public var setUserTrackingModeAnimated: Bool?

    /*!
        Indicates whether or not `selectAnnotation:animated:` has been called on this object.
    */
    public var selectAnnotationCalled = false

    /*!
        Provides the annotation passed to `selectAnnotation:animated:`, if called.
    */
    public var selectAnnotationAnnotation: MKAnnotation?

    /*!
        Provides the animation flag passed to `selectAnnotation:animated:`, if called.
    */
    public var selectAnnotationAnimated: Bool?

    /*!
        Indicates whether or not `deselectAnnotation:animated:` has been called on this object.
    */
    public var deselectAnnotationCalled = false

    /*!
        Provides the annotation passed to `deselectAnnotation:animated:`, if called.
    */
    public var deselectAnnotationAnnotation: MKAnnotation?

    /*!
        Provides the animation flag passed to `deselectAnnotation:animated:`, if called.
    */
    public var deselectAnnotationAnimated: Bool?


    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}
