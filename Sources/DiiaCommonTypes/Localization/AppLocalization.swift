
import Foundation

public final class AppLocalization: @unchecked Sendable {
    public static let shared = AppLocalization()

    // MARK: - Properties
    public private(set) var language: AppLanguage = .uk

    // MARK: - Init
    private init() {}

    // MARK: - Public Methods
    public func setup(language: AppLanguage) {
        self.language = language
        object_setClass(Bundle.main, LocalizedMainBundle.self)
    }

    public func change(language: AppLanguage) {
        self.language = language
    }

    public func localizedString(forKey key: String, table: String?, in bundle: Bundle) -> String? {
        let currentLanguage = language
        let languages = currentLanguage == .uk ? [AppLanguage.uk] : [currentLanguage, .uk]
        for language in languages {
            guard let languageBundle = languageBundle(for: language, in: bundle) else { continue }
            let value = languageBundle.localizedString(forKey: key, value: Constants.missingValue, table: table)
            if value != Constants.missingValue {
                return value
            }
        }
        return nil
    }

    // MARK: - Private Methods
    private func languageBundle(for language: AppLanguage, in bundle: Bundle) -> Bundle? {
        return bundle
            .path(forResource: language.rawValue, ofType: Constants.lprojExtension)
            .flatMap { Bundle(path: $0) }
    }
}

// MARK: - Constants
extension AppLocalization {
    private enum Constants {
        static let lprojExtension = "lproj"
        static let missingValue = "\u{0}"
    }
}

private final class LocalizedMainBundle: Bundle, @unchecked Sendable {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        return AppLocalization.shared.localizedString(forKey: key, table: tableName, in: self)
            ?? super.localizedString(forKey: key, value: value, table: tableName)
    }
}
