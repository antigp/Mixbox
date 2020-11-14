#if MIXBOX_ENABLE_IN_APP_SERVICES

import UIKit

// For offsetting

public func +(left: CGPoint, right: CGVector) -> CGPoint {
    return CGPoint(
        x: left.x + right.dx,
        y: left.y + right.dy
    )
}

public func +(left: CGVector, right: CGPoint) -> CGPoint {
    return right + left
}

public func +(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(
        x: left.x + right.x,
        y: left.y + right.y
    )
}

public func -(left: CGPoint, right: CGVector) -> CGPoint {
    return CGPoint(
        x: left.x - right.dx,
        y: left.y - right.dy
    )
}

// For calculating offset

public func -(left: CGPoint, right: CGPoint) -> CGVector {
    return CGVector(
        dx: left.x - right.x,
        dy: left.y - right.y
    )
}

// Inverting
public prefix func -(vector: CGVector) -> CGVector {
    return CGVector(
        dx: -vector.dx,
        dy: -vector.dy
    )
}

// MARK: - Scaling

// E.g.: (100pt, 100pt) * (2,2) = (200pt,200pt)

public func *(left: CGSize, right: CGVector) -> CGSize {
    return CGSize(
        width: left.width * right.dx,
        height: left.height * right.dy
    )
}

public func *(left: CGVector, right: CGSize) -> CGSize {
    return right * left
}

public func *(left: CGPoint, right: CGVector) -> CGPoint {
    return CGPoint(
        x: left.x * right.dx,
        y: left.y * right.dy
    )
}

public func *(left: CGVector, right: CGPoint) -> CGPoint {
    return right * left
}

public func *(left: CGVector, right: CGFloat) -> CGVector {
    return CGVector(
        dx: left.dx * right,
        dy: left.dy * right
    )
}

public func *(left: CGFloat, right: CGVector) -> CGVector {
    return right * left
}

public func /(left: CGVector, right: CGFloat) -> CGVector {
    return CGVector(
        dx: left.dx / right,
        dy: left.dy / right
    )
}

public func /(left: CGSize, right: CGVector) -> CGSize {
    return CGSize(
        width: left.width / right.dx,
        height: left.height / right.dy
    )
}

// E.g.: Ratio
// (100pt, 100pt) / (100pt, 100pt) = (1, 1)
public func /(left: CGVector, right: CGSize) -> CGVector {
    return CGVector(
        dx: left.dx / right.width,
        dy: left.dy / right.height
    )
}

public func *(left: CGRect, right: CGFloat) -> CGRect {
    return CGRect(
        origin: left.origin * right,
        size: left.size * right
    )
}

public func *(left: CGFloat, right: CGRect) -> CGRect {
    return right * left
}

public func *(left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPoint(
        x: left.x * right,
        y: left.y * right
    )
}

public func *(left: CGFloat, right: CGPoint) -> CGPoint {
    return right * left
}

#endif
