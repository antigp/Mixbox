#if MIXBOX_ENABLE_IN_APP_SERVICES
import UIKit

public protocol InAppScreenshotTaker {
     func takeScreenshot(afterScreenUpdates: Bool) -> UIImage?
}

extension InAppScreenshotTaker {
    public func takeScreenshot() -> UIImage? {
        return takeScreenshot(afterScreenUpdates: true)
    }
}

#endif
