import UIKit

final class FakeCellsDoNotCrashAppTestsView: CollectionView {
    @objc init() {
        super.init(
            itemSize: CGSize(
                width: UIScreen.main.bounds.width,
                height: 100
            ),
            sectionInset: UIEdgeInsets.mb_init(
                top: 0,
                bottom: 0
            )
        )
        
        setUpCellModels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCellModels() {
        removeCells()
        
        // Visible cells:
        
        for i in 0..<100 {
            addCell { (cell: SingleViewCell<UILabel>) in
                cell.accessibilityIdentifier = "GoodCell"
                cell.mb_testability_customValues["index"] = i
                
                cell.view.text = "I am a good cell #\(i). I do not crash apps."
                cell.view.backgroundColor = .green
            }
        }
        
        // Not visible cells:
        
        for i in 0..<100 {
            addCell { (cell: CrashingCell) in
                cell.accessibilityIdentifier = "CrashingCell"
                cell.mb_testability_customValues["index"] = i
                
                cell.crashPlace = i
                cell.backgroundColor = .red
            }
        }
        
        for i in 0..<100 {
            addCell { (cell: CellThatCrashesAtInit) in
                cell.mb_testability_customValues["index"] = i
                
                cell.accessibilityIdentifier = "CellThatCrashesAtInit"
                cell.backgroundColor = .red
            }
        }
    }
}
