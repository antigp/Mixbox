#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTAutomationSupport_CDStructures.h"
#import "Xcode_12_0_SharedHeader.h"
#import "Xcode_12_0_XCTMatchingElementIterator.h"

@class XCTElementContainingTransformer;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

__attribute__((visibility("hidden")))
@interface XCTContainingTransformerIterator : XCTMatchingElementIterator
{
    _Bool _hasCheckedInput;
    XCTElementContainingTransformer *_containingTransformer;
}

@property(readonly) XCTElementContainingTransformer *containingTransformer; // @synthesize containingTransformer=_containingTransformer;
- (id)nextMatch;
- (id)initWithInput:(id)arg1 containingTransformer:(id)arg2;

@end

#endif