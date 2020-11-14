import MixboxUiTestsFoundation
import MixboxTestsFoundation
import XCTest

final class FakeCellsDoNotCauseSideEffectsTests: TestCase {
    func test() {
        openScreen(name: "FakeCellsDoNotCauseSideEffectsTestsView")
        
        let allIds = ["cellForItemAt", "willDisplayCell"]
        
        // Wait screen is loaded
        _ = pageObjects.screen.labelInRealCell(id: allIds[0]).isDisplayed()
        
        for id in ["cellForItemAt", "willDisplayCell"] {
            let realCellText = pageObjects.screen.labelInRealCell(id: id).text
            let fakeCellIdText = pageObjects.screen.fakeCellId(id: id).text
            let realCellIdText = pageObjects.screen.realCellId(id: id).text
            
            XCTAssertEqual(realCellText, realCellIdText)
            XCTAssertNotEqual(fakeCellIdText, realCellIdText)
        }
    }
}

private extension LabelElement {
    var text: String {
        return withoutTimeout.text()
    }
}

private final class Screen: BasePageObjectWithDefaultInitializer {
    func labelInRealCell(id: String) -> LabelElement {
        return element("realCell \(id)") { element in
            element.isInstanceOf(UILabel.self) && element.isSubviewOf { element in
                element.id == id
            }
        }
    }
    func realCellId(id: String) -> LabelElement {
        return element("realCellId \(id)") { element in
            element.id == "\(id).realCellId"
        }
    }
    func fakeCellId(id: String) -> LabelElement {
        return element("fakeCellId \(id)") { element in
            element.id == "\(id).fakeCellId"
        }
    }
}

private extension PageObjects {
    var screen: Screen {
        return pageObject()
    }
}
