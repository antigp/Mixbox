#if MIXBOX_ENABLE_IN_APP_SERVICES
import Foundation

public protocol RunLoopModesStackProvider: class {
    var runLoopModes: [CFRunLoopMode] { get }
}

extension RunLoopModesStackProvider {
    public var activeRunLoopMode: CFRunLoopMode? {
        return runLoopModes.first
    }
}

#endif
