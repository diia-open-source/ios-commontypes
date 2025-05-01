
import Foundation
import DiiaMVPModule

public protocol ContextMenuProviderProtocol {
    func hasContextMenu() -> Bool
    func openContextMenu(in view: BaseView)
    mutating func setContextMenu(items: [ContextMenuItem]?)
    mutating func setTitle(title: String?)
    var title: String? { get }
}
