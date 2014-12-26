//
//  MKMapSnapshotterCallsTests.swift
//  TestableMapKit
//
//  Created by Sam Odom on 12/26/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import MapKit
import XCTest

class MKMapSnapshotterCallsTests: XCTestCase {

    let snapshotter = MKMapSnapshotter()
    var handlerCalled = false
    var handler: MKMapSnapshotCompletionHandler!
    let queue = dispatch_queue_create("test queue", DISPATCH_QUEUE_CONCURRENT)

    override func setUp() {
        super.setUp()

        handler = { _, _ in
            self.handlerCalled = true
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShimMethodForwarding() {
        XCTAssertFalse(snapshotter.shouldForwardByDefault, "This shim should not forward methods by default")
        XCTAssertFalse(snapshotter.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded by default")
        snapshotter.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(snapshotter.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded")
        snapshotter.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(snapshotter.shouldForwardMethodCallWithSelector("someSelector"), "The method should no longer be forwarded")
    }

    func testStartCall() {
        XCTAssertFalse(snapshotter.startCalled, "The snapshotter should not indicate having had start called by default")
        XCTAssertTrue(snapshotter.startCompletionHandler == nil, "The completion handler should be missing by default")
        snapshotter.startWithCompletionHandler(handler)
        XCTAssertTrue(snapshotter.startCalled, "The snapshotter should now indicate having had start called")
        XCTAssertTrue(snapshotter.startCompletionHandler != nil, "The completion handler should be captured")
        XCTAssertFalse(handlerCalled, "The handler should not have been called")
        snapshotter.startCompletionHandler!(nil, nil)
        XCTAssertTrue(handlerCalled, "The handler should be captured")
    }

    func testStartWithQueueCall() {
        XCTAssertFalse(snapshotter.startCalled, "The snapshotter should not indicate having had start called by default")
        XCTAssertTrue(snapshotter.startCompletionHandler == nil, "The completion handler should be missing by default")
        XCTAssertNil(snapshotter.startQueue, "The dispatch queue should be missing by default")
        snapshotter.startWithQueue(queue, completionHandler: handler)
        XCTAssertTrue(snapshotter.startCalled, "The snapshotter should now indicate having had start called")
        XCTAssertEqual(snapshotter.startQueue!, queue, "The dispatch queue should captured")
        XCTAssertTrue(snapshotter.startCompletionHandler != nil, "The completion handler should be captured")
        XCTAssertFalse(handlerCalled, "The handler should not have been called")
        snapshotter.startCompletionHandler!(nil, nil)
        XCTAssertTrue(handlerCalled, "The handler should be captured")
    }

    func testCancelCall() {
        XCTAssertFalse(snapshotter.cancelCalled, "The snapshotter should not indicate having had cancel called by default")
        snapshotter.cancel()
        XCTAssertTrue(snapshotter.cancelCalled, "The snapshotter should now indicate having had cancel called")
    }

}
