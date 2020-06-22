#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTest_CDStructures.h"
#import <Foundation/Foundation.h>

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCSymbolicationRecord : NSObject
{
    unsigned long long _lineNumber;
    NSString *_filePath;
    NSString *_symbolName;
    NSString *_symbolOwner;
}

+ (id)symbolicationRecordForAddress:(unsigned long long)arg1;
+ (struct _CSTypeRef)symbolicator;
+ (id)failureRecord;
@property(readonly, copy) NSString *symbolOwner; // @synthesize symbolOwner=_symbolOwner;
@property(readonly, copy) NSString *symbolName; // @synthesize symbolName=_symbolName;
@property(readonly, copy) NSString *filePath; // @synthesize filePath=_filePath;
@property(readonly) unsigned long long lineNumber; // @synthesize lineNumber=_lineNumber;
- (id)description;
- (id)initWithFilePath:(id)arg1 lineNumber:(unsigned long long)arg2 symbolName:(id)arg3 symbolOwner:(id)arg4;

@end

#endif
