#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTAutomationSupport_CDStructures.h"
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

@interface XCAXCycleDetector : NSObject
{
    NSMutableOrderedSet *_elementStack;
}

+ (id)_cycleDescriptionForElementStack:(id)arg1;
@property(readonly) NSArray *currentElementPath;
- (id)_cycleDescriptionForElementWithCurrentStack:(id)arg1;
- (id)_cycleErrorForElement:(id)arg1;
- (void)untrackElement:(id)arg1;
- (_Bool)trackElement:(id)arg1 error:(id *)arg2;
- (id)init;

@end

#endif
