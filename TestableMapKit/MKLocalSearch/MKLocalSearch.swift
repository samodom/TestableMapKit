//
//  MKLocalSearch.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public class MKLocalSearch: MapKit.MKLocalSearch {

    /*!
        Indicates whether or not `startWithCompletionHandler:` has been called on this object.
    */
    public var startCalled = false

    /*!
        Provides the completion handler passed to `startWithCompletionHandler:`, if called.
    */
    public var startCompletionHandler: MKLocalSearchCompletionHandler?

    /*!
        Indicates whether or not `cancel` has been called on this object.
    */
    public var cancelCalled = false


    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: false)

}