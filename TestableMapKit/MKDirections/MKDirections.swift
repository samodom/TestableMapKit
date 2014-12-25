//
//  MKDirections.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public class MKDirections: MapKit.MKDirections {

    /*!
        Indicates whether or not `calculateDirectionsWithCompletionHandler:` has been called on this object.
    */
    public var calculateDirectionsCalled = false

    /*!
        Provides the completion handler passed to `calculateDirectionsWithCompletionHandler:`, if called.
    */
    public var calculateDirectionsCompletionHandler: MKDirectionsHandler?

    /*!
        Indicates whether or not `calculateETAWithCompletionHandler:` has been called on this object.
    */
    public var calculateETACalled = false

    /*!
        Provides the completion handler passed to `calculateETAWithCompletionHandler:`, if called.
    */
    public var calculateETACompletionHandler: MKETAHandler?

    /*!
        Indicates whether or not `cancel` has been called on this object.
    */
    public var cancelCalled = false


    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: false)

}
