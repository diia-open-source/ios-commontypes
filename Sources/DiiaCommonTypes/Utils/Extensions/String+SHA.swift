import Foundation
import CommonCrypto

public extension String {
    func toSHA256() -> String? {
        guard let data = self.data(using: .utf8) else { return nil }
        
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes { _ = CC_SHA256($0.baseAddress, CC_LONG(self.count), &hash) }
        
        var sha256String = ""
        hash.forEach { sha256String += String(format: "%02x", UInt8($0)) }

        return sha256String
    }
    
    func toSHA1() -> String? {
        guard let data = self.data(using: .utf8) else { return nil }
        
        var hash = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes { _ = CC_SHA1($0.baseAddress, CC_LONG(self.count), &hash) }
        
        var sha1String = ""
        hash.forEach { sha1String += String(format: "%02x", UInt8($0)) }

        return sha1String
    }
}
