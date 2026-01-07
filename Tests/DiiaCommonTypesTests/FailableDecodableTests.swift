
import XCTest
@testable import DiiaCommonTypes

final class FailableDecodableTests: XCTestCase {

    func test_decoding_success() {
        // Arrange
        let json = """
        {
            "name": "Test"
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()

        // Act
        do {
            let result = try decoder.decode(FailableDecodable<DummyModel>.self, from: json)

            // Assert
            XCTAssertEqual(result.value?.name, "Test")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func test_decoding_failure() {
        // Arrange
        let json = """
        {
            "invalidKey": "Test"
        }
        """.data(using: .utf8)!
        let decoder = JSONDecoder()
        let errorReporter = ErrorReporterMock()
        FailableDecodableConfig.errorReporter = errorReporter

        // Act
        do {
            let result = try decoder.decode(FailableDecodable<DummyModel>.self, from: json)

            // Assert
            XCTAssertNil(result.value)
            XCTAssertTrue(errorReporter.isErrorReported)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}

fileprivate struct DummyModel: Codable {
    let name: String
}
