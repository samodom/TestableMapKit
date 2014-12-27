//
//  SampleOverlay.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/26/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

/*!
    Sample class to use in testing map-related functionality.
*/
public class SampleOverlay: NSObject, MKOverlay {

    public let coordinate: CLLocationCoordinate2D
    public let boundingMapRect: MKMapRect

    /*!
        Allows specifying whether the sample object can replace map content.
    */
    public var shouldReplaceMapContent = false

    public init(coordinate: CLLocationCoordinate2D, boundingMapRect: MKMapRect) {
        self.coordinate = coordinate
        self.boundingMapRect = boundingMapRect
    }

    public func canReplaceMapContent() -> Bool {
        return shouldReplaceMapContent
    }

}
