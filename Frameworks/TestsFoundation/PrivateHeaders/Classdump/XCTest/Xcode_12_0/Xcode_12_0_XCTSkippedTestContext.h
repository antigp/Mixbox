#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 150000

#import "Xcode_12_0_XCTest_CDStructures.h"
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

@interface XCTSkippedTestContext : NSObject
{
    NSString *_summary;
    NSString *_explanation;
    NSString *_evaluatedExpression;
    NSString *_message;
    NSString *_filePath;
    unsigned long long _lineNumber;
}

@property(readonly) unsigned long long lineNumber; // @synthesize lineNumber=_lineNumber;
@property(readonly, copy) NSString *filePath; // @synthesize filePath=_filePath;
@property(readonly, copy) NSString *message; // @synthesize message=_message;
@property(readonly, copy) NSString *evaluatedExpression; // @synthesize evaluatedExpression=_evaluatedExpression;
@property(readonly, copy) NSString *explanation; // @synthesize explanation=_explanation;
@property(readonly, copy) NSString *summary; // @synthesize summary=_summary;
- (id)initWithError:(id)arg1 evaluatedExpression:(id)arg2 message:(id)arg3 filePath:(id)arg4 lineNumber:(unsigned long long)arg5;
- (id)initWithException:(id)arg1 evaluatedExpression:(id)arg2 message:(id)arg3 filePath:(id)arg4 lineNumber:(unsigned long long)arg5;
- (id)initWithExpectedValue:(_Bool)arg1 evaluatedExpression:(id)arg2 message:(id)arg3 filePath:(id)arg4 lineNumber:(unsigned long long)arg5;
- (id)initWithExplanation:(id)arg1 evaluatedExpression:(id)arg2 message:(id)arg3 filePath:(id)arg4 lineNumber:(unsigned long long)arg5;

@end

#endif
