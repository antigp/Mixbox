#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTest_CDStructures.h"

#import <XCTest/XCUIApplication.h>
#import <XCTest/XCUIElement.h>

@protocol XCTRunnerAutomationSession, XCUIDevice;

@class XCAccessibilityElement, XCApplicationQuery, XCUIApplicationImpl, XCUIApplicationOpenRequest, XCUIElement;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCUIApplication ()
{
    _Bool _ancillary;
    _Bool _prefersPlatformLauncher;
    _Bool _doesNotHandleUIInterruptions;
    _Bool _allowBackgroundInteraction;
    _Bool _idleAnimationWaitEnabled;
    unsigned int _currentInteractionOptions;
    XCUIApplicationOpenRequest *_lastLaunchRequest;
    XCUIElement *_keyboard;
    NSArray *_launchArguments;
    NSDictionary *_launchEnvironment;
    XCApplicationQuery *_applicationQuery;
    unsigned long long _generation;
    XCUIApplicationImpl *_applicationImpl;
}

+ (id)keyPathsForValuesAffectingForeground;
+ (id)keyPathsForValuesAffectingBackground;
+ (id)keyPathsForValuesAffectingSuspended;
+ (id)keyPathsForValuesAffectingRunning;
+ (id)keyPathsForValuesAffectingState;
+ (id)keyPathsForValuesAffectingIsApplicationStateKnown;
+ (id)new;
@property(getter=isIdleAnimationWaitEnabled) _Bool idleAnimationWaitEnabled; // @synthesize idleAnimationWaitEnabled=_idleAnimationWaitEnabled;
@property _Bool allowBackgroundInteraction; // @synthesize allowBackgroundInteraction=_allowBackgroundInteraction;
@property(nonatomic) _Bool doesNotHandleUIInterruptions; // @synthesize doesNotHandleUIInterruptions=_doesNotHandleUIInterruptions;
@property _Bool prefersPlatformLauncher; // @synthesize prefersPlatformLauncher=_prefersPlatformLauncher;
@property(readonly) XCUIApplicationImpl *applicationImpl; // @synthesize applicationImpl=_applicationImpl;
@property _Bool ancillary; // @synthesize ancillary=_ancillary;
@property unsigned int currentInteractionOptions; // @synthesize currentInteractionOptions=_currentInteractionOptions;
@property unsigned long long generation; // @synthesize generation=_generation;
@property(retain) XCApplicationQuery *applicationQuery; // @synthesize applicationQuery=_applicationQuery;
@property(retain) XCUIApplicationOpenRequest *lastLaunchRequest; // @synthesize lastLaunchRequest=_lastLaunchRequest;
- (void)dismissKeyboard;
@property(readonly) XCUIElement *keyboard; // @synthesize keyboard=_keyboard;
- (_Bool)setFauxCollectionViewCellsEnabled:(_Bool)arg1 error:(id *)arg2;
@property(readonly) _Bool fauxCollectionViewCellsEnabled;
- (_Bool)_waitForViewControllerViewDidDisappearWithTimeout:(double)arg1 error:(id *)arg2;
@property(readonly, nonatomic) long long interfaceOrientation;
- (void)_waitForQuiescence;
@property(readonly) _Bool hasAutomationSession;
@property(readonly) _Bool backgroundInteractionAllowed;
@property(readonly) _Bool shouldSkipPostEventQuiescence;
@property(readonly) _Bool shouldSkipPreEventQuiescence;
- (void)_performWithInteractionOptions:(unsigned int)arg1 block:(CDUnknownBlockType)arg2;
- (void)terminate;
- (void)activate;
- (void)_launchUsingXcode:(_Bool)arg1;
- (void)launch;
- (id)_combinedLaunchEnvironment;
- (id)_combinedLaunchArguments;

@property(readonly) _Bool foreground;
@property(readonly) _Bool background;
@property(readonly) _Bool suspended;
@property(readonly) _Bool running;
@property(nonatomic) int processID;
- (_Bool)isApplicationStateKnown;
- (void)resetAlertCount;
@property(readonly) _Bool shouldBeCheckedForAlerts;
- (_Bool)exists;
- (id)currentProcess;
- (id)application;
@property(readonly) id <XCTRunnerAutomationSession> automationSession;
- (id)description;
- (id)query;
- (void)clearQuery;
- (_Bool)resolveOrRaiseTestFailure:(_Bool)arg1 error:(id *)arg2;
@property(readonly) XCAccessibilityElement *accessibilityElement;
- (unsigned long long)elementType;
@property(readonly) id <XCUIDevice> device;
@property(readonly) NSString *bundleID;
@property(readonly) NSString *path;
- (void)commonInitWithApplicationSpecifier:(id)arg1 device:(id)arg2;
- (id)initPrivateWithPath:(id)arg1 bundleID:(id)arg2;
- (id)initWithApplicationSpecifier:(id)arg1 device:(id)arg2;

- (id)init;
- (id)initWithElementQuery:(id)arg1;

@end

#endif
