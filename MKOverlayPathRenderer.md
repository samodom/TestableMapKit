### Capturing calls to `MKOverlayPathRenderer` methods

Each of the methods below have spy method equivalents that capture the calls to the method and any parameters, if available.  The properties listed below the method names list the new properties of `MKOverlayPathRenderer` that you can use to validate method calls.

`invalidate`
- `var invalidateCalled: Bool`


> After capturing the call to the method, these spies forward the call to the superclass (real) implementation.  If you would like for any of these spies to not forward the method call to the superclass implementation, simply insert the following call at the beginning of your test with an appropriate selector:
>
> `renderer.setShouldForwardMethodCallWithSelector("invalidate", false)`
>
> This can be reversed in your test at any time by another call to the same method with the value `true`.
