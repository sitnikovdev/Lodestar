import UIKit
import SnapKit

class BaseViewController<ViewModel: BaseViewModel>: UIViewController {
    
    private let viewModel: ViewModel

    private let loadingView = UIActivityIndicatorView(style: .large)

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLoadingView()
        bindViewModel()

        viewModel.onViewDidLoad()
    }

    func setupView() {
        // Override in subclasses
    }

    func bindViewModel() {
        viewModel.state.bind { [weak self] state in
            self?.render(state: state)
        }
    }

    func render(state: ViewState) {
        switch state {
        case .idle, .loaded, .empty, .error:
            hideLoading()

        case .loading:
            showLoading()

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
