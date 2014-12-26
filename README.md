TestableMapKit
==============

This is a framework that uses the same class names as some classes from MapKit and extends them using the fully qualified name of the real class.  This allows for a *shim* layer between your application code and MapKit **only while testing**.


### Method Spies

- `MKAnnotationView`
  - [Capturing instance calls](MKAnnotationViewCalls.md)


- `MKDirections`
  - [Capturing instance calls](MKDirectionsCalls.md)


- `MKLocalSearch`
  - [Capturing instance calls](MKLocalSearchCalls.md)


- `MKMapSnapshotter`
  - [Capturing instance calls](MKMapSnapshotterCalls.md)


- `MKMapView`
  - [Capturing instance calls](MKMapViewCalls.md)


- `MKOverlayRenderer`
  - [Capturing instance calls](MKOverlayRendererCalls.md)
  - `MKOverlayPathRenderer`
    - [Capturing instance calls](MKOverlayPathRendererCalls.md)
  - `MKTileOverlayRenderer`
    - [Capturing instance calls](MKTileOverlayRendererCalls.md)


- `MKTileOverlay`
  - [Capturing instance calls](MKTileOverlayCalls.md)



### Mutable Immutables

- `MKUserLocation`
