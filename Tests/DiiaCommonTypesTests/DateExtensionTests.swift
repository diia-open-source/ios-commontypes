import XCTest
@testable import DiiaCommonTypes

final class DateExtensionTests: XCTestCase {
    private let frozenInterval: TimeInterval = 726074986.180697 // 2024-01-04 15:29:46 +0000
    
    func test_day() {
        // Arrange
        let frozenDate = Date(timeIntervalSinceReferenceDate: frozenInterval)
        let expectedDay: Int = 4

        // Act
        let day = frozenDate.day

        // Assert
        XCTAssertEqual(day, expectedDay)
    }
    
    func test_month() {
        // Arrange
        let frozenDate = Date(timeIntervalSinceReferenceDate: frozenInterval)
        let expectedMonth: Int = 1 // January

        // Act
        let month = frozenDate.month

        // Assert
        XCTAssertEqual(month, expectedMonth)
    }
    
    func test_year() {
        // Arrange
        let frozenDate = Date(timeIntervalSinceReferenceDate: frozenInterval)
        let expectedYear: Int = 2024

        // Act
        let year = frozenDate.year

        // Assert
        XCTAssertEqual(year, expectedYear)
    }
    
    func test_yesterdayDate() {
        // Arrange
        let frozenDate = Date(timeIntervalSinceReferenceDate: frozenInterval)
        let expectedDays: Int = 1

        // Act
        let yesterdayDate = Date().yesterdayDate
        let days = yesterdayDate.daysFrom(date: Date())

        // Assert
        XCTAssertEqual(days, expectedDays)
    }
    
    func test_toISO61() {
        // Arrange
        let frozenDate = Date(timeIntervalSinceReferenceDate: frozenInterval)
        let expectedString = "2024-01-04T15:29:46Z"

        // Act
        let stringed = frozenDate.toISO61()

        // Assert
        XCTAssertEqual(stringed, expectedString)
    }
    
    func test_toLongDateString() {
        // Arrange
        let frozenDate = Date(timeIntervalSinceReferenceDate: frozenInterval)
        let expectedString = "04 січня 2024 17:29"

        // Act
        let stringed = frozenDate.toLongDateString()

        // Assert
        XCTAssertEqual(stringed, expectedString)
    }
    
    func test_toLongDateString_notUaLocale() {
        // Arrange
        let frozenDate = Date(timeIntervalSinceReferenceDate: frozenInterval)
        let expectedUaLocaleString = "04 січня 2024 17:29"

        // Act
        let stringed = frozenDate.toLongDateString(locale: Locale.init(identifier: "en"))

        // Assert
        XCTAssertNotEqual(stringed, expectedUaLocaleString)
    }
    
    func test_toLongDayString() {
        // Arrange
        let frozenDate = Date(timeIntervalSinceReferenceDate: frozenInterval)
        let expectedString = "04 січня 2024"

        // Act
        let stringed = frozenDate.toLongDayString()

        // Assert
        XCTAssertEqual(stringed, expectedString)
    }
    
    func test_toLongDayString_notUaLocale() {
        // Arrange
        let frozenDate = Date(timeIntervalSinceReferenceDate: frozenInterval)
        let expectedString = "04 січня 2024"

        // Act
        let stringed = frozenDate.toLongDayString(locale: Locale.init(identifier: "en"))

        // Assert
        XCTAssertNotEqual(stringed, expectedString)
    }
    
    func test_toDayString() {
        // Arrange
        let frozenDate = Date(timeIntervalSinceReferenceDate: frozenInterval)
        let expectedString = "04.01.2024"

        // Act
        let stringed = frozenDate.toDayString()

        // Assert
        XCTAssertEqual(stringed, expectedString)
    }
    
    func test_toAccurateTimeString() {
        // Arrange
        let frozenDate = Date(timeIntervalSinceReferenceDate: frozenInterval)
        let expectedString = "17:29:46 181"

        // Act
        let stringed = frozenDate.toAccurateTimeString()

        // Assert
        XCTAssertEqual(stringed, expectedString)
    }
    
    func test_daysFrom_fullDay() {
        // Arrange
        let frozenDate = Date(timeIntervalSinceReferenceDate: frozenInterval)
        
        let frozenIntervalThreeDaysAgo: TimeInterval = 725815786.0
        let frozenDateThreeDaysAgo = Date(timeIntervalSinceReferenceDate: frozenIntervalThreeDaysAgo) // 2024-01-01 15:29:46 +0000

        let expectedDays:Int = 3
        
        // Act
        let days = frozenDateThreeDaysAgo.daysFrom(date: frozenDate)
        
        // Assert
        XCTAssertEqual(days, expectedDays)
    }
    
    func test_daysFrom_lessThanDay() {
        // Arrange
        let frozenDate = Date(timeIntervalSinceReferenceDate: frozenInterval)
        
        let frozenIntervalLessThanDayAgo: TimeInterval = 726000000.0
        let frozenDateLessThanDayAgo = Date(timeIntervalSinceReferenceDate: frozenIntervalLessThanDayAgo) // 2024-01-01 15:29:46 +0000

        let expectedDays:Int = 0
        
        // Act
        let days = frozenDateLessThanDayAgo.daysFrom(date: frozenDate)
        
        // Assert
        XCTAssertEqual(days, expectedDays)
    }
    
    func test_timeUpdateDateStr() {
        // Arrange
        let frozenDate = Date(timeIntervalSinceReferenceDate: frozenInterval)
        let expectedString = "17:29 | 04.01.2024"
        
        // Act
        let dateStr = frozenDate.timeUpdateDateStr
        
        // Assert
        XCTAssertEqual(dateStr, expectedString)
    }

}
