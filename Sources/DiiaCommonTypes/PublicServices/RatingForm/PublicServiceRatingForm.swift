import Foundation

public struct PublicServiceRatingFormResponse: Codable {
    public let ratingForm: PublicServiceRatingForm
}

public struct PublicServiceRatingForm: Codable {
    public let formCode: String?
    public let resourceId: String?
    public let title: String
    public let rating: PublicServiceRatingList
    public let comment: PublicServiceRatingFormComment
    public let mainButton: String
}

public struct PublicServiceRatingList: Codable {
    public let label: String
    public let items: [PublicServiceRatingItem]
}

public struct PublicServiceRatingItem: Codable {
    public let rate: String
    public let emoji: String
    public let chip: PublicServiceRatingChipList?
    public let chipBlocks: [PublicServiceRatingChipList]?
}

public struct PublicServiceRatingChipList: Codable {
    public let label: String
    public let description: String
    public let chips: [NamedSearchModel]
}

public struct PublicServiceRatingFormComment: Codable {
    public let label: String
    public let hint: String
}
