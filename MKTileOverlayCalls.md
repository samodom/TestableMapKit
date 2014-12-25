### Capturing calls to `MKTileOverlay` methods

Each of the methods below have spy method equivalents that capture the calls to the method and any parameters, if available.  The properties listed below the method names list the new properties of `MKTileOverlay` that you can use to validate method calls.

`loadTileAtPath:result:`
- `var loadTileCalled: Bool`
- `var loadTilePath: MKTileOverlayPath?`
- `var loadTileResultHandler: MKTileOverlayTileLoadingResultHandler?`


> After capturing the call to the method, this spy DOES NOT forward the call to the superclass (real) implementation.  If you would like for the spy to forward the method call to the superclass implementation, simply insert the following call at the beginning of your test:
>
> `overlay.setShouldForwardMethodCallWithSelector("loadTileAtPath:result:", true)`
>
> This can be reversed in your test at any time by another call to the same method with the value `false`.
