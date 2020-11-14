#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTest_CDStructures.h"
#import "Xcode_12_0_SharedHeader.h"
#import "Xcode_12_0_XCTIssueHandling.h"
#import <XCTest/XCTActivity.h>
#import <XCTest/XCTWaiter.h>
#import <XCTest/XCTest.h>
#import <XCTest/XCTestCase.h>

@class Bool, MXMInstrument, XCTAttachmentManager, XCTIssue, XCTSkippedTestContext, XCTTestIdentifier, XCTWaiter, XCTestCaseRun;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTestCase ()
{
    _Bool _continueAfterFailure;
    _Bool __preciseTimeoutsEnabled;
    _Bool _isMeasuringMetrics;
    _Bool __didMeasureMetrics;
    _Bool __didStartMeasuring;
    _Bool __didStopMeasuring;
    _Bool _hasDequeuedTeardownBlocks;
    _Bool _hasReportedFailuresToTestCaseRun;
    _Bool _canHandleInterruptions;
    _Bool _shouldHaltWhenReceivesControl;
    _Bool _shouldSetShouldHaltWhenReceivesControl;
    _Bool _hasAttemptedToCaptureScreenshotOnFailure;
    NSInvocation *_invocation;
    double _executionTimeAllowance;
    NSArray *_activePerformanceMetricIDs;
    unsigned long long _startWallClockTime;
    struct time_value _startUserTime;
    struct time_value _startSystemTime;
    unsigned long long _measuringIteration;
    MXMInstrument *_instrument;
    long long _runLoopNestingCount;
    NSMutableArray *_teardownBlocks;
    NSMutableArray *_primaryThreadBlocks;
    XCTAttachmentManager *_attachmentManager;
    NSDictionary *_activityAggregateStatistics;
    NSObject<OS_dispatch_source> *_timeoutSource;
    unsigned long long _signpostID;
    NSThread *_primaryThread;
    XCTTestIdentifier *_identifier;
    NSMutableArray *_enqueuedIssues;
    NSMutableArray *_expectations;
    XCTWaiter *_currentWaiter;
    XCTSkippedTestContext *_skippedTestContext;
    XCTestCaseRun *_testCaseRun;
    NSMutableDictionary *__perfMetricsForID;
}

+ (_Bool)_reportPerformanceFailuresForLargeImprovements;
+ (_Bool)isInheritingTestCases;
+ (id)bundle;

+ (id)allTestMethodInvocations;
+ (void)_allTestMethodInvocations:(id)arg1;
+ (id)testMethodInvocations;
+ (id)allSubclassesOutsideXCTest;
+ (id)allSubclasses;
+ (id)_allSubclasses;
@property(retain) NSMutableDictionary *_perfMetricsForID; // @synthesize _perfMetricsForID=__perfMetricsForID;
@property(nonatomic) _Bool shouldSetShouldHaltWhenReceivesControl; // @synthesize shouldSetShouldHaltWhenReceivesControl=_shouldSetShouldHaltWhenReceivesControl;
@property(nonatomic) _Bool shouldHaltWhenReceivesControl; // @synthesize shouldHaltWhenReceivesControl=_shouldHaltWhenReceivesControl;
@property(retain) NSThread *primaryThread; // @synthesize primaryThread=_primaryThread;
@property(copy) NSDictionary *activityAggregateStatistics; // @synthesize activityAggregateStatistics=_activityAggregateStatistics;
@property long long runLoopNestingCount; // @synthesize runLoopNestingCount=_runLoopNestingCount;
@property _Bool _didStopMeasuring; // @synthesize _didStopMeasuring=__didStopMeasuring;
@property _Bool _didStartMeasuring; // @synthesize _didStartMeasuring=__didStartMeasuring;
@property _Bool _didMeasureMetrics; // @synthesize _didMeasureMetrics=__didMeasureMetrics;
@property(nonatomic) _Bool _preciseTimeoutsEnabled; // @synthesize _preciseTimeoutsEnabled=__preciseTimeoutsEnabled;
@property(readonly) double _effectiveExecutionTimeAllowance;
- (void)_resetTimer;
- (void)_stopTimeoutTimer;
- (void)_startTimeoutTimer;
- (void)_exceededExecutionTimeAllowance;
@property unsigned long long maxDurationInMinutes;
- (void)runActivityNamed:(id)arg1 inScope:(CDUnknownBlockType)arg2;
- (void)startActivityWithTitle:(id)arg1 block:(CDUnknownBlockType)arg2;
- (void)startActivityWithTitle:(id)arg1 type:(id)arg2 block:(CDUnknownBlockType)arg3;

