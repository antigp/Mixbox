#if MIXBOX_ENABLE_IN_APP_SERVICES
import UIKit
public protocol ImagePixelDataFromImageCreator {
    func createImagePixelData(
        image: CGImage)
        throws
        -> ImagePixelData
}

#endif
