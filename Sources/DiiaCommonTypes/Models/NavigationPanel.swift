
import Foundation

public struct NavigationPanel: Codable {
    public let header: String?
    public let contextMenu: [ContextMenuItem]?
    
    public init(header: String?, contextMenu: [ContextMenuItem]?) {
        self.header = header
        self.contextMenu = contextMenu
    }
}
