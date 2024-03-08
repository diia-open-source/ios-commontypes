import Foundation

public struct GeneralStatusMessage: Codable {
    public let icon: String
    public let name: String?
    public let description: String?

    public init(icon: String, name: String? = nil, description: String? = nil) {
        self.icon = icon
        self.name = name
        self.description = description
    }
}
