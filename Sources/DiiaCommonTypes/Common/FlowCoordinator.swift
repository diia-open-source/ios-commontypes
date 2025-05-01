
import Foundation
import DiiaMVPModule

public protocol FlowCoordinatorProtocol {
    func restartFlow()
    func flowWasFinishedWithSuccess(success: Bool)
    func restartFlow(with modules: [BaseModule])
    func closeFlow()
}
