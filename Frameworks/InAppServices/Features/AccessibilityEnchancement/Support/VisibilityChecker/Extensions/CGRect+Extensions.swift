#if MIXBOX_ENABLE_IN_APP_SERVICES
import UIKit

extension CGRect {
    func mb_rounded() -> IntRect {
        return IntRect(
            origin: origin.rounded(),
            size: size.rounded()
        )
    }
}

#endif
