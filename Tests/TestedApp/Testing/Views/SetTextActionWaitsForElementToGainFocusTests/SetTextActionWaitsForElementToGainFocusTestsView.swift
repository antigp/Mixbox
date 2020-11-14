import UIKit
import MixboxFoundation
import MixboxIpc
import MixboxIpcCommon
import TestsIpc

final class SetTextActionWaitsForElementToGainFocusTestsView: UIView, TestingView {
    var controlWithNestedTextView = DelayingFocusGainingInput(becomeFirstResponderDelay: 0)
    
    init(testingViewControllerSettings: TestingViewControllerSettings) {
        super.init(frame: .zero)
        
        let viewIpc = testingViewControllerSettings.viewIpc
        
        viewIpc.registerResetUiMethod(view: self, argumentType: TimeInterval.self) { view, becomeFirstResponderDelay in
            view.resetUi(becomeFirstResponderDelay: becomeFirstResponderDelay)
        }
        
        backgroundColor = .white
        
        resetUi(becomeFirstResponderDelay: 0)
    }
    
    func resetUi(becomeFirstResponderDelay: TimeInterval) {
        controlWithNestedTextView.removeFromSuperview()
        
        controlWithNestedTextView = DelayingFocusGainingInput(becomeFirstResponderDelay: becomeFirstResponderDelay)
        
        addSubview(controlWithNestedTextView)
        
        controlWithNestedTextView.accessibilityIdentifier = "controlWithNestedTextView"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        controlWithNestedTextView.frame = CGRect(
            x: 0,
            y: 100,
            width: bounds.width,
            height: 200
        )
    }
}
