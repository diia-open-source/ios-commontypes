import Foundation

public enum TemplatedResponse<T: Decodable>: Decodable {
    case data(T)
    case template(AlertTemplate)
    
    private enum CodingKeys: String, CodingKey {
        case template
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        do {
            let x = try container.decode(T.self)
            self = .data(x)
            return
        } catch {
            print(error)
        }
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        let x = try keyedContainer.decode(AlertTemplate.self, forKey: .template)
        self = .template(x)
    }
}
