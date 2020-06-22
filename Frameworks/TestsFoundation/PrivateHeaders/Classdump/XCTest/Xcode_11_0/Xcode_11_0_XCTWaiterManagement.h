#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTest_CDStructures.h"

#import <Foundation/Foundation.h>

@protocol XCTWaiterManagement;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@protocol XCTWaiterManagement <NSObject>
@property(readonly, getter=isInProgress) _Bool inProgress;
- (void)interruptForWaiter:(id <XCTWaiterManagement>)arg1;
@end

#endif
