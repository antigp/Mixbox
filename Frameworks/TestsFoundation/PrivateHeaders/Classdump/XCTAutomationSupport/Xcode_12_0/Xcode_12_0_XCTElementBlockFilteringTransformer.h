#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTAutomationSupport_CDStructures.h"
#import "Xcode_12_0_SharedHeader.h"
#import "Xcode_12_0_XCTElementSetTransformer.h"
#import <Foundation/Foundation.h>

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTElementBlockFilteringTransformer : NSObject <XCTElementSetTransformer>
{
    _Bool stopsOnFirstMatch;
    NSString *transformationDescription;
    CDUnknownBlockType _filter;
}

+ (void)provideCapabilitiesToBuilder:(id)arg1;
@property(readonly, copy) CDUnknownBlockType filter; // @synthesize filter=_filter;
@property _Bool stopsOnFirstMatch; // @synthesize stopsOnFirstMatch;
@property(copy) NSString *transformationDescription; // @synthesize transformationDescription;
@property(readonly, copy) NSSet *elementTypes;
- (id)iteratorForInput:(id)arg1;
- (id)requiredKeyPathsOrError:(id *)arg1;
@property(readonly) _Bool supportsAttributeKeyPathAnalysis;
- (_Bool)canBeRemotelyEvaluatedWithCapabilities:(id)arg1;
- (id)transform:(id)arg1 relatedElements:(id *)arg2;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (id)initWithBlockFilter:(CDUnknownBlockType)arg1;

// Remaining properties

@end

#endif