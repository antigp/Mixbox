#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTAutomationSupport_CDStructures.h"

#import "Xcode_11_0_XCTCapabilitiesProviding.h"
#import "Xcode_11_0_XCTRuntimeIssueContextReportingDelegate.h"
#import <Foundation/Foundation.h>

@class XCElementSnapshot;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCUIElementSnapshotRequestResult : NSObject <NSSecureCoding, XCTCapabilitiesProviding, XCTRuntimeIssueContextReportingDelegate>
{
    XCElementSnapshot *_rootElementSnapshot;
    NSOrderedSet *_runtimeIssues;
}

+ (_Bool)supportsSecureCoding;
+ (_Bool)shouldRuntimeIssueContext:(id)arg1 reportIssue:(id)arg2;
+ (void)provideCapabilitiesToBuilder:(id)arg1;
@property(readonly, copy) NSOrderedSet *runtimeIssues; // @synthesize runtimeIssues=_runtimeIssues;
@property(readonly) XCElementSnapshot *rootElementSnapshot; // @synthesize rootElementSnapshot=_rootElementSnapshot;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (id)initWithRootElementSnapshot:(id)arg1 runtimeIssues:(id)arg2;

// Remaining properties

@end

#endif
