//
//  MKAnnotationViewCalls.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit


public extension MKAnnotationView {

    public override func setSelected(selected: Bool, animated: Bool) {
        setSelectedCalled = true
        setSelectedSelected = selected
        setSelectedAnimated = animated

        if shouldForwardMethodCallWithSelector("setSelected:animated:") {
            super.setSelected(selected, animated: animated)
        }
    }

    public override func setDragState(newDragState: MKAnnotationViewDragState, animated: Bool) {
        setDragStateCalled = true
        setDragStateState = newDragState
        setDragStateAnimated = animated

        if shouldForwardMethodCallWithSelector("setDragState:animated:") {
            super.setDragState(newDragState, animated: animated)
        }
    }

}


extension MKAnnotationView: ShimMethodForwarding {

    /*!
        The MKAnnotationView shim should not forward spied messages by default.
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
