#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTest_CDStructures.h"

#import "Xcode_11_0_XCTTestScheduler.h"
#import <Foundation/Foundation.h>

@protocol XCTTestSchedulerDelegate;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTFixedPriorityTestScheduler : NSObject <XCTTestScheduler>
{
    NSObject *_queue;
    NSObject *_workerQueue;
    NSMutableArray *_undispatchedTestIdentifierGroups;
    NSSet *_testIdentifiersToSkip;
    NSMutableSet *_inFlightWorkers;
    CDUnknownBlockType _prioritizer;
    _Bool _hasStarted;
    NSMutableSet *_queuedWorkers;
    id <XCTTestSchedulerDelegate> _delegate;
    NSObject *_delegateQueue;
}

+ (CDUnknownBlockType)classBasedLPTPrioritizerForClassTimes:(id)arg1 fallbackExecutionOrdering:(long long)arg2;
@property(retain) NSObject *delegateQueue; // @synthesize delegateQueue=_delegateQueue;
@property __weak id <XCTTestSchedulerDelegate> delegate; // @synthesize delegate=_delegate;
@property(readonly) NSMutableSet *queuedWorkers; // @synthesize queuedWorkers=_queuedWorkers;
@property _Bool hasStarted; // @synthesize hasStarted=_hasStarted;
@property(readonly) CDUnknownBlockType prioritizer; // @synthesize prioritizer=_prioritizer;
@property(readonly) NSMutableSet *inFlightWorkers; // @synthesize inFlightWorkers=_inFlightWorkers;
@property(retain) NSSet *testIdentifiersToSkip; // @synthesize testIdentifiersToSkip=_testIdentifiersToSkip;
@property(retain) NSMutableArray *undispatchedTestIdentifierGroups; // @synthesize undispatchedTestIdentifierGroups=_undispatchedTestIdentifierGroups;
@property(retain) NSObject *workerQueue; // @synthesize workerQueue=_workerQueue;
@property(readonly) NSObject *queue; // @synthesize queue=_queue;
- (void)startWithTestIdentifiersToRun:(id)arg1 testIdentifiersToSkip:(id)arg2;
- (void)workerDidBecomeAvailable:(id)arg1;
- (void)_queue_dispatchWorkToWorker:(id)arg1;
- (id)_queue_nextBatchOfWork;
- (id)initWithPrioritizer:(CDUnknownBlockType)arg1;

@end

#endif
