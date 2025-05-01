
import Foundation

public enum TickerOptionType: String, Codable {
    case warning
    case info
}

public struct TickerOptions: Codable {
    public let type: TickerOptionType
    public let text: String
}
