//
//  MKOverlayRendererCalls.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public extension MKOverlayRenderer {

    public override func setNeedsDisplay() {
        setNeedsDisplayCalled = true

        if shouldForwardMethodCallWithSelector("setNeedsDisplay") {
            super.setNeedsDisplay()
        }
    }

    public override func setNeedsDisplayInMapRect(rect: MKMapRect) {
        setNeedsDisplayCalled = true
        setNeedsDisplayMapRect = rect

        if shouldForwardMethodCallWithSelector("setNeedsDisplayInMapRect:") {
            super.setNeedsDisplayInMapRect(rect)
        }
    }

    public override func setNeedsDisplayInMapRect(rect: MKMapRect, zoomScale: MKZoomScale) {
        setNeedsDisplayCalled = true
        setNeedsDisplayMapRect = rect
        setNeedsDisplayZoomScale = zoomScale

        if shouldForwardMethodCallWithSelector("setNeedsDisplayInMapRect:zoomScale:") {
            super.setNeedsDisplayInMapRect(rect, zoomScale: zoomScale)
        }
    }

}

extension MKOverlayRenderer: ShimMethodForwarding {

    /*!
        The MKOverlayRenderer shim should forward spied messages by default.
    */
    public var shouldForwardByDefault: Bool { return forwardingList.shouldForwardByDefault }

    /*!
        This method indicates whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method to check for forwarding status.
        :returns: Boolean value indicating whether or not the spy currently forwards calls to the specified method.
    */
    public func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool {
        return forwardingList.shouldForwardMethodCallWithSelector(selector)
    }

    /*!
        Calls to this method control whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method of which to change the forwarding status.
        :param: Boolean value indicating whether or not the method calls should be forwarded.
    */
    public func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool) {
        forwardingList.setShouldForwardMethodCallWithSelector(selector, shouldForward)
    }

}
