#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTest_CDStructures.h"
#if SWIFT_PACKAGE
#import "../../../Manual/XCTest/SharedHeader/Xcode_12_0_SharedHeader.h"
#else
#import "Xcode_12_0_SharedHeader.h"
#endif
#import <Foundation/Foundation.h>

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface NSError (XCTFuture)
+ (id)_xcui_errorWithDomain:(id)arg1 code:(long long)arg2 userInfo:(id)arg3 description:(id)arg4 arguments:(struct __va_list_tag [1])arg5;
+ (id)_xcui_errorWithDomain:(id)arg1 code:(long long)arg2 description:(id)arg3;
+ (id)_xcui_error:(long long)arg1 userInfo:(id)arg2 description:(id)arg3;
+ (id)_xcui_error:(long long)arg1 description:(id)arg2;
@property(readonly) _Bool xct_isFutureTimeout;
@property(readonly) _Bool xct_isFutureCancelation;
@property(readonly) _Bool xcui_isRemoteElementSnapshotError;
@property(readonly) _Bool xcui_isApplicationNotRunningError;
- (_Bool)xcui_isUITestingError:(long long)arg1;
@property(readonly) _Bool xct_shouldBeRecordedAsTestFailure;
@end

#endif
