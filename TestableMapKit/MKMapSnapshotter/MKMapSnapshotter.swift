//
//  MKMapSnapshotter.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/26/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public class MKMapSnapshotter: MapKit.MKMapSnapshotter {

    /*!
        Indicates whether or not `startWithCompletionHandler:` or `startWithQueue:completionHandler:` has been called on this object.
    */
    public var startCalled = false

    /*!
        Provides the completion handler passed to `startWithCompletionHandler:` or `startWithQueue:completionHandler:`, if called.
    */
    public var startCompletionHandler: MKMapSnapshotCompletionHandler?

    /*!
        Provides the dispatch passed to `startWithQueue:completionHandler:`, if called.
    */
    public var startQueue: dispatch_queue_t?

    /*!
        Indicates whether or not `cancel` has been called on this object.
    */
    public var cancelCalled = false


    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: false)
    
}
