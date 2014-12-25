//
//  MKAnnotationView.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public class MKAnnotationView: MapKit.MKAnnotationView {

    /*!
        Indicates whether or not `setSelected:animated:` has been called on this object.
    */
    public var setSelectedCalled = false

    /*!
        Provides the selection flag passed to `setSelected:animated:`, if called.
    */
    public var setSelectedSelected: Bool?

    /*!
        Provides the animation flag passed to `setSelected:animated:`, if called.
    */
    public var setSelectedAnimated: Bool?

    /*!
        Indicates whether or not `setDragState:animated:` has been called on this object.
    */
    public var setDragStateCalled = false

    /*!
        Provides the selection flag passed to `setDragState:animated:`, if called.
    */
    public var setDragStateState: MKAnnotationViewDragState?

    /*!
        Provides the animation flag passed to `setDragState:animated:`, if called.
    */
    public var setDragStateAnimated: Bool?


    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)

}
