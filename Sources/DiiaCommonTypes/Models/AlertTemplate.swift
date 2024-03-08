import UIKit

public enum AlertType: String, Codable {
    case largeAlert
    case middleCenterAlignAlert
    case middleCenterBlackButtonAlert // Custom type, not returned from backend
    case middleLeftAlignAlert
    case smallAlert
}

public enum AlertTemplateAction: String, Codable, EnumDecodable, CaseIterable {
    public static var defaultValue: AlertTemplateAction = .unknown
    
    case unknown
    case authMethods
    case authBanks
    case logout
    case ok
    case refresh
    case close
    case back
    case download

    case skip
    case cancel
    case accept
    case previousScreen
    case vaccination
    case vaccinationCertificate
    case vaccinationAid
    case delete
    case `repeat`

    case doNotShow
    case serviceSubscribe
    
    case signing
    case toPay
    
    case privateEntrepreneur
    case petition
    case residenceRegistration
    case getMilitaryId
    
    case signatureCreationMethods
    case getSignatureCreationMethods
    case showMethods
    case diiaIdAuthMethods
    case pinCreation
    case inputPin

    case getMethods
    case getToken
    case prolong
    
    case criminalRecordCertificate
    
    case leaveFeedback
    
    case poll
    
    case properUser
    case properUserStatus
    case applicationSigning
    case properUserCanceling
    
    case addChildren
    case getGeolocation
    
    case cancelApplication
    case internallyDisplacedPerson
    case unemploymentStatus
    case unemploymentStatusHomeScreen
    
    case sendApp
    case returnIdentityCard
    
    case militaryBonds
    case orderId
    case cancelOrderId
    case presentDelivery

    case residenceCert
    case residenceCertStatus
    case residenceCertChildrenStatus
    case residenceCertChildren
    
    case childResidenceRegistration
    
    case signingSuccess
    case externalLink
    case internalLink
    case mortgage
    case depositGuaranteePayments
    
    case replacementDriverLicense
    
    case currentEmployment
    
    case packageStatus
    
    case resume
    case exit
    case confirmReject
    case confirm
    case sharing
    case licensePlates
    case vehicleLicenseType
    case vehicleReRegistrationStatus
    case damagedPropertyRecovery
    case damagedPropertyRecoveryStatus
    case confirmRefusal
    case publicServices
    case contacts
    case documentTypeSelection
    case birthCertificate
    case documentsVehicleLicense = "documents/vehicleLicense"
    
    case saveLicensePlate
    case sellWithLicensePlate
    case changeSelection
    
    public static var closableCases: [AlertTemplateAction] {
        return AlertTemplateAction.allCases.filter {
            ![
                internalLink
            ].contains($0)
        }
    }
    case vehicleExternalLink = "vehicleReRegistration/externalLink"
    case vehicleReRegistration
}

public struct AlertButtonModel: Codable {
    public let title: String?
    public let icon: String?
    public let action: AlertTemplateAction
    public let link: String?
    
    public init(title: String?,
                icon: String?,
                action: AlertTemplateAction,
                link: String? = nil
    ) {
        self.title = title
        self.icon = icon
        self.action = action
        self.link = link
    }
    
    public var image: UIImage? {
        icon
            .flatMap { Data(base64Encoded: $0, options: .ignoreUnknownCharacters) }
            .flatMap { UIImage(data: $0) }
    }
    
    private enum CodingKeys: String, CodingKey {
        case title = "name"
        case icon
        case action
        case link
    }
}

public struct AlertTemplateResponse: Decodable {
    public let template: AlertTemplate
    public let processCode: Int
    
    public init(template: AlertTemplate, processCode: Int) {
        self.template = template
        self.processCode = processCode
    }

}

public struct AlertTemplate: Codable {
    public let type: AlertType
    public let isClosable: Bool
    public let data: AlertTemplateData
    
    public init(type: AlertType, isClosable: Bool, data: AlertTemplateData) {
        self.type = type
        self.isClosable = isClosable
        self.data = data
    }
}

public struct AlertTemplateData: Codable {
    public let icon: String?
    public let title: String
    public let description: String?
    public let mainButton: AlertButtonModel
    public let alternativeButton: AlertButtonModel?
    
    public init(icon: String?, title: String, description: String?, mainButton: AlertButtonModel, alternativeButton: AlertButtonModel?) {
        self.icon = icon
        self.title = title
        self.description = description
        self.mainButton = mainButton
        self.alternativeButton = alternativeButton
    }
}
