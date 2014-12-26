//
//  MKRoute.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/26/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public class MKRoute: MapKit.MKRoute {

    /*!
        Mutable override of `polyline` property.
    */
    public override var polyline: MKPolyline! {
        get {
            if polylineOverride != nil {
                return polylineOverride!
            }
            else {
                return super.polyline
            }
        }
        set {
            polylineOverride = newValue
        }
    }

    /*!
        Mutable override of `steps` property.
    */
    public override var steps: [AnyObject]! {
        get {
            if stepsOverride != nil {
                return stepsOverride!
            }
            else {
                return super.steps
            }
        }
        set {
            stepsOverride = newValue as? [MKRouteStep]
        }
    }

    /*!
        Mutable override of `name` property.
    */
    public override var name: String! {
        get {
            if nameOverride != nil {
                return nameOverride!
            }
            else {
                return super.name
            }
        }
        set {
            nameOverride = newValue
        }
    }

    /*!
        Mutable override of `advisoryNotices` property.
    */
    public override var advisoryNotices: [AnyObject]! {
        get {
            if advisoryNoticesOverride != nil {
                return advisoryNoticesOverride!
            }
            else {
                return super.advisoryNotices
            }
        }
        set {
            advisoryNoticesOverride = newValue as? [String]
        }
    }

    /*!
        Mutable override of `distance` property.
    */
    public override var distance: CLLocationDistance {
        get {
            if distanceOverride != nil {
                return distanceOverride!
            }
            else {
                return super.distance
            }
        }
        set {
            distanceOverride = newValue
        }
    }

    /*!
        Mutable override of `expectedTravelTime` property.
    */
    public override var expectedTravelTime: NSTimeInterval {
        get {
            if expectedTravelTimeOverride != nil {
                return expectedTravelTimeOverride!
            }
            else {
                return super.expectedTravelTime
            }
        }
        set {
            expectedTravelTimeOverride = newValue
        }
    }

    /*!
        Mutable override of `transportType` property.
    */
    public override var transportType: MKDirectionsTransportType {
        get {
            if transportTypeOverride != nil {
                return transportTypeOverride!
            }
            else {
                return super.transportType
            }
        }
        set {
            transportTypeOverride = newValue
        }
    }


    private var polylineOverride: MKPolyline?
    private var stepsOverride: [MKRouteStep]?
    private var nameOverride: String?
    private var advisoryNoticesOverride: [String]?
    private var distanceOverride: CLLocationDistance?
    private var expectedTravelTimeOverride: NSTimeInterval?
    private var transportTypeOverride: MKDirectionsTransportType?

}
