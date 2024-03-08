import Foundation

public enum AnyCodable: Codable {
    case bool(Bool)
    case int(Int)
    case double(Double)
    case string(String)
    case array([AnyCodable])
    case dictionary([String: AnyCodable])
    case null
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let bool = try? container.decode(Bool.self) {
            self = .bool(bool)
        } else if let int = try? container.decode(Int.self) {
            self = .int(int)
        } else if let double = try? container.decode(Double.self) {
            self = .double(double)
        } else if let string = try? container.decode(String.self) {
            self = .string(string)
        } else if let array = try? container.decode([AnyCodable].self) {
            self = .array(array)
        } else if let dictionary = try? container.decode([String: AnyCodable].self) {
            self = .dictionary(dictionary)
        } else if container.decodeNil() {
            self = .null
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "AnyDecodable value cannot be decoded")
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .bool(let bool):
            try container.encode(bool)
        case .int(let int):
            try container.encode(int)
        case .double(let double):
            try container.encode(double)
        case .string(let string):
            try container.encode(string)
        case .array(let array):
            try container.encode(array)
        case .dictionary(let dictionary):
            try container.encode(dictionary)
        case .null:
            try container.encodeNil()
        }
    }
    
    public func parse<T: Decodable>(decoder: JSONDecoder) -> T? {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self)
            return try decoder.decode(T.self, from: data)
        } catch {
            log(error.localizedDescription)
            return nil
        }
    }
    
    public func parseValue<T: Decodable>(forKey key: String, decoder: JSONDecoder) -> T? {
        guard case AnyCodable.dictionary(let dict) = self,
              let value = dict[key]
        else { return nil }
        return value.parse(decoder: decoder)
    }
}

public enum AnyCodableParser {
    static func parseValue<T: Decodable>(
        forKey key: String? = nil,
        fromObject object: [String: AnyCodable],
        decoder: JSONDecoder
    ) -> T? {
        guard let key = key else { return AnyCodable.dictionary(object).parse(decoder: decoder) }
        guard let value = object[key] else { return nil }
        return value.parse(decoder: decoder)
    }
}
