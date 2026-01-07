
import UIKit

public struct Action {
    public let title: String?
    public let image: UIImage?
    public let accessibilityDescription: String?
    public let callback: Callback
    
    public init(title: String? = nil,
                image: UIImage? = nil,
                accessibilityDescription: String? = nil,
                callback: @escaping Callback
    ) {
        self.title = title
        self.image = image
        self.accessibilityDescription = accessibilityDescription
        self.callback = callback
    }
    
    public init(title: String? = nil,
                iconName: String? = nil,
                accessibilityDescription: String? = nil,
                callback: @escaping Callback
    ) {
        self.title = title
        if let iconName = iconName, !iconName.isEmpty {
            self.image = UIImage(named: iconName)
        } else {
            self.image = nil
        }
        self.accessibilityDescription = accessibilityDescription
        self.callback = callback
    }
}
