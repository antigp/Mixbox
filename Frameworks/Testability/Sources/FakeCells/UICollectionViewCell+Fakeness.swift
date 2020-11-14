#if MIXBOX_ENABLE_IN_APP_SERVICES
import MixboxFoundation_objc
import MixboxFoundation
import Foundation
import UIKit
import MixboxUiKit

extension UICollectionViewCell {
    // Note: getting value for a real cell can cause resetting property (to nil).
    // This is due to a decision that observing fakeness will cost us more than resetting properties while getting them.
    public var mb_fakeCellInfo: FakeCellInfo? {
        get {
            resetFakenessOfCellIfNeeded()
            return objc_getAssociatedObject(self, &fakeCellInfo_associatedObjectKey) as? FakeCellInfo
        }
        set {
            objc_setAssociatedObject(
                self,
                &fakeCellInfo_associatedObjectKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
    
    private func resetFakenessOfCellIfNeeded() {
        if mb_isNotFakeCellDueToPresenceInViewHierarchy() {
            resetFakenessOfCell()
        }
    }
    
    public func mb_isNotFakeCellDueToPresenceInViewHierarchy() -> Bool {
        return superview != nil && _isHiddenForReuse() == false
    }
    
    private func resetFakenessOfCell() {
        mb_fakeCellInfo = nil
    }
}

private var fakeCellInfo_associatedObjectKey = "UICollectionViewCell_fakeCellInfo_928CE5104F8B"

#endif
