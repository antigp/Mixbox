#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTest_CDStructures.h"

#import <Foundation/Foundation.h>

@protocol XCUIDevice;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCUIApplicationImplDepot : NSObject
{
    NSMutableDictionary *_applicationImpls;
    id <XCUIDevice> _device;
}

@property(readonly) id <XCUIDevice> device; // @synthesize device=_device;
- (id)applicationImplForSpecifier:(id)arg1;
- (id)_canonicalSpecifierFromSpecifier:(id)arg1;
- (id)_identifierFromSpecifier:(id)arg1;
- (id)initWithDevice:(id)arg1;

@end

#endif
