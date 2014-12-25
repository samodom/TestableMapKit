//
//  SampleAnnotation.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

internal class SampleAnnotation: NSObject, MKAnnotation {

    internal var coordinate: CLLocationCoordinate2D
    internal var title: String

    internal init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
    }

}
