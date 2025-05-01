
import Foundation

public enum FailableDecodableConfig {
    public static var errorReporter: ErrorReporter?
}

public struct FailableDecodable<Value: Decodable>: Decodable {
    public let value: Value?

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        do {
            let value = try container.decode(Value.self)
            self.value = value
        } catch let error {
            FailableDecodableConfig.errorReporter?.report(error: error)
            print("FailableDecodable error: \(error)")
            value = nil
        }
    }
}
