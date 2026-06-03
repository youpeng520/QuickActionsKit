import UIKit

public enum QuickActionsKit {
    private static var actions: [QuickActionItem] = []
    private static var onSelect: ((QuickActionItem) -> Void)?

    /// 注册快捷菜单（适合 AppDelegate）
    public static func setup(actions: [QuickActionItem]) {
        self.actions = actions
        apply()
    }

    /// 注册菜单并设置点击回调
    public static func setup(actions: [QuickActionItem], onSelect: @escaping (QuickActionItem) -> Void) {
        self.actions = actions
        self.onSelect = onSelect
        apply()
    }

    /// 进入后台前刷新菜单（按 availability 过滤）
    public static func refresh() {
        apply()
    }

    /// 处理用户选中的快捷项
    @discardableResult
    public static func handle(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
        guard let item = actions.first(where: { $0.type == shortcutItem.type }),
              let onSelect else { return false }
        onSelect(item)
        return true
    }

    /// 设置点击回调；冷启动时可传入 pendingShortcut
    public static func bind(
        pendingShortcut: UIApplicationShortcutItem? = nil,
        onSelect: @escaping (QuickActionItem) -> Void
    ) {
        self.onSelect = onSelect
        if let pendingShortcut {
            handle(pendingShortcut)
        }
    }

    /// 通用导航：已在目标页则跳过，否则回根再 push
    public static func pushIfNeeded(
        _ viewController: UIViewController,
        on navigationController: UINavigationController,
        excluding viewControllerType: UIViewController.Type
    ) {
        if navigationController.topViewController?.isKind(of: viewControllerType) == true { return }
        navigationController.popToRootViewController(animated: false)
        navigationController.pushViewController(viewController, animated: true)
    }

    private static func apply() {
        UIApplication.shared.shortcutItems = actions
            .filter { $0.availability() }
            .prefix(4)
            .map { item in
                UIApplicationShortcutItem(
                    type: item.type,
                    localizedTitle: item.title,
                    localizedSubtitle: item.subtitle,
                    icon: mapIcon(item.icon),
                    userInfo: nil
                )
            }
    }

    private static func mapIcon(_ icon: QuickActionItem.Icon?) -> UIApplicationShortcutIcon? {
        guard let icon else { return nil }
        switch icon {
        case .system(let name):
            return UIApplicationShortcutIcon(systemImageName: name)
        case .template(let name):
            return UIApplicationShortcutIcon(templateImageName: name)
        case .type(let type):
            return UIApplicationShortcutIcon(type: type)
        }
    }
}
