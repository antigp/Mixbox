import MixboxTestsFoundation
import MixboxUiTestsFoundation
import MixboxIpc
import MixboxFoundation
import MixboxUiKit
import MixboxDi
import TestsIpc

final class TestCaseDependencies: DependencyCollectionRegisterer {
    func register(dependencyRegisterer di: DependencyRegisterer) {
        di.register(type: EnvironmentProvider.self) { _ in
            Singletons.environmentProvider
        }
        di.register(type: StepLogsProvider.self) { _ in
            Singletons.stepLogsProvider
        }
        di.register(type: StepLoggerRecordingStarter.self) { _ in
            Singletons.stepLoggerRecordingStarter
        }
        di.register(type: StepLogsCleaner.self) { _ in
            Singletons.stepLogsCleaner
        }
        di.register(type: FileLineForFailureProvider.self) { di in
            let identifierCharacterMask = "[a-zA-Z0-9_]"
            let identifier = "\(identifierCharacterMask)+?"
            let pathOfTwoOrMoreIdentifiers = "(\(identifier)\\.){2,}"
            
            return LastCallOfCurrentTestFileLineForFailureProvider(
                extendedStackTraceProvider: try di.resolve(),
                testSymbolPatterns: [
                    // Note: nested functions in test are ignored.
                    // Example: assert #1 (_: __C.CGRect, _: __C.CGRect, file: Swift.StaticString, line: Swift.UInt) -> () in UnitTests.CGRect_Rounding_Tests.test___mb_integralInside() -> ()
                    // Those functions are filtered my restricting regex to identifiers only
                    
                    // Example: TargetName.ClassName.test_withOptionalSuffix() -> ()
                    "^\(pathOfTwoOrMoreIdentifiers)test.*?\\(\\) -> \\(\\)",
                    
                    // Example: TargetName.ClassName.parametrizedTest_withOptionalSuffix(message: Swift.String) -> ()
                    //          BlackBoxUiTests.SwipeActionTouchesTests.(parametrizedTest___swipe___produces_expected_event in _54C65FCCFCCAFE9EE80FC2EC0649E42C)(swipeClosure: (MixboxUiTestsFoundation.ElementWithUi) -> (), startPoint: __C.CGPoint, endPointOffset: __C.CGVector) -> ()
                    "^\(pathOfTwoOrMoreIdentifiers)\\(?parametrizedTest.*? -> \\(\\)",
                    
                    // Example: closure #2 () -> () in TargetName.ClassName.(parametrizedTest in _FA5631F8141319A712430582B52492D9)(fooArg: Swift.String) -> ()
                    "\\(parametrizedTest in",
                    "\\(test in"
                ]
            )
        }
        di.register(type: PerformanceLogger.self) { _ in
            Singletons.performanceLogger
        }
    }
}
