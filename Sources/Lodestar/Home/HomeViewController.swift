import SnapKit
import UIKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    private let titleLabel = UILabel()

    override func setupView() {
        view.backgroundColor = .systemBackground

        titleLabel.text = "Lodestar"
        titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        titleLabel.textAlignment = .center

        view.addSubview(titleLabel)

        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    override func render(state: ViewState) {
        super.render(state: state)

        switch state {
        case .loaded:
            titleLabel.text = "Lodestar"
        case .loading:
            titleLabel.text = "Loading..."
        case .empty:
            titleLabel.text = "No data"
        case .error:
            titleLabel.text = "Something went wrong"
        case .idle:
            break
        }
    }
}
