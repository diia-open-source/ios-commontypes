
public struct SearchItemModel: SearchableItemModel {
    public let code: String
    public let title: String
    public let additionalText: String?
    public let searchText: String
    public let isEnabled: Bool
    public let componentId: String?

    public init(
        code: String,
        title: String,
        additionalText: String? = nil,
        searchText: String? = nil,
        isEnabled: Bool = true,
        componentId: String? = nil
    ) {
        self.code = code
        self.title = title
        self.additionalText = additionalText
        self.searchText = searchText ?? title
        self.isEnabled = isEnabled
        self.componentId = componentId
    }
}
