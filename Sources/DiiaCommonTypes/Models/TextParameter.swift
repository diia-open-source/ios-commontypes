import Foundation

public struct TextParameter: Codable {
    public let type: TextParameterType
    public let data: TextParameterData
    
    public init(type: TextParameterType, data: TextParameterData) {
        self.type = type
        self.data = data
    }
}

public enum TextParameterType: String, Codable {
    case link
    case phone
    case email
}

public struct TextParameterData: Codable {
    public let name: String
    public let alt: String
    public let resource: String
    
    public init(name: String, alt: String, resource: String) {
        self.name = name
        self.alt = alt
        self.resource = resource
    }
}

extension TextParameter: Equatable { }

extension TextParameterData: Equatable { }
