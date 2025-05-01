
import XCTest
@testable import DiiaCommonTypes

final class TemplatedResponseTests: XCTestCase {
    func testInit_WithData_DecodesSuccessfully() throws {
        // Arrange
        let data = try JSONEncoder().encode("test string")

        // Act
        let response = try JSONDecoder().decode(TemplatedResponse<String>.self, from: data)

        // Assert
        switch response {
        case .data(let value):
            XCTAssertEqual(value, "test string")
        case .template:
            XCTFail("Expected .data case, but got .template")
        }
    }

    func testInit_WithData_ThrowsErrorForInvalidData() throws {
        // Arrange
        let data = try JSONEncoder().encode(["key": "value"])

        // Act & Assert
        XCTAssertThrowsError(try JSONDecoder().decode(TemplatedResponse<String>.self, from: data))
    }

    // MARK: - Tests for template case

    func testInit_WithTemplate_DecodesSuccessfully() throws {
        // Arrange
        let jsonData = """
            {
                "template":
                {
                        "type": "middleCenterAlignAlert",
                        "isClosable": false,
                        "data":
                        {
                            "title": "Title",
                            "mainButton":
                            {
                                "name": "Sulge",
                                "action": "close"
                            }
                        }
                }
            }
            """.data(using: .utf8)

        guard let jsonData else {
            XCTFail("testInitFromDecoder_withValidJsonData_parsesCorrectly: data is not inited")
            return
        }

        // Act
        let response = try JSONDecoder().decode(TemplatedResponse<String>.self, from: jsonData)

        // Assert
        switch response {
        case .data:
            XCTFail("Expected .template case, but got .data")
        case .template(let template):
            XCTAssertEqual(template.type, .middleCenterAlignAlert)
            XCTAssertEqual(template.isClosable, false)
            XCTAssertEqual(template.data.title, "Title")
            XCTAssertNil(template.data.description)
            XCTAssertEqual(template.data.mainButton.action, .close)
            XCTAssertNil(template.data.alternativeButton)
        }
    }

    func testInit_WithTemplate_ThrowsErrorForMissingKey() throws {
        // Arrange
        let data = try JSONEncoder().encode(["type": "largeAlert"])

        // Act & Assert
        XCTAssertThrowsError(try JSONDecoder().decode(TemplatedResponse<String>.self, from: data))
    }

    func testInit_WithTemplate_ThrowsErrorForInvalidData() throws {
        // Arrange
        let data = try JSONEncoder().encode(["template": ["type": "largeAlert"]])

        // Act & Assert
        XCTAssertThrowsError(try JSONDecoder().decode(TemplatedResponse<String>.self, from: data))
    }
}
