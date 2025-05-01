
import Foundation

public protocol VerificationFlowProtocol {
    var flowCode: String { get }
    var authFlow: AuthFlow { get }
    var isAuthorization: Bool { get }
}

public enum AuthFlow {
    case login
    case serviceLogin
    case prolong
    case diiaId(action: DiiaIdAction)
    case residencePermitNfcAdding
}
