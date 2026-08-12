import UIKit
import SnapKit

class BaseViewController: UIViewController {

    private let loadingView = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLoadingView()
    }

    func setupView() {
        // Override in subclasses
    }

    func render(state: ViewState) {
        switch state {
        case .idle, .loaded:
            hideLoading()

        case .loading:
            showLoading()

        case .empty:
            hideLoading()

        case .error:
            hideLoading()
        }
    }

    private func setupLoadingView() {
        view.addSubview(loadingView)

        loadingView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    private func showLoading() {
        loadingView.startAnimating()
    }

    private func hideLoading() {
        loadingView.stopAnimating()
    }
}
