
import Foundation

public struct PublicServiceRatingInitialModel {
    public let category: String
    public let serviceCode: String
    public let resourceId: String?
    public let ratingType: RatingType?
    public let screenCode: String?
    
    public init(category: String,
                serviceCode: String,
                ratingType: RatingType,
                screenCode: String? = nil,
                resourceId: String? = nil
    ) {
        self.category = category
        self.serviceCode = serviceCode
        self.ratingType = ratingType
        self.screenCode = screenCode
        self.resourceId = resourceId
    }
}
