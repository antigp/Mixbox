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

@protocol XCUIScreenDataSource <NSObject>
- (void)requestScreenshotOfScreenWithID:(long long)arg1 withRect:(struct CGRect)arg2 scale:(double)arg3 formatUTI:(NSString *)arg4 compressionQuality:(double)arg5 withReply:(void (^)(NSData *, NSError *))arg6;
- (void)requestScaleForScreenWithIdentifier:(long long)arg1 completion:(void (^)(double, NSError *))arg2;
- (void)requestScreenIdentifiersWithCompletion:(void (^)(NSArray *, NSError *))arg1;
@end

#endif
