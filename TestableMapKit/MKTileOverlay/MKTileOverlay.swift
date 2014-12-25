//
//  MKTileOverlay.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public typealias MKTileOverlayTileLoadingResultHandler = (NSData!, NSError!) -> Void


public class MKTileOverlay: MapKit.MKTileOverlay {

    /*!
        Indicates whether or not `loadTileAtPath:result:`has been called on this object.
    */
    public var loadTileCalled = false

    /*!
        Provides the path passed to `loadTileAtPath:result:`, if called.
    */
    public var loadTilePath: MKTileOverlayPath?

    /*!
        Provides the result handler passed to `loadTileAtPath:result:`, if called.
    */
    public var loadTileResultHandler: MKTileOverlayTileLoadingResultHandler?


    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: false)

}