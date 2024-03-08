import DiiaMVPModule
import Foundation

public protocol RouterProtocol {
    func route(in view: BaseView)
}

public protocol RouterExtendedProtocol: RouterProtocol {
    func route(in view: BaseView, replace: Bool, animated: Bool)
}
