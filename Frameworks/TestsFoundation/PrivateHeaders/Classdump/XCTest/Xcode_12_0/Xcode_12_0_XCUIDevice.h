#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTest_CDStructures.h"
#import "Xcode_12_0_SharedHeader.h"
#import <Foundation/Foundation.h>
#import <XCTest/XCUIDevice.h>

@protocol XCUIAccessibilityInterface, XCUIApplicationAutomationSessionProviding, XCUIApplicationManaging, XCUIApplicationMonitor, XCUIDeviceDiagnostics, XCUIDeviceEventAndStateInterface, XCUIEventSynthesizing, XCUIInterruptionMonitoring, XCUIResetAuthorizationStatusOfProtectedResourcesInterface, XCUIScreenDataSource, XCUIXcodeApplicationManaging;

@class XCUIRemote, XCUISiriService;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCUIDevice ()
{
    _Bool _isLocal;
    _Bool _isSimulatorDevice;
    long long _platform;
    id <XCUIAccessibilityInterface> _accessibilityInterface;
    id <XCUIApplicationMonitor> _applicationMonitor;
    id <XCUIEventSynthesizing> _eventSynthesizer;
    id <XCUIApplicationManaging> _platformApplicationManager;
    id <XCUIXcodeApplicationManaging> _xcodeApplicationManager;
    id <XCUIDeviceEventAndStateInterface> _deviceEventAndStateInterface;
    id <XCUIApplicationAutomationSessionProviding> _applicationAutomationSessionProvider;
    XCUISiriService *_siriService;
    id <XCUIScreenDataSource> _screenDataSource;
    NSString *_uniqueIdentifier;
    XCUIRemote *_remote;
    id <XCUIInterruptionMonitoring> _interruptionMonitor;
    id <XCUIResetAuthorizationStatusOfProtectedResourcesInterface> _resetAuthorizationStatusInterface;
    id <XCUIDeviceDiagnostics> _diagnosticsProvider;
}

+ (void)setLocalDevice:(id)arg1;
+ (id)localDevice;
- (id)diagnosticsProvider;
- (id)resetAuthorizationStatusInterface;
- (id)interruptionMonitor;
- (id)remote;
- (_Bool)isSimulatorDevice;
- (id)uniqueIdentifier;
- (id)screenDataSource;
- (id)applicationAutomationSessionProvider;
- (id)deviceEventAndStateInterface;
- (id)xcodeApplicationManager;
- (id)platformApplicationManager;
- (id)eventSynthesizer;
- (id)applicationMonitor;
- (id)accessibilityInterface;
- (long long)platform;
- (_Bool)isLocal;
- (void)remoteAutomationSessionDidDisconnect:(id)arg1;
- (void)attachLocalizableStringsData;
- (void)rotateDigitalCrown:(double)arg1 velocity:(double)arg2;
- (void)pressLockButton;
- (void)holdHomeButtonForDuration:(double)arg1;

- (void)_silentPressButton:(long long)arg1;
- (void)_setOrientation:(long long)arg1;
- (id)init;
- (id)description;
- (_Bool)isEqual:(id)arg1;
- (unsigned long long)hash;
- (id)spindumpAttachmentForProcessID:(int)arg1 error:(id *)arg2;
- (id)makeDiagnosticScreenshotAttachmentForDevice;
- (id)mainScreen;
- (id)screens;
- (id)mainScreenOrError:(id *)arg1;
- (id)screensOrError:(id *)arg1;
- (_Bool)supportsPressureInteraction;
- (_Bool)performDeviceEvent:(id)arg1 error:(id *)arg2;
- (_Bool)configuredForUITesting;
- (id)diagnosticAttachmentsForError:(id)arg1;
- (id)initWithDiagnosticProvider:(id)arg1;
- (id)initLocalDeviceWithPlatform:(long long)arg1;

@end

#endif