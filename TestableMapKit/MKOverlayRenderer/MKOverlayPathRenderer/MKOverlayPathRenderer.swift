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


    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}