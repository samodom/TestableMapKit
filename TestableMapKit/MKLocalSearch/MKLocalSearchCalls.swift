//
//  MKLocalSearchCalls.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public extension MKLocalSearch {

    public override func startWithCompletionHandler(completionHandler: MKLocalSearchCompletionHandler!) {
        startCalled = true
        startCompletionHandler = completionHandler

        if shouldForwardMethodCallWithSelector("startWithCompletionHandler:") {
            super.startWithCompletionHandler(completionHandler)
        }
    }

    public override func cancel() {
        cancelCalled = true

        if shouldForwardMethodCallWithSelector("cancel") {
            super.cancel()
        }
    }

}


extension MKLocalSearch: ShimMethodForwarding {

    /*!
        The MKLocalSearch shim should not forward spied messages by default.
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
