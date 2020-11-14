#if MIXBOX_ENABLE_IN_APP_SERVICES

import UIKit
import CommonCrypto

// For use in NSObject+TestabilityElement.m
//
// This class allows to use Swift implementation in Objective-C code.
//
// Unfortunately, it should be public.
//
// TODO: Use `UIAccessibilityTraits` to determine element type.
//
public final class NSObjectTestabilityElementSwiftImplementation: NSObject {
    private let nsObject: NSObject
    
    @objc public init(nsObject: NSObject) {
        self.nsObject = nsObject
    }
    
    @objc override public func mb_testability_accessibilityIdentifier() -> String? {
        return (nsObject as? UIAccessibilityIdentification)?.accessibilityIdentifier
    }
    
    @objc override public func mb_testability_accessibilityLabel() -> String? {
        return nsObject.accessibilityLabel
    }
    
    @objc override public func mb_testability_accessibilityPlaceholderValue() -> String? {
        if nsObject.responds(to: #selector(accessibilityPlaceholderValue)) {
            return nsObject.accessibilityPlaceholderValue() as? String
        } else {
            return nil
        }
    }
    
    @objc override public func mb_testability_accessibilityValue() -> String? {
        return nsObject.accessibilityValue
    }
    
    @objc override public func mb_testability_parent() -> TestabilityElement? {
        return DefaultTestabilityElementValues.parent
    }
    
    @objc override public func mb_testability_children() -> [TestabilityElement] {
        let accessibilityElements = self.accessibilityElements ?? []
        
        return accessibilityElements.map {
            TestabilityElementFromAnyConverter.testabilityElement(anyElement: $0)
        }
    }
    
    @objc override public func mb_testability_customClass() -> String {
        return String(describing: type(of: nsObject))
    }
    
    @objc override public func mb_testability_elementType() -> TestabilityElementType {
        return DefaultTestabilityElementValues.elementType
    }
    
    @objc override public func mb_testability_frame() -> CGRect {
        return DefaultTestabilityElementValues.frame
    }
    
    @objc override public func mb_testability_frameRelativeToScreen() -> CGRect {
        return DefaultTestabilityElementValues.frameRelativeToScreen
    }
    
    @objc override public func mb_testability_hasKeyboardFocus() -> Bool {
        return DefaultTestabilityElementValues.hasKeyboardFocus
    }
    
    @objc override public func mb_testability_isDefinitelyHidden() -> Bool {
        return DefaultTestabilityElementValues.isDefinitelyHidden
    }
    
    @objc override public func mb_testability_isEnabled() -> Bool {
        return DefaultTestabilityElementValues.isEnabled
    }
    
    @objc override public func mb_testability_text() -> String? {
        return DefaultTestabilityElementValues.text
    }
    
    @objc override public func mb_testability_uniqueIdentifier() -> String {
        let value = objc_getAssociatedObject(
            nsObject,
            &mb_testability_uniqueIdentifier_associatedValueKey
        )
        
        if let uniqueIdentifier = value as? String {
            return uniqueIdentifier
        } else {
            let newValue = UUID().uuidString
            objc_setAssociatedObject(
                nsObject,
                &mb_testability_uniqueIdentifier_associatedValueKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
            return newValue
        }
    }
}

private var mb_testability_uniqueIdentifier_associatedValueKey = 0

#endif
