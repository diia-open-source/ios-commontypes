import Foundation

public struct SearchModel: Codable {
    public let code: String
    public let title: String
    
    public init(code: String, title: String) {
        self.code = code
        self.title = title
    }
}
