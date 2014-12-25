//
//  MKTileOverlayRenderer.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public class MKTileOverlayRenderer: MapKit.MKTileOverlayRenderer {

    /*!
        Indicates whether or not `reloadData` has been called on this object.
    */
    public var reloadDataCalled = false


    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: false)

}