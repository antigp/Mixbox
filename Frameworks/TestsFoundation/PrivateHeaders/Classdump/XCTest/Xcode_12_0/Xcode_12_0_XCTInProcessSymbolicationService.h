#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTest_CDStructures.h"
#import "Xcode_12_0_SharedHeader.h"
#import "Xcode_12_0_XCTSymbolInfoProviding.h"
#import <Foundation/Foundation.h>

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTInProcessSymbolicationService : NSObject <XCTSymbolInfoProviding>
{
    // Error parsing type: {atomic_flag="_Value"AB}, name: _symbolicatorInitialized
    NSSet *_imageNames;
    struct _CSTypeRef _symbolicator;
    CDStruct_7da0dd4a _symbolicationFunctions;
}

+ (CDStruct_7da0dd4a)standardSymbolicationFunctions;
+ (void)registerSharedServiceWithConfiguration:(id)arg1;
+ (id)imageNamesFromEnvironmentVariables:(id)arg1;
// Error parsing type for property symbolicatorInitialized:
// Property attributes: T{atomic_flag=AB},R,V_symbolicatorInitialized

@property(readonly) struct _CSTypeRef symbolicator; // @synthesize symbolicator=_symbolicator;
@property(readonly) CDStruct_7da0dd4a symbolicationFunctions; // @synthesize symbolicationFunctions=_symbolicationFunctions;
@property(readonly, copy) NSSet *imageNames; // @synthesize imageNames=_imageNames;
- (void)_prepareForSymbolication;
- (id)symbolInfoForAddressInCurrentProcess:(unsigned long long)arg1 error:(id *)arg2;
- (id)initWithImageNames:(id)arg1;
- (id)initWithImageNames:(id)arg1 symbolicationFunctions:(CDStruct_7da0dd4a)arg2;

// Remaining properties

@end

#endif