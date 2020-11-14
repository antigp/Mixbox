import UIKit

final class CenteredLineButtonView: UIView {
    enum Layout {
        case vertical   // Button will look like this: |
        case horizontal // Button will look like this: -
    }
    
    private let button = ButtonWithClosures()
    private let layout: Layout
    
    init(layout: Layout) {
        self.layout = layout
        
        super.init(frame: .zero)
        
        backgroundColor = .white
        button.backgroundColor = .blue
        addSubview(button)
        
        mb_testability_customValues["isTapped"] = false
        
        button.onTap = { [weak self] in
            self?.mb_testability_customValues["isTapped"] = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch layout {
        case .horizontal:
            button.frame = CGRect(
                x: 0,
                y: bounds.height / 2,
                width: bounds.width,
                height: 1
            )
        case .vertical:
            button.frame = CGRect(
                x: bounds.width / 2,
                y: 0,
                width: 1,
                height: bounds.height
            )
        }
    }
}
