### Capturing calls to `MKDirections` methods

Each of the methods below have spy method equivalents that capture the calls to the method and any parameters, if available.  The properties listed below the method names list the new properties of `MKDirections` that you can use to validate method calls.

`calculateDirectionsWithCompletionHandler:`
- `var calculateDirectionsCalled: Bool`
- `var calculateDirectionsCompletionHandler: MKDirectionsHandler?`


`calculateETAWithCompletionHandler:`
- `var calculateETACalled: Bool`
- `var calculateETACompletionHandler: MKETAHandler?`


`cancel`
- `var cancelCalled: Bool`


> After capturing the call to the method, these spies DO NOT forward the call to the superclass (real) implementation.  If you would like for any of these spies to forward the method call to the superclass implementation, simply insert the following call at the beginning of your test with an appropriate selector:
>
> `directions.setShouldForwardMethodCallWithSelector("calculateDirectionsWithCompletionHandler:", true)`
>
> This can be reversed in your test at any time by another call to the same method with the value `false`.
