#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTest_CDStructures.h"
#if SWIFT_PACKAGE
#import "../../../Manual/XCTest/SharedHeader/Xcode_12_0_SharedHeader.h"
#else
#import "Xcode_12_0_SharedHeader.h"
#endif
#import <Foundation/Foundation.h>

@class XCAccessibilityElement, XCElementSnapshot, XCTCapabilities, XCUIAccessibilityAction, XCUIElementSnapshotRequestResult;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@protocol XCUIRemoteAccessibilityInterface <NSObject>
@property(readonly) _Bool axNotificationsIncludeElement;
@property(readonly) _Bool useLegacySnapshotPath;
@property(readonly) XCTCapabilities *remoteInterfaceCapabilities;
- (void)setLocalizableStringsDataGatheringEnabled:(_Bool)arg1 reply:(void (^)(_Bool, NSError *))arg2;
- (void)enableFauxCollectionViewCells:(void (^)(_Bool, NSError *))arg1;
- (void)setAXTimeout:(double)arg1 reply:(void (^)(NSError *))arg2;
- (void)requestElementAtPoint:(struct CGPoint)arg1 reply:(void (^)(XCAccessibilityElement *, NSError *))arg2;
- (void)fetchParameterizedAttribute:(NSString *)arg1 forElement:(XCAccessibilityElement *)arg2 parameter:(id)arg3 reply:(void (^)(id, NSError *))arg4;
- (void)setAttribute:(NSString *)arg1 value:(id)arg2 element:(XCAccessibilityElement *)arg3 reply:(void (^)(_Bool, NSError *))arg4;
- (void)fetchAttributes:(NSArray *)arg1 forElement:(XCAccessibilityElement *)arg2 reply:(void (^)(NSDictionary *, NSError *))arg3;
- (void)fetchSnapshotForElement:(XCAccessibilityElement *)arg1 attributes:(NSArray *)arg2 parameters:(NSDictionary *)arg3 reply:(void (^)(XCUIElementSnapshotRequestResult *, NSError *))arg4;
- (void)requestSnapshotForElement:(XCAccessibilityElement *)arg1 attributes:(NSArray *)arg2 parameters:(NSDictionary *)arg3 reply:(void (^)(XCElementSnapshot *, NSError *))arg4;
- (void)snapshotForElement:(XCAccessibilityElement *)arg1 attributes:(NSArray *)arg2 parameters:(NSDictionary *)arg3 reply:(void (^)(XCElementSnapshot *, NSError *))arg4;
- (void)performAccessibilityAction:(XCUIAccessibilityAction *)arg1 onElement:(XCAccessibilityElement *)arg2 value:(id)arg3 reply:(void (^)(NSError *))arg4;
- (void)unregisterForAccessibilityNotification:(int)arg1 registrationToken:(NSNumber *)arg2 reply:(void (^)(NSError *))arg3;
- (void)registerForAccessibilityNotification:(int)arg1 reply:(void (^)(NSNumber *, NSError *))arg2;
- (void)loadAccessibilityWithTimeout:(double)arg1 reply:(void (^)(_Bool, NSError *))arg2;
@end

#endif
