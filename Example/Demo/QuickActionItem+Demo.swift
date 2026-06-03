import UIKit
import QuickActionsKit

extension QuickActionItem {
    static let demoItems: [QuickActionItem] = [
        QuickActionItem(title: "回到首页", type: "home", icon: .type(.home)),
        QuickActionItem(title: "打开详情", type: "detail", icon: .system("doc.text")),
    ]

    func navigate(using navigationController: UINavigationController) {
        switch type {
        case "home":
            navigationController.popToRootViewController(animated: true)
        case "detail":
            QuickActionsKit.pushIfNeeded(
                DetailViewController(),
                on: navigationController,
                excluding: DetailViewController.self
            )
        default:
            break
        }
    }
}
