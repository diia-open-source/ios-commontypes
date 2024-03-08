import Foundation

public struct ActionText {
    public let text: String
    public let attributes: [ActionTextAttribute]
    
    public init(text: String, attributes: [ActionTextAttribute]) {
        self.text = text
        self.attributes = attributes
    }
}

public struct ActionTextAttribute {
    public let range: NSRange
    public let attributes: [NSAttributedString.Key: Any]
    public let action: Callback?
    
    public init(range: NSRange, attributes: [NSAttributedString.Key: Any], action: Callback? = nil) {
        self.range = range
        self.attributes = attributes
        self.action = action
    }
    
    @discardableResult
    public func actionIfNeeded(index: Int) -> Bool {
        if range.contains(index) {
            action?()
            return true
        }
        return false
    }
}
