import Foundation
import MixboxIpcCommon


public final class SwipeActionDescriptionProvider {
    private let swipeActionPathSettings: SwipeActionPathSettings
    private let startPoint: InteractionCoordinates
    
    public init(
        swipeActionPathSettings: SwipeActionPathSettings,
        startPoint: InteractionCoordinates)
    {
        self.swipeActionPathSettings = swipeActionPathSettings
        self.startPoint = startPoint
    }
    
    public func swipeActionDescription(elementName: String) -> String {
        return "в \(elementName) свайп из \(startPointDescription()) в \(endPointDescription())"
    }
    
    private func endPointDescription() -> String {
        switch swipeActionPathSettings.endPoint {
        case let .directionWithDefaultLength(direction):
            return directionDescription(direction: direction)
        case let .directionWithLength(direction, length):
            return "\(directionDescription(direction: direction)) на \(length) поинтов"
        case let .interactionCoordinates(interactionCoordinates):
            return interactionCoordinatesDescription(
                interactionCoordinates: interactionCoordinates,
                nonCenterDescription: "точку",
                centerDescription: "центр элемента"
            )
        }
    }
    
    private func directionDescription(direction: SwipeDirection) -> String {
        switch direction {
        case .up:
            return "вверх"
        case .down:
            return "вниз"
        case .left:
            return "влево"
        case .right:
            return "вправо"
        }
    }
    
    private func startPointDescription() -> String {
        let nonCenterDescription = "точки"
        let centerDescription = "центра элемента"
        
        return interactionCoordinatesDescription(
            interactionCoordinates: startPoint,
            nonCenterDescription: nonCenterDescription,
            centerDescription: centerDescription
        )
    }
    
    private func interactionCoordinatesDescription(
        interactionCoordinates: InteractionCoordinates,
        nonCenterDescription: String,
        centerDescription: String)
        -> String
    {
        let normalizedCoordinatesDesription: String
        let absoluteCoordinatesDesription: String?
        
        if let normalizedCoordinate = interactionCoordinates.normalizedCoordinate {
            let x = normalizedCoordinate.x
            let y = normalizedCoordinate.y
            
            if x == 0.5 && y == 0.5 {
                normalizedCoordinatesDesription = centerDescription
            } else {
                normalizedCoordinatesDesription = "\(nonCenterDescription) по относительным координатам (\(x); \(y))"
            }
        } else {
            normalizedCoordinatesDesription = centerDescription
        }
        
        if let absoluteOffset = interactionCoordinates.absoluteOffset {
            let x = absoluteOffset.dx
            let y = absoluteOffset.dy
            
            absoluteCoordinatesDesription = "с абсолютным смещением (\(x); \(y))"
        } else {
            absoluteCoordinatesDesription = nil
        }
        
        return normalizedCoordinatesDesription + (absoluteCoordinatesDesription.map { " \($0)" } ?? "")
    }
}
