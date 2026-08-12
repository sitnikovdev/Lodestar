import UIKit

final class HomeCoordinator {

  private let navigationController: UINavigationController
  private let dependencies: AppDependencyContainer

  init(
      navigationController: UINavigationController,
      dependencies: AppDependencyContainer
  ) {
     self.navigationController = navigationController
     self.dependencies = dependencies
  }

  func start() {
      let viewModel = HomeViewModel(
          healthDataService: dependencies.healthDataService
      )

      let viewController = HomeViewController(
          viewModel: viewModel
      )

      navigationController.setViewControllers(
          [viewController],
          animated: false
      )
  }
}
