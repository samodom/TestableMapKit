### Capturing calls to `MKMapView` methods

Each of the methods below have spy method equivalents that capture the calls to the method and any parameters, if available.  The properties listed below the method names list the new properties of `MKMapView` that you can use to validate method calls.


`setRegion:animated:` (you may need to clear these values before your test)
- `var setRegionCalled: Bool`
- `var setRegionRegion: MKCoordinateRegion?`
- `var setRegionAnimated: Bool?`

`setCenterCoordinate:animated:`
- `var setCenterCoordinateCalled: Bool`
- `var setCenterCoordinateCoordinate: CLLocationCoordinate2D?`
- `var setCenterCoordinateAnimated: Bool?`

`showAnnotations:animated:`
- `var showAnnotationsCalled: Bool`
- `var showAnnotationsAnnotations: [MKAnnotation]?`
- `var showAnnotationsAnimated: Bool?`

`setVisibleMapRect:animated:` and `setVisibleMapRect:edgePadding:animated:`
- `var setVisibleMapRectCalled: Bool`
- `var setVisibleMapRectRect: MKMapRect?`
- `var setVisibleMapRectPadding: UIEdgeInsets?`
- `var setVisibleMapRectAnimated: Bool?`

`setCamera:animated:`
- `var setCameraCalled: Bool`
- `var setCameraCamera: MKMapCamera?`
- `var setCameraAnimated: Bool?`

`setUserTrackingMode:animated:`
- `var setUserTrackingModeCalled: Bool`
- `var setUserTrackingModeMode: MKUserTrackingMode?`
- `var setUserTrackingModeAnimated: Bool?`

`selectAnnotation:animated:`
- `var selectAnnotationCalled: Bool`
- `var selectAnnotationAnnotation: MKAnnotation?`
- `var selectAnnotationAnimated: Bool?`

`deselectAnnotation:animated:`
- `var deselectAnnotationCalled: Bool`
- `var deselectAnnotationAnnotation: MKAnnotation?`
- `var deselectAnnotationAnimated: Bool?`


> After capturing the call to the method, these spies forward the call to the superclass (real) implementation.  If you would like for any of these spies to not forward the method call to the superclass implementation, simply insert the following call at the beginning of your test with an appropriate selector:
>
> `map.setShouldForwardMethodCallWithSelector("setCamera:animated:", false)`
>
> This can be reversed in your test at any time by another call to the same method with the value `true`.
