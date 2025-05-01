
public struct PaymentRequestModel {
    public let type: PaymentServiceProtocol
    public let requestId: String
    
    public init(type: PaymentServiceProtocol, requestId: String) {
        self.type = type
        self.requestId = requestId
    }
}

public protocol PaymentServiceProtocol {
    func requestPath() -> String
}
