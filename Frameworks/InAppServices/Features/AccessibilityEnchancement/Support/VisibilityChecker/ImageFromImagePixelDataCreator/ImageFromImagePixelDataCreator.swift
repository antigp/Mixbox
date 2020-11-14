#if MIXBOX_ENABLE_IN_APP_SERVICES
import UIKit

public protocol ImageFromImagePixelDataCreator {
    func image(
        imagePixelData: ImagePixelData,
        scale: CGFloat,
        orientation: UIImage.Orientation)
        throws
        -> UIImage
}

#endif
