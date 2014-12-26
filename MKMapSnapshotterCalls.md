### Capturing calls to `MKMapSnapshotter` methods

Each of the methods below have spy method equivalents that capture the calls to the method and any parameters, if available.  The properties listed below the method names list the new properties of `MKMapSnapshotter` that you can use to validate method calls.



`startWithCompletionHandler:` and `startWithQueue:completionHandler:`
- `var startCalled: Bool`
- `var startCompletionHandler: MKMapSnapshotCompletionHandler?`
- `var startQueue: dispatch_queue_t?`


`cancel`
- `var cancelCalled: Bool`


> After capturing the call to the method, these spies DO NOT forward the call to the superclass (real) implementation.  If you would like for any of these spies to forward the method call to the superclass implementation, simply insert the following call at the beginning of your test with an appropriate selector:
>
> `snapshotter.setShouldForwardMethodCallWithSelector("startWithCompletionHandler:", true)`
>
> This can be reversed in your test at any time by another call to the same method with the value `false`.
