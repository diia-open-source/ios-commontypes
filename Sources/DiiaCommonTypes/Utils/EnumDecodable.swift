import Foundation

public protocol EnumDecodable: RawRepresentable, Decodable {
    static var defaultValue: Self { get }
}

public extension EnumDecodable where RawValue: Decodable {
    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer().decode(RawValue.self)
        self = Self(rawValue: value) ?? Self.defaultValue
    }
}
