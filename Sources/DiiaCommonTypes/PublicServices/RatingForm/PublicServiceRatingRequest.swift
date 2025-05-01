
import Foundation

public struct PublicServiceRatingRequest: Codable {
    let resourceId: String?
    let formCode: String?
    let isClosed: Bool
    public let ratingType: RatingType?
    let screenCode: String?
    let completingTimeMs: Int
    let rating: String?
    let selectedChips: [String]?
    let comment: String?
    
    public init(resourceId: String? = nil, formCode: String? = nil, isClosed: Bool, ratingType: RatingType? = nil, screenCode: String? = nil, completingTimeMs: Int, rating: String? = nil, selectedChips: [String]? = nil, comment: String? = nil) {
        self.resourceId = resourceId
        self.formCode = formCode
        self.isClosed = isClosed
        self.ratingType = ratingType
        self.screenCode = screenCode
        self.completingTimeMs = completingTimeMs
        self.rating = rating
        self.selectedChips = selectedChips
        self.comment = comment
    }
}

public enum RatingType: String, Codable {
    case userInitiative
    case byRequest
}
