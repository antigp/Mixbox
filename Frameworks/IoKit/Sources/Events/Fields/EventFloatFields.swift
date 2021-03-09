#if MIXBOX_ENABLE_IN_APP_SERVICES
import MixboxIoKit_objc

public final class EventFloatFields {
    private let iohidEventRef: IOHIDEventRef
    
    public init(iohidEventRef: IOHIDEventRef) {
        self.iohidEventRef = iohidEventRef
    }
    
    public subscript(_ field: IOHIDEventField) -> Double {
        get {
            return Double(IOHIDEventGetFloatValue(iohidEventRef, field))
        }
        set {
            IOHIDEventSetFloatValue(iohidEventRef, field, Float(newValue))
        }
    }
}

#endif
