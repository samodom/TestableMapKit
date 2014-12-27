//
//  MKOverlayPathRendererCalls.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public extension MKOverlayPathRenderer {

    public override func invalidatePath() {
        invalidatePathCalled = true

        if shouldForwardMethodCallWithSelector("invalidatePath") {
            super.invalidatePath()
        }
    }

    public override func applyStrokePropertiesToContext(context: CGContext!, atZoomScale zoomScale: MKZoomScale) {
        applyStrokePropertiesCalled = true
        applyStrokePropertiesContext = context
        applyStrokePropertiesZoomScale = zoomScale

        if shouldForwardMethodCallWithSelector("applyStrokePropertiesToContext:atZoomScale:") {
            super.applyStrokePropertiesToContext(context, atZoomScale: zoomScale)
        }
    }

    public override func applyFillPropertiesToContext(context: CGContext!, atZoomScale zoomScale: MKZoomScale) {
        applyFillPropertiesCalled = true
        applyFillPropertiesContext = context
        applyFillPropertiesZoomScale = zoomScale

        if shouldForwardMethodCallWithSelector("applyFillPropertiesToContext:atZoomScale:") {
            super.applyStrokePropertiesToContext(context, atZoomScale: zoomScale)
        }
    }

    public override func strokePath(path: CGPath!, inContext context: CGContext!) {
        strokePathCalled = true
        strokePathPath = path
        strokePathContext = context

        if shouldForwardMethodCallWithSelector("strokePath:inContext:") {
            super.strokePath(path, inContext: context)
        }
    }

    public override func fillPath(path: CGPath!, inContext context: CGContext!) {
        fillPathCalled = true
        fillPathPath = path
        fillPathContext = context

        if shouldForwardMethodCallWithSelector("fillPath:inContext:") {
            super.fillPath(path, inContext: context)
        }
    }

}

extension MKOverlayPathRenderer: ShimMethodForwarding {

    /*!
        The MKOverlayPathRenderer shim should forward spied messages by default.
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
