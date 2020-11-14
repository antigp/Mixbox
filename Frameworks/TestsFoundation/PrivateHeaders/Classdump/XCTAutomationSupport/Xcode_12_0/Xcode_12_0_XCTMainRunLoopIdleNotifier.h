#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTAutomationSupport_CDStructures.h"
#if SWIFT_PACKAGE
#import "../../../Manual/XCTest/SharedHeader/Xcode_12_0_SharedHeader.h"
#else
#import "Xcode_12_0_SharedHeader.h"
#endif
#import <Foundation/Foundation.h>

@class CFRunLoopObserver;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTMainRunLoopIdleNotifier : NSObject
{
    NSObject *_queue;
    NSMutableArray *_idleHandlers;
    struct __CFRunLoopObserver *_runLoopObserver;
}

@property struct __CFRunLoopObserver *runLoopObserver; // @synthesize runLoopObserver=_runLoopObserver;
@property(readonly) NSMutableArray *idleHandlers; // @synthesize idleHandlers=_idleHandlers;
@property(readonly) NSObject *queue; // @synthesize queue=_queue;
- (void)handleIdleObserved;
- (void)_queue_setUpRunLoopObserver;
- (void)notifyWhenIdle:(CDUnknownBlockType)arg1;
- (void)dealloc;
- (id)init;

@end

#endif
