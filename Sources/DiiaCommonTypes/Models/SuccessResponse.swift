
import Foundation

public struct SuccessResponse: Decodable {
    public let success: Bool
    public let template: AlertTemplate?
    
    public init(success: Bool, template: AlertTemplate? = nil) {
        self.success = success
        self.template = template
    }
}
