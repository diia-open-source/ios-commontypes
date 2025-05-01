
public struct AddressType: Codable, CustomStringConvertible, Equatable {
    private let value: String
    
    public var description: String { return value }
    
    public init(_ value: String) {
        self.value = value
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        value = try container.decode(String.self)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}

public extension AddressType {
    static let unknown: AddressType = .init("unknown")
    
    static let residenceRegistrationPlace = AddressType("residenceRegistrationPlace") // driver license change
    static let newResidenceRegistrationPlace = AddressType("newResidenceRegistrationPlace")
    static let currentResidenceRegistrationPlace = AddressType("currentResidenceRegistrationPlace")
    static let oldResidenceRegistrationPlace = AddressType("oldResidenceRegistrationPlace")
    static let courier = AddressType("courier")
    static let currentChildRegistration = AddressType("current-child-registration")
    static let currentResidenceRegistration = AddressType("current-residence-registration")
    static let birthPlace = AddressType("birth-place")
    static let registrationPlace = AddressType("registration-place")
    static let residencePlace = AddressType("residence-place")
    static let manualResidencePlace = AddressType("manual-residence-place")
    static let realEstate = AddressType("real-estate")
    static let vehicleDamagePlace = AddressType("vehicle-place-of-damage")
    static let currentResidencePlace = AddressType("current-residence-place")
    static let postOffice = AddressType("post-office")
    static let vehicleReRegistration = AddressType("vehicle-re-registration")
    static let international = AddressType("international-delivery")
        
    static let privateHouse = AddressType("private-house")
    static let apartment = AddressType("apartment")
    static let rooms = AddressType("rooms")
    static let building = AddressType("building")
}
