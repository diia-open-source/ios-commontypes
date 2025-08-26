
import Foundation

public struct DiiaIdIdentifier: Codable {
    public let identifier: String
    public let signAlgo: DiiaIdSigningAlgo
    
    public init(identifier: String, signAlgo: DiiaIdSigningAlgo) {
        self.identifier = identifier
        self.signAlgo = signAlgo
    }
}

public enum DiiaIdSigningAlgo: String, Codable, EnumDecodable, CaseIterable {
    public static var defaultValue: DiiaIdSigningAlgo = .DSTU
    
    case DSTU
    case ECDSA
}

public struct HashedFile: Codable {
    public let fileName: String
    public let fileHash: String
    
    public init(fileName: String, fileHash: String) {
        self.fileName = fileName
        self.fileHash = fileHash
    }
}

public enum DiiaIdAction: String {
    case creation
    case signing
}

public enum DiiaIdSigningFlow {
    case `default`
    case declaration
}

public struct HashedFileList: Codable {
    public let hashedFiles: [HashedFile]
    public let signAlgo: DiiaIdSigningAlgo?
    
    public init(hashedFiles: [HashedFile], signAlgo: DiiaIdSigningAlgo?) {
        self.hashedFiles = hashedFiles
        self.signAlgo = signAlgo
    }
}
