
import Foundation

public protocol URLOpenerProtocol {
    func url(urlString: String?, linkType: String?) -> Bool
    func tryURL(urls: [String]) -> Bool
}
