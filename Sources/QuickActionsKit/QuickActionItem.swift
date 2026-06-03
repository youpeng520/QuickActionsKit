import UIKit

public struct QuickActionItem {
    public let title: String
    public let type: String
    public var subtitle: String?
    public var icon: Icon?
    public var availability: () -> Bool

    public init(
        title: String,
        type: String,
        subtitle: String? = nil,
        icon: Icon? = nil,
        availability: @escaping () -> Bool = { true }
    ) {
        self.title = title
        self.type = type
        self.subtitle = subtitle
        self.icon = icon
        self.availability = availability
    }

    public enum Icon {
        case system(String)
        case template(String)
        case type(UIApplicationShortcutIcon.IconType)
    }
}
