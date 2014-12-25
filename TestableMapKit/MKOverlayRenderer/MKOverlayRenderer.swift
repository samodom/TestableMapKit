//
//  MKOverlayRenderer.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public class MKOverlayRenderer: MapKit.MKOverlayRenderer {

    /*!
        Indicates whether or not `setNeedsDisplay`, `setNeedsDisplayInMapRect:` or `setNeedsDisplayInMapRect:zoomScale` has been called on this object.
    */
    public var setNeedsDisplayCalled = false

    /*!
        Provides the map rect passed to `setNeedsDisplayInMapRect:` or `setNeedsDisplayInMapRect:zoomScale`, if called.
    */
    public var setNeedsDisplayMapRect: MKMapRect?

    /*!
        Provides the zoom scale passed to `setNeedsDisplayInMapRect:zoomScale`, if called.
    */
    public var setNeedsDisplayZoomScale: MKZoomScale?


    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}