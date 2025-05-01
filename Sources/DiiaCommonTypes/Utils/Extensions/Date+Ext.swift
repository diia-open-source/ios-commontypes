
import Foundation

public extension Date {
    var yesterdayDate: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)! // swiftlint:disable:this force_unwrapping
    }
    
    var tomorrowDate: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)! // swiftlint:disable:this force_unwrapping
    }
    
    func dateAppending(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self)! // swiftlint:disable:this force_unwrapping
    }
    
    var day: Int {
        let components = Calendar.current.dateComponents([.day], from: self)
        return components.day ?? 0
    }
    
    var month: Int {
        let components = Calendar.current.dateComponents([.month], from: self)
        return components.month ?? 0
    }
    
    var year: Int {
        let components = Calendar.current.dateComponents([.year], from: self)
        return components.year ?? 0
    }
    
    var lastDayInCurrentMonth: Int {
        guard let lastDayInCurrentMonthDate = Calendar.current.date(byAdding: DateComponents(month: 1, day: -1),
                                                                    to: self) else { return 0 }
        return lastDayInCurrentMonthDate.day
    }
    
    func toISO61() -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
        return formatter.string(from: self)
    }

    func toLongDateString(locale: Locale = Locale(identifier: "uk_UA")) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy HH:mm"
        dateFormatter.locale = locale
        dateFormatter.timeZone = TimeZone.current

        return dateFormatter.string(from: self)
    }
    
    func toLongDayString(locale: Locale = Locale(identifier: "uk_UA")) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateFormatter.locale = locale
        dateFormatter.timeZone = TimeZone.current

        return dateFormatter.string(from: self)
    }
    
    func toDayString(locale: Locale = Locale(identifier: "uk_UA")) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.locale = locale
        dateFormatter.timeZone = TimeZone.current

        return dateFormatter.string(from: self)
    }
    
    func toShortTimeString(locale: Locale = Locale(identifier: "uk_UA")) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm"
        dateFormatter.locale = locale
        dateFormatter.timeZone = TimeZone.current

        return dateFormatter.string(from: self)
    }
    
    func toAccurateTimeString(locale: Locale = Locale(identifier: "uk_UA")) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm:ss SSS"
        dateFormatter.locale = locale
        dateFormatter.timeZone = TimeZone.current

        return dateFormatter.string(from: self)
    }
    
    func daysFrom(date: Date) -> Int {
        let diff = Calendar.current.dateComponents([.day], from: self, to: date)
        return diff.day ?? 0
    }
    
    var timeUpdateDateStr: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm | dd.MM.yyyy"
        return formatter.string(from: self)
    }
    
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
