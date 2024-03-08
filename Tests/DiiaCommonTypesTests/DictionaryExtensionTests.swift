import XCTest
@testable import DiiaCommonTypes

class DictionaryExtensionTests: XCTestCase {

    func test_merge() {
        // Arrange
        var originalDict: [String: Any] = ["test_key1": "test_value1", "test_key2": "test_value2"]
        let dictToMerge: [String: Any] = ["test_key3": "test_value3"]

        // Act
        originalDict.merge(dict: dictToMerge)

        // Assert
        XCTAssertEqual(originalDict["test_key1"] as? String, "test_value1")
        XCTAssertEqual(originalDict["test_key2"] as? String, "test_value2")
        XCTAssertEqual(originalDict["test_key3"] as? String, "test_value3")
    }

    func test_merged() {
        // Arrange
        let originalDict: [String: Any] = ["test_key1": "test_value1", "test_key2": "test_value2"]
        let dictToMerge: [String: Any] = ["test_key3": "test_value3", "test_key4": "test_value4"]

        // Act
        let mergedDict = originalDict.merged(dict: dictToMerge)

        // Assert
        XCTAssertEqual(mergedDict["test_key1"] as? String, "test_value1")
        XCTAssertEqual(mergedDict["test_key2"] as? String, "test_value2")
        XCTAssertEqual(mergedDict["test_key3"] as? String, "test_value3")
        XCTAssertEqual(mergedDict["test_key4"] as? String, "test_value4")
    }

    func test_prettyJSON() {
        // Arrange
        let dictToSerialize: [String: Any] = ["test_key1": "test_value1", "test_key2": 12]

        // Act
        let prettyJSON = dictToSerialize.prettyJSON

        // Assert
        XCTAssertTrue(prettyJSON.contains("\"test_key1\" : \"test_value1\""))
        XCTAssertTrue(prettyJSON.contains("\"test_key2\" : 12"))
    }
}
