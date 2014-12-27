//
//  MKOverlayPathRenderer.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public class MKOverlayPathRenderer: MapKit.MKOverlayPathRenderer {

    /*!
        Indicates whether or not `invalidatePath` has been called on this object.
    */
    public var invalidatePathCalled = false

    /*!
        Indicates whether or not `applyStrokePropertiesToContext:atZoomScale:` has been called on this object.
    */
    public var applyStrokePropertiesCalled = false

    /*!
        Provides the context passed to `applyStrokePropertiesToContext:atZoomScale:`, if called.
    */
    public var applyStrokePropertiesContext: CGContext?

    /*!
        Provides the zoom scale passed to `applyStrokePropertiesToContext:atZoomScale:`, if called.
    */
    public var applyStrokePropertiesZoomScale: MKZoomScale?

    /*!
        Indicates whether or not `applyFillPropertiesToContext:atZoomScale:` has been called on this object.
    */
    public var applyFillPropertiesCalled = false

    /*!
        Provides the context passed to `applyFillPropertiesToContext:atZoomScale:`, if called.
    */
    public var applyFillPropertiesContext: CGContext?

    /*!
        Provides the zoom scale passed to `applyFillPropertiesToContext:atZoomScale:`, if called.
    */
    public var applyFillPropertiesZoomScale: MKZoomScale?

    /*!
        Indicates whether or not `strokePath:inContext:` has been called on this object.
    */
    public var strokePathCalled = false

    /*!
        Provides the path passed to `strokePath:inContext:`, if called.
    */
    public var strokePathPath: CGPath?

    /*!
        Provides the context passed to `strokePath:inContext:`, if called.
    */
    public var strokePathContext: CGContext?

    /*!
        Indicates whether or not `fillPath:inContext:` has been called on this object.
    */
    public var fillPathCalled = false

    /*!
        Provides the path passed to `fillPath:inContext:`, if called.
    */
    public var fillPathPath: CGPath?

    /*!
        Provides the context passed to `fillPath:inContext:`, if called.
    */
    public var fillPathContext: CGContext?


    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}