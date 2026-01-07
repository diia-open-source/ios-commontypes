
import XCTest
@testable import DiiaCommonTypes

final class AnyCodableTests: XCTestCase {
    
    func test_encodingAndDecoding_worksCorrect() throws {
        // Bool
        let boolOriginal = AnyCodable.bool(true)
        try assertEncodingAndDecoding(originalValue: boolOriginal)

        // Int
        let intOriginal = AnyCodable.int(10)
        try assertEncodingAndDecoding(originalValue: intOriginal)

        // Double
        let doubleOriginal = AnyCodable.double(3.14)
        try assertEncodingAndDecoding(originalValue: doubleOriginal)

        // String
        let stringOriginal = AnyCodable.string("Test")
        try assertEncodingAndDecoding(originalValue: stringOriginal)

        // Array
        let arrayOriginal = AnyCodable.array([.int(1), .int(2), .int(3)])
        try assertEncodingAndDecoding(originalValue: arrayOriginal)

        // Dictionary
        let dictOriginal = AnyCodable.dictionary(["key": .string("value")])
        try assertEncodingAndDecoding(originalValue: dictOriginal)

        // Null
        let nullOriginal = AnyCodable.null
        try assertEncodingAndDecoding(originalValue: nullOriginal)
    }
    
    func test_anyCodableParser_parseValueForKey_worksCorrect() {
        // Arrange
        let jsonObject: [String: AnyCodable] = [
            "name": .string("Test"),
            "number": .int(25),
            "condition": .bool(true)
        ]
        
        let decoder = JSONDecoder()
        
        // Act & Assert
        // Test parsing string value
        let name: String? = AnyCodableParser.parseValue(forKey: "name", fromObject: jsonObject, decoder: decoder)
        XCTAssertEqual(name, "Test")
        
        // Test parsing integer value
        let number: Int? = AnyCodableParser.parseValue(forKey: "number", fromObject: jsonObject, decoder: decoder)
        XCTAssertEqual(number, 25)
        
        // Test parsing boolean value
        let condition: Bool? = AnyCodableParser.parseValue(forKey: "condition", fromObject: jsonObject, decoder: decoder)
        XCTAssertEqual(condition, true)
        
        // Test parsing non-existing key
        let nonExistingKey: String? = AnyCodableParser.parseValue(forKey: "nonExistingKey", fromObject: jsonObject, decoder: decoder)
        XCTAssertNil(nonExistingKey)
    }
    
    func test_anyCodable_parceValueForKey_worksCorrect() {
        // Arrange
        let anyCodableDict: AnyCodable = .dictionary([
            "name": .string("TestValue"),
            "number": .int(33),
            "condition": .bool(true)
        ])

        // Act & Assert
        // Test parsing string value
        let name: String? = anyCodableDict.parseValue(forKey: "name", decoder: JSONDecoder())
        XCTAssertEqual(name, "TestValue")

        // Test parsing integer value
        let number: Int? = anyCodableDict.parseValue(forKey: "number", decoder: JSONDecoder())
        XCTAssertEqual(number, 33)

        // Test parsing boolean value
        let condition: Bool? = anyCodableDict.parseValue(forKey: "condition", decoder: JSONDecoder())
        XCTAssertEqual(condition, true)

        // Test parsing non-existing key
        let nonExistingKey: String? = anyCodableDict.parseValue(forKey: "nonExistingKey", decoder: JSONDecoder())
        XCTAssertNil(nonExistingKey)
    }
    
    func test_parse_failure() {
        // Arrange
        let invalidAnyCodable: AnyCodable = .bool(true)

        // Act
        let parsedValue: String? = invalidAnyCodable.parse(decoder: JSONDecoder())

        // Assert
        XCTAssertNil(parsedValue)
    }
    
    // MARK: - Private helper
    func assertEncodingAndDecoding(originalValue: AnyCodable) throws {
        // Arrange
        let encoder = JSONEncoder()
        let data = try encoder.encode(originalValue)

        // Act
        let decoder = JSONDecoder()
        let decodedValue = try decoder.decode(AnyCodable.self, from: data)

        // Assert
        XCTAssertEqual(originalValue.prettyJSON, decodedValue.prettyJSON)
    }
}
