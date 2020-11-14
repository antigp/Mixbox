#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTest_CDStructures.h"
#import "Xcode_12_0_SharedHeader.h"
#import "Xcode_12_0_XCDebugLogDelegate.h"
#import "Xcode_12_0_XCTASDebugLogDelegate.h"
#import <Foundation/Foundation.h>

@protocol XCDebugLogDelegate;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTDefaultDebugLogHandler : NSObject <XCTASDebugLogDelegate, XCDebugLogDelegate>
{
    id <XCDebugLogDelegate> _logSink;
    NSMutableArray *_debugMessageBuffer;
    NSObject *_queue;
}

+ (instancetype)sharedHandler;
@property(readonly) NSObject *queue; // @synthesize queue=_queue;
@property(readonly) NSMutableArray *debugMessageBuffer; // @synthesize debugMessageBuffer=_debugMessageBuffer;
@property(retain) id <XCDebugLogDelegate> logSink; // @synthesize logSink=_logSink;
- (void)logDebugMessage:(id)arg1;
- (void)_queue_flushDebugMessageBufferWithBlock:(CDUnknownBlockType)arg1;
- (void)printBufferedDebugMessages;
- (void)logStartupInfo;
- (id)init;

// Remaining properties

@end

#endif