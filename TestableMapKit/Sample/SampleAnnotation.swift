//
//  SampleAnnotation.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

/*!
    Sample class to use in testing map-related functionality.
*/
public class SampleAnnotation: NSObject, MKAnnotation {

    public var coordinate: CLLocationCoordinate2D
    public var title: String
    public var subtitle: String

    public init(coordinate: CLLocationCoordinate2D, title: String = "", subtitle: String = "") {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }

}
