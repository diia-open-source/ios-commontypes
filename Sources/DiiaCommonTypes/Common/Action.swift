
import UIKit

public struct Action {
    public let title: String?
    public let image: UIImage?
    public let callback: Callback
    
    public init(title: String? = nil,
                image: UIImage? = nil,
                callback: @escaping Callback
    ) {
        self.title = title
        self.image = image
        self.callback = callback
    }
    
    public init(title: String? = nil,
                iconName: String? = nil,
                callback: @escaping Callback
    ) {
        self.title = title
        if let iconName = iconName, !iconName.isEmpty {
            self.image = UIImage(named: iconName)
        } else {
            self.image = nil
        }
        self.callback = callback
    }
}
