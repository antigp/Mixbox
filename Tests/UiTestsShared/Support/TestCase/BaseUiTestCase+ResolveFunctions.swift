import MixboxTestsFoundation
import MixboxUiTestsFoundation
import MixboxIpc
import MixboxUiKit
import MixboxFoundation

// TODO: Replace everything with entities. There is no need for most of these functions.
// Resolving should ONLY be in factories/di containers. Not in clients' code.
//
// Example:
//
// private func logEnvironment() {
//     let device = UIDevice.mb_platformType.rawValue
//     let os = iosVersionProvider.iosVersion().majorAndMinor
//
//     stepLogger.logEntry(
//         date: dateProvider.currentDate(),
//         title: ...
//         attachments: ...
//     )
// }
//
// This code can be replaced with some EnvironmentLogger with injected dependencies.
//
// This file was created to separate really bad code from ordinary code.
//
extension BaseUiTestCase {
    var waiter: RunLoopSpinningWaiter {
        return dependencies.resolve()
    }
    
    var pageObjects: PageObjects {
        return dependencies.resolve()
    }
    
    var ipcClient: IpcClient {
        return dependencies.resolve()
    }
    
    var synchronousIpcClient: SynchronousIpcClient {
        return dependencies.resolve()
    }
    
    var legacyNetworking: LegacyNetworking {
        return dependencies.resolve()
    }
    
    var fileSystem: FileSystem {
        return dependencies.resolve()
    }
    
    var photoStubber: PhotoStubber {
        return dependencies.resolve()
    }
    
    var lazilyInitializedIpcClient: LazilyInitializedIpcClient {
       return dependencies.resolve()
    }

    var bundleResourcePathProviderForTestsTarget: BundleResourcePathProvider {
        return BundleResourcePathProviderImpl(
            bundle: Bundle(for: BaseUiTestCase.self)
        )
    }
    
    var applicationPermissionsSetterFactory: ApplicationPermissionsSetterFactory {
        return dependencies.resolve()
    }
}
