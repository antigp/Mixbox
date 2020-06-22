#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTest_CDStructures.h"


#import <Foundation/Foundation.h>
#import <XCTest/XCUIElementQuery.h>
#import <XCTest/XCUIElementTypeQueryProvider.h>

@protocol XCTElementSetTransformer, XCTElementSnapshotAttributeDataSource;

@class XCElementSnapshot, XCUIApplication, XCUIElement, XCUIElementQuery;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCUIElementQuery ()
{
    _Bool _changesScope;
    _Bool _stopsOnFirstMatch;
    _Bool _modalViewPruningDisabled;
    XCUIElementQuery *_inputQuery;
    NSSet *_expressedTypes;
    NSArray *_expressedIdentifiers;
    NSOrderedSet *_lastInput;
    NSOrderedSet *_lastOutput;
    XCElementSnapshot *_rootElementSnapshot;
    NSString *_queryDescription;
    id <XCTElementSetTransformer> _transformer;
}

@property(retain) id <XCTElementSetTransformer> transformer; // @synthesize transformer=_transformer;
@property(readonly, copy) NSString *queryDescription; // @synthesize queryDescription=_queryDescription;
@property(retain) XCElementSnapshot *rootElementSnapshot; // @synthesize rootElementSnapshot=_rootElementSnapshot;
@property _Bool modalViewPruningDisabled; // @synthesize modalViewPruningDisabled=_modalViewPruningDisabled;
@property(copy) NSOrderedSet *lastOutput; // @synthesize lastOutput=_lastOutput;
@property(copy) NSOrderedSet *lastInput; // @synthesize lastInput=_lastInput;
@property(copy) NSArray *expressedIdentifiers; // @synthesize expressedIdentifiers=_expressedIdentifiers;
@property(copy) NSSet *expressedTypes; // @synthesize expressedTypes=_expressedTypes;
@property _Bool stopsOnFirstMatch; // @synthesize stopsOnFirstMatch=_stopsOnFirstMatch;
@property _Bool changesScope; // @synthesize changesScope=_changesScope;
@property(readonly) XCUIElementQuery *inputQuery; // @synthesize inputQuery=_inputQuery;
- (id)snapshotForElement:(id)arg1 attributes:(id)arg2 parameters:(id)arg3 timeoutControls:(id)arg4 error:(id *)arg5;
- (_Bool)_resolveRemoteElements:(id)arg1 inSnapshot:(id)arg2 query:(id)arg3 runtimeIssues:(id *)arg4 error:(id *)arg5;
- (id)elementSnapshotForDebugDescriptionWithNoMatchesMessage:(id *)arg1;
- (id)_matchingSnapshotsForLocallyEvaluatedQuery:(id)arg1 error:(id *)arg2;
- (id)_matchingSnapshotsForRemotelyEvaluatedQuery:(id)arg1 error:(id *)arg2;
- (id)_executeWithError:(id *)arg1;
- (id)allMatchingSnapshotsWithError:(id *)arg1;
- (id)uniqueMatchingSnapshotWithError:(id *)arg1;
@property(readonly) id <XCTElementSnapshotAttributeDataSource> elementSnapshotAttributeDataSource;
- (id)backingQueryWithError:(id *)arg1;
@property(readonly, copy) XCUIElementQuery *excludingNonModalElements;
@property(readonly, copy) XCUIElementQuery *includingNonModalElements;
- (id)_elementMatchingAccessibilityElementOfSnapshot:(id)arg1;
- (id)_descendantMatchingAccessibilityElement:(id)arg1;

- (id)elementWithPlaceholderValue:(id)arg1;
- (id)elementWithValue:(id)arg1;
- (id)elementWithIdentifier:(id)arg1;
- (id)elementWithLabel:(id)arg1;
- (id)elementWithTitle:(id)arg1;

- (id)_containingPredicate:(id)arg1 queryDescription:(id)arg2;

- (id)_predicateWithType:(unsigned long long)arg1 identifier:(id)arg2;
- (id)_queryWithPredicate:(id)arg1;
- (id)_queryWithPredicate:(id)arg1 description:(id)arg2;
- (id)sorted:(CDUnknownBlockType)arg1;
- (id)descending:(unsigned long long)arg1;
- (id)ascending:(unsigned long long)arg1;
- (id)filter:(CDUnknownBlockType)arg1;
- (id)_childrenMatchingTypes:(id)arg1;

- (id)_descendantsMatchingTypes:(id)arg1;

- (id)debugDescriptionWithSnapshot:(id)arg1;
- (id)_debugDescriptionWithIndent:(id *)arg1 rootElementSnapshot:(id)arg2;
@property(readonly, copy) NSString *elementDescription;
- (id)_derivedExpressedIdentifiers;
- (id)_derivedExpressedTypes;
@property(readonly) XCUIApplication *application;
- (id)initWithInputQuery:(id)arg1 queryDescription:(id)arg2 transformer:(id)arg3;
- (id)init;

// Remaining properties

@end

#endif
