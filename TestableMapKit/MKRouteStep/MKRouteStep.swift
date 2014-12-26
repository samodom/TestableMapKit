//
//  MKRouteStep.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/26/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit

public class MKRouteStep: MapKit.MKRouteStep {

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
        Mutable override of `instructions` property.
    */
    public override var instructions: String! {
        get {
            if instructionsOverride != nil {
                return instructionsOverride!
            }
            else {
                return super.instructions
            }
        }
        set {
            instructionsOverride = newValue
        }
    }

    /*!
        Mutable override of `notice` property.
    */
    public override var notice: String! {
        get {
            if noticeOverride != nil {
                return noticeOverride!
            }
            else {
                return super.notice
            }
        }
        set {
            noticeOverride = newValue
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
    private var instructionsOverride: String?
    private var noticeOverride: String?
    private var distanceOverride: CLLocationDistance?
    private var transportTypeOverride: MKDirectionsTransportType?

}
