import UIKit
import MixboxInAppServices
import MixboxUiTestsFoundation
import MixboxFoundation
import UIKit
import Foundation

public final class GrayScreenshotTaker: ScreenshotTaker {
    private let inAppScreenshotTaker: InAppScreenshotTaker
    
    public init(
        inAppScreenshotTaker: InAppScreenshotTaker)
    {
        self.inAppScreenshotTaker = inAppScreenshotTaker
    }
    
    public func takeScreenshot() -> UIImage? {
        return inAppScreenshotTaker.takeScreenshot(afterScreenUpdates: true)
    }
}