- (id)baselinesDictionaryForTest;
- (void)_logAndReportPerformanceMetrics:(id)arg1 perfMetricResultsForIDs:(id)arg2 withBaselinesForTest:(id)arg3;
- (void)_logAndReportPerformanceMetrics:(id)arg1 perfMetricResultsForIDs:(id)arg2 withBaselinesForTest:(id)arg3 defaultBaselinesForPerfMetricID:(id)arg4;
- (void)registerMetricID:(id)arg1 name:(id)arg2 unitString:(id)arg3 polarity:(long long)arg4;
- (void)registerMetricID:(id)arg1 name:(id)arg2 unitString:(id)arg3;
- (void)registerMetricID:(id)arg1 name:(id)arg2 unit:(id)arg3;
- (void)reportMetric:(id)arg1 reportFailures:(_Bool)arg2;
- (void)reportMeasurements:(id)arg1 forMetricID:(id)arg2 reportFailures:(_Bool)arg3;
- (void)_recordValues:(id)arg1 forPerformanceMetricID:(id)arg2 name:(id)arg3 unitsOfMeasurement:(id)arg4 baselineName:(id)arg5 baselineAverage:(id)arg6 maxPercentRegression:(id)arg7 maxPercentRelativeStandardDeviation:(id)arg8 maxRegression:(id)arg9 maxStandardDeviation:(id)arg10 file:(id)arg11 line:(unsigned long long)arg12;

- (void)quiesceDidUpdate:(_Bool)arg1 error:(id)arg2;
@property(readonly) CDStruct_2ec95fd7 minimumOperatingSystemVersion;
- (void)_logMemoryGraphDataFromFilePath:(id)arg1 withTitle:(id)arg2;
- (void)_logMemoryGraphData:(id)arg1 withTitle:(id)arg2;
- (unsigned long long)numberOfTestIterationsForTestWithSelector:(SEL)arg1;
- (id)addAdditionalIterationsBasedOnOptions:(id)arg1;
- (void)afterTestIteration:(unsigned long long)arg1 selector:(SEL)arg2;
- (void)beforeTestIteration:(unsigned long long)arg1 selector:(SEL)arg2;
- (void)tearDownTestWithSelector:(SEL)arg1;
- (void)setUpTestWithSelector:(SEL)arg1;
- (void)_addTeardownBlock:(CDUnknownBlockType)arg1;

- (void)_purgeTeardownBlocks;
- (void)_reportFailuresAtFile:(id)arg1 line:(unsigned long long)arg2 forTestAssertionsInScope:(CDUnknownBlockType)arg3;
- (Class)_requiredTestRunBaseClass;

- (void)dealloc;
- (_Bool)isEqual:(id)arg1;
- (long long)defaultExecutionOrderCompare:(id)arg1;
- (id)nameForLegacyLogging;
- (id)languageAgnosticTestMethodName;
- (unsigned long long)testCaseCount;
- (id)bundle;

- (id)_expectationForDistributedNotification:(id)arg1 object:(id)arg2 handler:(CDUnknownBlockType)arg3;
- (id)_expectationForDarwinNotification:(id)arg1;

- (void)_interruptOrMarkForLaterInterruption;
- (_Bool)_caughtUnhandledDeveloperExceptionPermittingControlFlowInterruptions:(_Bool)arg1 caughtInterruptionException:(_Bool *)arg2 whileExecutingBlock:(CDUnknownBlockType)arg3;
- (_Bool)_caughtUnhandledDeveloperExceptionPermittingControlFlowInterruptions:(_Bool)arg1 whileExecutingBlock:(CDUnknownBlockType)arg2;
- (id)_issueWithFailureScreenshotAttachedToIssue:(id)arg1;
- (void)_handleIssue:(id)arg1;
- (void)_dequeueIssues;
- (void)_enqueueIssue:(id)arg1;
- (void)_recordIssue:(id)arg1;
@property(copy) XCTIssue *candidateIssueForCurrentThread;
- (id)_storageKeyForCandidateIssue;
- (void)handleIssue:(id)arg1;

// Remaining properties

@end

#endif