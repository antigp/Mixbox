#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTAutomationSupport_CDStructures.h"
#import "Xcode_12_0_SharedHeader.h"
#import <Foundation/Foundation.h>

@class XCAccessibilityElement;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@protocol XCTAccessibilityFramework <NSObject>
@property(readonly) _Bool allowsRemoteAccess;
- (void)performWithAXTimeout:(double)arg1 block:(void (^)(void))arg2;
- (NSArray *)attributes:(NSArray *)arg1 forElement:(/* unknown type (const struct __AXUIElement) was removed in dump.py */ void *)arg2 error:(id *)arg3;
- (long long)appOrientationForElement:(/* unknown type (const struct __AXUIElement) was removed in dump.py */ void *)arg1 error:(id *)arg2;
- (struct CGRect)frameForElement:(/* unknown type (const struct __AXUIElement) was removed in dump.py */ void *)arg1 error:(id *)arg2;
- (/* unknown type (const struct __AXUIElement) was removed in dump.py */ void *)mainWindowForElement:(/* unknown type (const struct __AXUIElement) was removed in dump.py */ void *)arg1 error:(id *)arg2;
- (NSDictionary *)userTestingSnapshotForElement:(/* unknown type (const struct __AXUIElement) was removed in dump.py */ void *)arg1 options:(NSDictionary *)arg2 error:(id *)arg3;
- (NSDictionary *)attributesForElement:(XCAccessibilityElement *)arg1 attributes:(NSArray *)arg2 error:(id *)arg3;
@end

#endif
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTAutomationSupport_CDStructures.h"
#import "Xcode_12_0_SharedHeader.h"
#import "Xcode_12_0_XCTAccessibilityFramework.h"
#import <Foundation/Foundation.h>

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTAccessibilityFramework : NSObject <XCTAccessibilityFramework>
{
    _Bool _allowsRemoteAccess;
    int _processID;
    /* unknown type (struct __AXUIElement) was removed in dump.py */ void *_systemWideElement;
}

+ (void)initialize;
+ (void)_startAXServer;
@property /* unknown type (struct __AXUIElement) was removed in dump.py */ void *systemWideElement; // @synthesize systemWideElement=_systemWideElement;
@property(readonly) int processID; // @synthesize processID=_processID;
@property(readonly) _Bool allowsRemoteAccess; // @synthesize allowsRemoteAccess=_allowsRemoteAccess;
- (void)performWithAXTimeout:(double)arg1 block:(CDUnknownBlockType)arg2;
- (id)attributes:(id)arg1 forElement:(/* unknown type (struct __AXUIElement) was removed in dump.py */ void *)arg2 error:(id *)arg3;
- (long long)appOrientationForElement:(/* unknown type (struct __AXUIElement) was removed in dump.py */ void *)arg1 error:(id *)arg2;
- (struct CGRect)frameForElement:(/* unknown type (struct __AXUIElement) was removed in dump.py */ void *)arg1 error:(id *)arg2;
- (/* unknown type (const struct __AXUIElement) was removed in dump.py */ void *)mainWindowForElement:(/* unknown type (struct __AXUIElement) was removed in dump.py */ void *)arg1 error:(id *)arg2;
- (id)userTestingSnapshotForElement:(/* unknown type (struct __AXUIElement) was removed in dump.py */ void *)arg1 options:(id)arg2 error:(id *)arg3;
- (void)_setAXRequestingClient;
- (id)attributesForElement:(id)arg1 attributes:(id)arg2 error:(id *)arg3;
- (_Bool)_canAccessElement:(/* unknown type (struct __AXUIElement) was removed in dump.py */ void *)arg1 withError:(id *)arg2;
- (void)dealloc;
- (id)initForLocalAccess;
- (id)initForRemoteAccess;
- (id)initAllowingRemoteAccess:(_Bool)arg1 processID:(int)arg2;

// Remaining properties

@end

#endif