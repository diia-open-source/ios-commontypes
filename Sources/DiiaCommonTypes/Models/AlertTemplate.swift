
import UIKit

public enum AlertType: String, Codable {
    case largeAlert
    case middleCenterAlignAlert
    case middleCenterBlackButtonAlert // Custom type, not returned from backend
    case middleLeftAlignAlert
    case smallAlert
}


public struct AlertTemplateAction: Codable, CustomStringConvertible, Equatable {
    private let value: String
    
    public var description: String { return value }
    
    public init(_ value: String) {
        self.value = value
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        value = try container.decode(String.self)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}

public extension AlertTemplateAction {
    static let unknown: AlertTemplateAction = .init("unknown")
    static let authMethods: AlertTemplateAction = .init("authMethods")
    static let authBanks: AlertTemplateAction = .init("authBanks")
    static let logout: AlertTemplateAction = .init("logout")
    static let ok: AlertTemplateAction = .init("ok")
    static let refresh: AlertTemplateAction = .init("refresh")
    static let close: AlertTemplateAction = .init("close")
    static let back: AlertTemplateAction = .init("back")
    static let download: AlertTemplateAction = .init("download")
    static let skip: AlertTemplateAction = .init("skip")
    static let cancel: AlertTemplateAction = .init("cancel")
    static let accept: AlertTemplateAction = .init("accept")
    static let previousScreen: AlertTemplateAction = .init("previousScreen")
    static let vaccination: AlertTemplateAction = .init("vaccination")
    static let vaccinationCertificate: AlertTemplateAction = .init("vaccinationCertificate")
    static let vaccinationAid: AlertTemplateAction = .init("vaccinationAid")
    static let delete: AlertTemplateAction = .init("delete")
    static let `repeat`: AlertTemplateAction = .init("repeat")
    static let retry: AlertTemplateAction = .init("retry")
    static let doNotShow: AlertTemplateAction = .init("doNotShow")
    static let serviceSubscribe: AlertTemplateAction = .init("serviceSubscribe")
    static let signing: AlertTemplateAction = .init("signing")
    static let toPay: AlertTemplateAction = .init("toPay")
    static let privateEntrepreneur: AlertTemplateAction = .init("privateEntrepreneur")
    static let petition: AlertTemplateAction = .init("petition")
    static let residenceRegistration: AlertTemplateAction = .init("residenceRegistration")
    static let getMilitaryId: AlertTemplateAction = .init("getMilitaryId")
    static let signatureCreationMethods: AlertTemplateAction = .init("signatureCreationMethods")
    static let getSignatureCreationMethods: AlertTemplateAction = .init("getSignatureCreationMethods")
    static let showMethods: AlertTemplateAction = .init("showMethods")
    static let diiaIdAuthMethods: AlertTemplateAction = .init("diiaIdAuthMethods")
    static let pinCreation: AlertTemplateAction = .init("pinCreation")
    static let inputPin: AlertTemplateAction = .init("inputPin")
    static let getMethods: AlertTemplateAction = .init("getMethods")
    static let getToken: AlertTemplateAction = .init("getToken")
    static let prolong: AlertTemplateAction = .init("prolong")
    static let criminalRecordCertificate: AlertTemplateAction = .init("criminalRecordCertificate")
    static let leaveFeedback: AlertTemplateAction = .init("leaveFeedback")
    static let poll: AlertTemplateAction = .init("poll")
    static let properUser: AlertTemplateAction = .init("properUser")
    static let properUserStatus: AlertTemplateAction = .init("properUserStatus")
    static let applicationSigning: AlertTemplateAction = .init("applicationSigning")
    static let properUserCanceling: AlertTemplateAction = .init("properUserCanceling")
    static let doctorConsultation: AlertTemplateAction = .init("doctorConsultation")
    static let addChildren: AlertTemplateAction = .init("addChildren")
    static let getGeolocation: AlertTemplateAction = .init("getGeolocation")
    static let cancelApplication: AlertTemplateAction = .init("cancelApplication")
    static let internallyDisplacedPerson: AlertTemplateAction = .init("internallyDisplacedPerson")
    static let unemploymentStatus: AlertTemplateAction = .init("unemploymentStatus")
    static let unemploymentStatusHomeScreen: AlertTemplateAction = .init("unemploymentStatusHomeScreen")
    static let sendApp: AlertTemplateAction = .init("sendApp")
    static let returnIdentityCard: AlertTemplateAction = .init("returnIdentityCard")
    static let militaryBonds: AlertTemplateAction = .init("militaryBonds")
    static let orderId: AlertTemplateAction = .init("orderId")
    static let cancelOrderId: AlertTemplateAction = .init("cancelOrderId")
    static let presentDelivery: AlertTemplateAction = .init("presentDelivery")
    static let residenceCert: AlertTemplateAction = .init("residenceCert")
    static let residenceCertStatus: AlertTemplateAction = .init("residenceCertStatus")
    static let residenceCertChildrenStatus: AlertTemplateAction = .init("residenceCertChildrenStatus")
    static let residenceCertChildren: AlertTemplateAction = .init("residenceCertChildren")
    static let childResidenceRegistration: AlertTemplateAction = .init("childResidenceRegistration")
    static let signingSuccess: AlertTemplateAction = .init("signingSuccess")
    static let externalLink: AlertTemplateAction = .init("externalLink")
    static let internalLink: AlertTemplateAction = .init("internalLink")
    static let smartMobilization: AlertTemplateAction = .init("smartMobilization")
    static let mortgage: AlertTemplateAction = .init("mortgage")
    static let depositGuaranteePayments: AlertTemplateAction = .init("depositGuaranteePayments")
    static let replacementDriverLicense: AlertTemplateAction = .init("replacementDriverLicense")
    static let currentEmployment: AlertTemplateAction = .init("currentEmployment")
    static let packageStatus: AlertTemplateAction = .init("packageStatus")
    static let messages: AlertTemplateAction = .init("messages")
    static let refuse: AlertTemplateAction = .init("refuse")
    static let monetaryCompensation: AlertTemplateAction = .init("monetaryCompensation")
    static let status: AlertTemplateAction = .init("status")
    static let resume: AlertTemplateAction = .init("resume")
    static let exit: AlertTemplateAction = .init("exit")
    static let confirmReject: AlertTemplateAction = .init("confirmReject")
    static let confirm: AlertTemplateAction = .init("confirm")
    static let sharing: AlertTemplateAction = .init("sharing")
    static let licensePlates: AlertTemplateAction = .init("licensePlates")
    static let vehicleLicenseType: AlertTemplateAction = .init("vehicleLicenseType")
    static let vehicleReRegistrationStatus: AlertTemplateAction = .init("vehicleReRegistrationStatus")
    static let damagedPropertyRecovery: AlertTemplateAction = .init("damagedPropertyRecovery")
    static let damagedPropertyRecoveryStatus: AlertTemplateAction = .init("damagedPropertyRecoveryStatus")
    static let confirmRefusal: AlertTemplateAction = .init("confirmRefusal")
    static let publicServices: AlertTemplateAction = .init("publicServices")
    static let contacts: AlertTemplateAction = .init("contacts")
    static let documentTypeSelection: AlertTemplateAction = .init("documentTypeSelection")
    static let documentsAwardMinDigital: AlertTemplateAction = .init("document/award-min-digital")
    static let documentsAwardUnited24: AlertTemplateAction = .init("document/award-united24")
    static let birthCertificate: AlertTemplateAction = .init("birthCertificate")
    static let documentsVehicleLicense: AlertTemplateAction = .init("documents/vehicleLicense")
    static let educationDocument: AlertTemplateAction = .init("educationDocument")
    static let saveLicensePlate: AlertTemplateAction = .init("saveLicensePlate")
    static let sellWithLicensePlate: AlertTemplateAction = .init("sellWithLicensePlate")
    static let changeSelection: AlertTemplateAction = .init("changeSelection")
    static let useDocPhoto: AlertTemplateAction = .init("useDocPhoto")
    static let notUseDocPhoto: AlertTemplateAction = .init("notUseDocPhoto")
    static let hideDoc: AlertTemplateAction = .init("hideDoc")
    static let toMarriageRecords: AlertTemplateAction = .init("toMarriageRecords")
    static let toDivorceRecords: AlertTemplateAction = .init("toDivorceRecords")
    static let toNameChangeRecords: AlertTemplateAction = .init("toNameChangeRecords")
    static let toBirthCertificates: AlertTemplateAction = .init("toBirthCertificates")
    static let additionalInfo: AlertTemplateAction = .init("additionalInfo")
    static let sendWithoutInfected: AlertTemplateAction = .init("sendWithoutInfected")
    static let sendAdditionalInfoWithoutInfected: AlertTemplateAction = .init("sendAdditionalInfoWithoutInfected")
    static let vehicleExternalLink: AlertTemplateAction = .init("vehicleReRegistration/externalLink")
    static let vehicleReRegistration: AlertTemplateAction = .init("vehicleReRegistration")
    static let home: AlertTemplateAction = .init("home")
    static let rejectApplication: AlertTemplateAction = .init("rejectApplication")
    static let postOfficeAddressScheme: AlertTemplateAction = .init("postOfficeAddressScheme")
    static let courierAddressScheme: AlertTemplateAction = .init("courierAddressScheme")
    static let disability: AlertTemplateAction = .init("disability")
    static let application: AlertTemplateAction = .init("application")
    static let feed: AlertTemplateAction = .init("feed")
    static let veteranCertificate: AlertTemplateAction = .init("veteranCertificate")
    static let supportServiceScreen: AlertTemplateAction = .init("supportServiceScreen")
    static let cancelRepeatedDelivery: AlertTemplateAction = .init("cancelRepeatedDelivery")
    static let refill: AlertTemplateAction = .init("refill")
    static let documents: AlertTemplateAction = .init("documents")
    static let keepPaidLicensePlate: AlertTemplateAction = .init("keep_paid_license_plate")
    static let licensePlateChoiceWithoutForce: AlertTemplateAction = .init("license_plate_choice_without_force")
    static let saveLicensePlateTypeWithoutForce: AlertTemplateAction = .init("save_license_plate_type_without_force")
}

public struct AlertButtonModel: Codable {
    public let title: String?
    public let icon: String?
    public let action: AlertTemplateAction
    public let resource: String?
    
    public init(title: String?,
                icon: String?,
                action: AlertTemplateAction,
                resource: String? = nil
    ) {
        self.title = title
        self.icon = icon
        self.action = action
        self.resource = resource
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
        case resource
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
    
    public func actionButtonWith(action: AlertTemplateAction) -> AlertButtonModel? {
        let buttons = [self.data.mainButton, self.data.alternativeButton]
            .compactMap { $0 }
        return buttons.first(where: { $0.action == action })
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
