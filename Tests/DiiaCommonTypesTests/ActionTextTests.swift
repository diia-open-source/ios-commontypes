import XCTest
@testable import DiiaCommonTypes

class ActionTextTests: XCTestCase {
    
    func test_actionText_initialization() {
        let attributes = [ActionTextAttribute(range: NSRange(location: 0, length: 5), attributes: [:])]
        let actionText = ActionText(text: "Action", attributes: attributes)
        
        XCTAssertEqual(actionText.text, "Action")
        XCTAssertEqual(actionText.attributes.count, 1)
    }
    
    func test_actionTextAttribute_initialization() {
        let range = NSRange(location: 0, length: 5)
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.red]
        let actionAttribute = ActionTextAttribute(range: range, attributes: attributes)
        
        XCTAssertEqual(actionAttribute.range, range)
        XCTAssertEqual(actionAttribute.attributes.count, 1)
        XCTAssertNil(actionAttribute.action)
    }
    
    func test_actionIfNeeded_withAction() {
        let range = NSRange(location: 0, length: 5)
        let action: Callback = {
            print("Action performed")
        }
        let actionAttribute = ActionTextAttribute(range: range, attributes: [:], action: action)
        
        XCTAssertTrue(actionAttribute.actionIfNeeded(index: 2))
    }
    
    func test_actionIfNeeded_withoutAction() {
        let range = NSRange(location: 0, length: 5)
        let actionAttribute = ActionTextAttribute(range: range, attributes: [:])
        
        XCTAssertFalse(actionAttribute.actionIfNeeded(index: 6))
    }
}
