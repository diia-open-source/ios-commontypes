import Foundation

public struct AttentionMessage: Codable {
    public let title: String?
    public let text: String?
    public let icon: String
    
    public init(title: String? = nil, text: String? = nil, icon: String) {
        self.title = title
        self.text = text
        self.icon = icon
    }
}
