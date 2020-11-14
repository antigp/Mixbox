import MixboxIpc
import TestsIpc
import MixboxInAppServices
import UIKit

final class SetScreenIpcMethodHandler: IpcMethodHandler {
    typealias Method = SetScreenIpcMethod
    
    let method = Method()
    
    private weak var ipcMethodHandlerWithDependenciesRegisterer: IpcMethodHandlerWithDependenciesRegisterer?
    private let rootViewControllerManager: RootViewControllerManager
    
    init(
        ipcMethodHandlerWithDependenciesRegisterer: IpcMethodHandlerWithDependenciesRegisterer?,
        rootViewControllerManager: RootViewControllerManager)
    {
        self.ipcMethodHandlerWithDependenciesRegisterer = ipcMethodHandlerWithDependenciesRegisterer
        self.rootViewControllerManager = rootViewControllerManager
    }
    
    func handle(
        arguments: Method.Arguments,
        completion: @escaping (Method.ReturnValue) -> ())
    {
        DispatchQueue.main.async {
            self.setScreen(arguments) {
                completion(IpcVoid())
            }
        }
    }
    
    private func setScreen(_ screen: SetScreenIpcMethod.Screen?, completion: @escaping () -> ()) {
        rootViewControllerManager.set(
            rootViewController: screen.map { rootViewController(screen: $0) },
            completion: completion
        )
    }
    
    private func rootViewController(screen: SetScreenIpcMethod.Screen) -> UIViewController {
        return TestingViewFactory().rootViewController(
            viewType: screen.viewType,
            ipcMethodHandlerWithDependenciesRegisterer: ipcMethodHandlerWithDependenciesRegisterer
        )
    }
}
