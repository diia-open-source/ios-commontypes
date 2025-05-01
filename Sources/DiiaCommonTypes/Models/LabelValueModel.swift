
import Foundation

public struct LabelValueModel: Codable {
    public let label: String
    public let value: String
    
    public init(label: String, value: String) {
        self.label = label
        self.value = value
    }
}

extension LabelValueModel: Equatable { }
