//
//  Equatability.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

extension CLLocationCoordinate2D: Equatable {

}

public func ==(coordinate1: CLLocationCoordinate2D, coordinate2: CLLocationCoordinate2D) -> Bool {
    return coordinate1.latitude == coordinate2.latitude && coordinate1.longitude == coordinate2.longitude
}


extension MKCoordinateSpan: Equatable {

}

public func ==(span1: MKCoordinateSpan, span2: MKCoordinateSpan) -> Bool {
    return span1.latitudeDelta == span2.latitudeDelta && span1.longitudeDelta == span2.longitudeDelta
}


extension MKCoordinateRegion: Equatable {

}

public func ==(region1: MKCoordinateRegion, region2: MKCoordinateRegion) -> Bool {
    return region1.center == region2.center && region1.span == region2.span
}


extension MKMapPoint: Equatable {

}

public func ==(point1: MKMapPoint, point2: MKMapPoint) -> Bool {
    return point1.x == point2.x && point1.y == point2.y
}


extension MKMapSize: Equatable {

}

public func ==(size1: MKMapSize, size2: MKMapSize) -> Bool {
    return size1.width == size2.width && size1.height == size2.height
}


extension MKMapRect: Equatable {

}

public func ==(rect1: MKMapRect, rect2: MKMapRect) -> Bool {
    return rect1.origin == rect2.origin && rect1.size == rect2.size
}


extension UIEdgeInsets: Equatable {

}

public func ==(insets1: UIEdgeInsets, insets2: UIEdgeInsets) -> Bool {
    return insets1.top == insets2.top &&
        insets1.left == insets2.left &&
        insets1.bottom == insets2.bottom &&
        insets1.right == insets2.right
}
