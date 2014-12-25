//
//  MKUserLocation.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/25/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public class MKUserLocation: MapKit.MKUserLocation {

    /*!
        Exposed initializer.
    */
    public init(location: CLLocation, heading: CLHeading, updating: Bool) {
        super.init()
        self.location = location
        self.heading = heading
        self.updating = updating
    }

    /*!
        Mutable override of the `location` property.
    */
    public override var location: CLLocation {
        get {
            if locationOverride != nil {
                return locationOverride!
            }
            else {
                return super.location
            }
        }
        set {
            locationOverride = newValue
        }
    }

    /*!
        Mutable override of the `heading` property.
    */
    public override var heading: CLHeading {
        get {
            if headingOverride != nil {
                return headingOverride!
            }
            else {
                return super.heading
            }
        }
        set {
            headingOverride = newValue
        }
    }

    /*!
        Mutable override of the `updating` property.
    */
    public override var updating: Bool {
        get {
            if updatingOverride != nil {
                return updatingOverride!
            }
            else {
                return super.updating
            }
        }
        set {
            updatingOverride = newValue
        }
    }


    private var locationOverride: CLLocation?
    private var headingOverride: CLHeading?
    private var updatingOverride: Bool?

}
