import MixboxDi
import MixboxUiTestsFoundation
import MixboxTestsFoundation
import MixboxInAppServices
import MixboxFoundation
import MixboxIpcCommon
import Foundation
import UIKit

public final class MixboxGrayDependencies: DependencyCollectionRegisterer {
    private let mixboxUiTestsFoundationDependencies: MixboxUiTestsFoundationDependencies
    
    public init(mixboxUiTestsFoundationDependencies: MixboxUiTestsFoundationDependencies) {
        self.mixboxUiTestsFoundationDependencies = mixboxUiTestsFoundationDependencies
    }
    
    // swiftlint:disable:next function_body_length
    public func register(dependencyRegisterer di: DependencyRegisterer) {
        mixboxUiTestsFoundationDependencies.register(dependencyRegisterer: di)
        
        di.register(type: ApplicationFrameProvider.self) { _ in
            GrayApplicationFrameProvider()
        }
        di.register(type: ApplicationWindowsProvider.self) { di in
            UiApplicationWindowsProvider(
                uiApplication: UIApplication.shared,
                iosVersionProvider: try di.resolve()
            )
        }
        di.register(type: OrderedWindowsProvider.self) { di in
            OrderedWindowsProviderImpl(
                applicationWindowsProvider: try di.resolve(),
                iosVersionProvider: try di.resolve()
            )
        }
        di.register(type: ScreenshotTaker.self) { di in
            GrayScreenshotTaker(
                orderedWindowsProvider: try di.resolve(),
                screen: UIScreen.main
            )
        }
        di.register(type: ElementFinder.self) { di in
            UiKitHierarchyElementFinder(
                ipcClient: try di.resolve(),
                testFailureRecorder: try di.resolve(),
                stepLogger: try di.resolve(),
                screenshotTaker: try di.resolve(),
                signpostActivityLogger: try di.resolve(),
                dateProvider: try di.resolve()
            )
        }
        di.register(type: ApplicationQuiescenceWaiter.self) { di in
            GrayApplicationQuiescenceWaiter(
                waiter: try di.resolve(),
                idlingResource: CompoundIdlingResource(
                    idlingResources: [
                        IdlingResourceObjectTracker.instance,
                        KeyboardIdlingResource()
                    ]
                )
            )
        }
        di.register(type: PageObjectDependenciesFactory.self) { di in
            GrayPageObjectDependenciesFactory(
                testFailureRecorder: try di.resolve(),
                ipcClient: try di.resolve(),
                stepLogger: try di.resolve(),
                pollingConfiguration: try di.resolve(),
                elementFinder: try di.resolve(),
                screenshotTaker: try di.resolve(),
                orderedWindowsProvider: try di.resolve(),
                waiter: try di.resolve(),
                signpostActivityLogger: try di.resolve(),
                snapshotsDifferenceAttachmentGenerator: try di.resolve(),
                snapshotsComparatorFactory: try di.resolve(),
                applicationQuiescenceWaiter: try di.resolve(),
                applicationWindowsProvider: try di.resolve(),
                multiTouchEventFactory: try di.resolve(),
                elementSettingsDefaultsProvider: try di.resolve(),
                keyboardEventInjector: try di.resolve()
            )
        }
        di.register(type: MultiTouchEventFactory.self) { _ in
            MultiTouchEventFactoryImpl(
                aggregatingTouchEventFactory: AggregatingTouchEventFactoryImpl(),
                fingerTouchEventFactory: FingerTouchEventFactoryImpl()
            )
        }
        
        // TODO: Use it.
        di.register(type: EventGenerator.self) { di in
            GrayEventGenerator(
                touchPerformer: try di.resolve(),
                pathGestureUtils: PathGestureUtilsFactoryImpl().pathGestureUtils()
            )
        }
        di.register(type: TouchPerformer.self) { di in
            TouchPerformerImpl(
                multiTouchCommandExecutor: try di.resolve()
            )
        }
        di.register(type: MultiTouchCommandExecutor.self) { di in
            MultiTouchCommandExecutorImpl(
                touchInjectorFactory: try di.resolve()
            )
        }
        di.register(type: TouchInjectorFactory.self) { di in
            TouchInjectorFactoryImpl(
                currentAbsoluteTimeProvider: try di.resolve(),
                runLoopSpinnerFactory: try di.resolve(),
                multiTouchEventFactory: try di.resolve()
            )
        }
        di.register(type: CurrentAbsoluteTimeProvider.self) { _ in
            MachCurrentAbsoluteTimeProvider()
        }
        // END OF TODO
    }
}
