#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTest_CDStructures.h"
#if SWIFT_PACKAGE
#import "../../../Manual/XCTest/SharedHeader/Xcode_12_0_SharedHeader.h"
#else
#import "Xcode_12_0_SharedHeader.h"
#endif
#import <Foundation/Foundation.h>
#import <XCTest/XCUISiriService.h>

@protocol XCUIDevice, XCUIRemoteSiriInterface;

@class XCUIApplication;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCUISiriService ()
{
    XCUIApplication *_siriApplication;
    id <XCUIDevice> _device;
    id <XCUIRemoteSiriInterface> _remoteSiriInterface;
}

@property(readonly) id <XCUIRemoteSiriInterface> remoteSiriInterface; // @synthesize remoteSiriInterface=_remoteSiriInterface;
@property(readonly) id <XCUIDevice> device; // @synthesize device=_device;
@property(readonly) XCUIApplication *siriApplication; // @synthesize siriApplication=_siriApplication;
- (id)forwardingTargetForSelector:(SEL)arg1;
- (void)_waitForActivation;
- (void)_assertSiriEnabled;
- (unsigned long long)_expectedStateForActivate;
- (id)_siriBundleIdentifier;
- (_Bool)_usesLegacySiriViewService;
@property(readonly, getter=isEnabled) _Bool enabled;
- (void)injectVoiceRecognitionAudioInputPaths:(id)arg1;
- (void)injectAssistantRecognitionStrings:(id)arg1;

- (id)initWithDevice:(id)arg1 remoteSiriInterface:(id)arg2;

@end

#endif
