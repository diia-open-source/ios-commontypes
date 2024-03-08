import Foundation

public struct NamedSearchModel: Codable {
    public let code: String
    public let name: String
}

public struct NamedDescriptedSearchModel: Codable {
    public let code: String
    public let name: String
    public let description: String?
}
