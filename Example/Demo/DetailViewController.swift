import UIKit
import SnapKit

final class DetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "详情"
        view.backgroundColor = .secondarySystemBackground

        let label = UILabel()
        label.text = "通过快捷操作打开"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
