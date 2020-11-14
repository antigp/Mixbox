import UIKit

public protocol ApplicationFrameProvider: class {
    var applicationFrame: CGRect { get }
}
