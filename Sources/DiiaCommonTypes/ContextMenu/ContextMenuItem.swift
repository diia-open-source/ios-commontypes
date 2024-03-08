import Foundation

public struct ContextMenuItem: Codable {
    public let type: ContextMenuAction
    public let name: String
    public let code: String?
}

public enum ContextMenuAction: String, Codable, EnumDecodable {
    public static let defaultValue: ContextMenuAction = .unknown
    
    case unknown
    case faqCategory
    case tips
    case communityContacts
    case supportServiceScreen
    case assistantScreen
    case fundDetails
    case rating
    case downloadList
}
