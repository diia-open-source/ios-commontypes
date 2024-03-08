import Foundation

public protocol RatingFormHolder {
    func screenCode() -> String
    func resourceId() -> String?
}

public extension RatingFormHolder {
    func resourceId() -> String? {
        return nil
    }
}
