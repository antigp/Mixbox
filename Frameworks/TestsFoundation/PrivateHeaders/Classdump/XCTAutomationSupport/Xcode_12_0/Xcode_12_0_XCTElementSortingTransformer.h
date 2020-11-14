#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTAutomationSupport_CDStructures.h"
#if SWIFT_PACKAGE
#import "../../../Manual/XCTest/SharedHeader/Xcode_12_0_SharedHeader.h"
#else
#import "Xcode_12_0_SharedHeader.h"
#endif
#import "Xcode_12_0_XCTCapabilitiesProviding.h"
#import "Xcode_12_0_XCTElementSetCodableTransformer.h"

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTElementSortingTransformer : XCTElementSetCodableTransformer <XCTCapabilitiesProviding>
{
    NSArray *_sortDescriptors;
}

+ (void)provideCapabilitiesToBuilder:(id)arg1;
+ (_Bool)supportsSecureCoding;
@property(readonly, copy) NSArray *sortDescriptors; // @synthesize sortDescriptors=_sortDescriptors;
- (id)iteratorForInput:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (id)requiredKeyPathsOrError:(id *)arg1;
- (_Bool)supportsAttributeKeyPathAnalysis;
- (_Bool)canBeRemotelyEvaluatedWithCapabilities:(id)arg1;
- (id)transform:(id)arg1 relatedElements:(id *)arg2;
- (_Bool)isEqual:(id)arg1;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (id)initWithSortDescriptors:(id)arg1;

// Remaining properties

@end

#endif
