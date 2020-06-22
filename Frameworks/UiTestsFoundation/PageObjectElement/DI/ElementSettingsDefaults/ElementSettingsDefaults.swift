import Foundation
import UIKit

public final class ElementSettingsDefaults {
    public let scrollMode: ScrollMode
    public let interactionTimeout: TimeInterval
    public let interactionMode: InteractionMode
    public let percentageOfVisibleArea: CGFloat
    
    public init(
        scrollMode: ScrollMode,
        interactionTimeout: TimeInterval,
        interactionMode: InteractionMode,
        percentageOfVisibleArea: CGFloat)
    {
        self.scrollMode = scrollMode
        self.interactionTimeout = interactionTimeout
        self.interactionMode = interactionMode
        self.percentageOfVisibleArea = percentageOfVisibleArea
    }
}
